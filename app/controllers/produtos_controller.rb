    class ProdutosController < ApplicationController
    def index
        @produtos = Produto.all
        render json: @produtos
    end

    def create
        puts "Creating produto with params: #{produto_params.inspect}"

        @produto = Produto.new(produto_params)

        if Produto.find_by(name: @produto.name)
            render json: { error: "Produto com esse nome já existe" }, status: :conflict
            return
        end

        if @produto.save
            render json: @produto, status: :created
        else
            render json: @produto.errors, status: :unprocessable_entity
        end
    end

    def destroy
        produto = Produto.find(params[:id])

        if produto.soft_delete
            render json: { message: "Produto removido com sucesso." }, status: :ok
        else
            render json: { error: "Falha ao remover produto." }, status: :unprocessable_entity
        end

        rescue ActiveRecord::RecordNotFound
        render json: { error: "Produto não encontrado." }, status: :not_found
    end

    def show
        @produto = Produto.find(params[:id])
        render json: @produto
    end

    def update
        @produto = Produto.find(params[:id])
        if @produto.update(produto_params)
            render json: @produto
        else
            render json: @produto.errors, status: :unprocessable_entity
        end
    end
    

    private

    def produto_params
        params.require(:produto).permit(:name, :price, :description, :quantity)
    end

    end
