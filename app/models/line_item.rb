class LineItem < ApplicationRecord
    belongs_to :product
    belongs_to :shopping_cart
    # belongs_to :order

    # def add_quantity
    #     @line_item = LineItem.find_by(params[:id])
    #     @line_item.quantity += 1
    #     @line_item.save
    #     redirect_to shopping_cart_path(@current_cart)
    #   end
    
    def total_price
        # byebug
        self.quantity * self.product.price
    end
end 
