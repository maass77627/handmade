class ShoppingCartsController < ApplicationController
def index
    @shopping_carts = ShoppingCart.all
end

def new
    @shopping_cart = ShoppingCart.new
end 

def create
    @shopping_cart = ShoppingCart.create(params.require(:shopping_cart).permit(:id))
end

def show
    @shopping_cart = current_cart
     #byebug
end 

end