    class ProdutosController < ApplicationController
    def index
        @produtos = Produto.all
        render json: @produtos
    end

    def create
        puts "Creating produto with params: #{produto_params.inspect}"

        @produto = Produto.new(produto_params)

        if Produto.find_by(name: @produto.name)
            render json: { error: "Produto with this name already exists" }, status: :conflict
            return
        end

        if @produto.save!
            render json: @produto, status: :created
        else
            render json: @produto.errors, status: :unprocessable_entity
        end
    end

    private

    def produto_params
        params.require(:produto).permit(:name, :price, :description, :quantity)
    end
    end
