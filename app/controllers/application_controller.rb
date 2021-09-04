class ApplicationController < ActionController::Base
    helper_method :current_user
    helper_method :logged_in?
    helper_method :current_cart
    # before_action :authenticated?, :current_user, :current_shopping_cart
     before_action :current_cart
    #   before_action :current_shopping_cart, if: :current_user
    def current_user    
        User.find_by(id: session[:user_id])  
    end
    
    def current_cart
        if session[:shopping_cart_id]
            @current_cart ||= ShoppingCart.find(session[:shopping_cart_id])
            # session[:cart_id] = nil if @current_cart.purchased_at
          end
          if session[:shopping_cart_id].nil?
            @current_cart = ShoppingCart.create!
            session[:shopping_cart_id] = @current_cart.id
          end
          @current_cart
        end
    #   end
#         if session[:shopping_cart_id] == nil
#             @shopping_cart = ShoppingCart.create
#              session[:shopping_cart_id] = @shopping_cart.id
#              current_cart = @shopping_cart
#              current_cart
#         else 
#           @shopping_cart = ShoppingCart.find(session[:shopping_cart_id])
#             @shopping_cart = current_cart
#             current_cart
#     end
# end
    
    
    def logged_in?
        !current_user.nil?  
    end

    def authenticated?
        redirect_to '/' unless logged_in?
    end

    def index
    end 
end
