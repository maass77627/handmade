class ApplicationController < ActionController::Base
    helper_method :current_user
    helper_method :logged_in?
    helper_method :current_cart
    before_action :current_cart
    
    def current_user    
        User.find_by(id: session[:user_id])  
    end
    
    def current_cart
        if session[:shopping_cart_id]
            @current_cart ||= ShoppingCart.find(session[:shopping_cart_id])
          end
          if session[:shopping_cart_id].nil?
            @current_cart = ShoppingCart.create!
            session[:shopping_cart_id] = @current_cart.id
          end
          @current_cart
        end
    
    def logged_in?
        !current_user.nil?  
    end

    def authenticated?
        redirect_to '/' unless logged_in?
    end

    def index
    end 
end
