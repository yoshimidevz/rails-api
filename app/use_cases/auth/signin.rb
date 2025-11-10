module UseCases
  module Auth
    class Signin < Base
      include AuthHelper

      def call
        find_user
        authenticate
      rescue ::UseCases::CustomException => e
        { error: e.message, code: e.code }
      rescue Exception => e
        { error: e.message, code: 500 }
      end

      def find_user
        @user = ::User.find_by_email(@params[:email])
      end

      def authenticate 
        if @user&.authenticate(@params[:password])
          encode_token(@user)
        else
          raise ::UseCases::CustomException.new("password or email incorrect", 403)
        end
      end
    end
  end
end