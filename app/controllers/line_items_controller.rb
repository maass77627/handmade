class LineItemsController < ApplicationController

    
    def create
        chosen_product = Product.find(params[:product_id])
        current_cart = @current_cart
      if current_cart.products.include?(chosen_product)
          @line_item = current_cart.line_items.find_by(:product_id => chosen_product)
          @line_item.quantity += 1
        else
          @line_item = LineItem.new
          @line_item.shopping_cart = current_cart
          @line_item.product = chosen_product
          # @line_item.add_quantity
        end
           @line_item.save
            @line_item.quantity += 1
            redirect_to shopping_cart_path(current_cart) 
      end

      #   def add_quantity
      #   @line_item = LineItem.find(params[:id])
      #   @line_item.quantity += 1
      #   @line_item.save
      #   redirect_to shopping_cart_path(@current_cart)
      # end
      
      def reduce_quantity
        @line_item = LineItem.find(params[:id])
        if @line_item.quantity > 1
          @line_item.quantity -= 1
        end
        @line_item.save
        redirect_to cart_path(@current_cart)
      end


   
      
      private
        def line_item_params
          params.require(:line_item).permit(:quantity,:product_id, :shopping_cart_id)
        end
end
