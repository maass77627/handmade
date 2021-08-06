class ProductsController < ApplicationController
    skip_before_action :verify_authenticity_token, :only => :create

    def index
        @products = Product.search(params[:search])
        # render json: products
    end

    def new 
        @product = Product.new
    end 

    def create
        # byebug
        @product = Product.create(product_params)
        # render json: product, status: :created
    end 

    # def update
    #     product = Product.find_by(id: params[:id])
    #     if product
    #       product.update(likes: product.likes + 1)
    #       render json: product
    #     else
    #       render json: { error: "product not found" }, status: :not_found
    #     end
    # end

    def show
        @product = Product.find_by(id: params[:id])
        # if product
        #     render json: product
        # else 
        #     render json: {error: "Product not found"}
        # end
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
