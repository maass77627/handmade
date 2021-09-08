class ProductsController < ApplicationController
    skip_before_action :verify_authenticity_token, :only => :create

    def index
        @products = Product.search(params[:search])
    end

    def new 
        @product = Product.new
    end 

    def create
        @product = Product.create(product_params)
        redirect_to products_path
    end 

    def edit
        @product = Product.find(params[:id])
      end
    
      def update
        @product = Product.find(params[:id])
        @product.update(product_params)
        redirect_to products_path
      end

    def show
        @product = Product.find_by(id: params[:id])
    end

    def destroy
        @product = Product.find_by(id: params[:id])
        if @product
          @product.destroy
          head :no_content
        else
          render json: { error: "product not found" }, status: :not_found
        end
      end 

    private 

    def product_params
        params.require(:product).permit(:name, :craft, :category, :price, :description, :avatar, :search)
    end 
end
