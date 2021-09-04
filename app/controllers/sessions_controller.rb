class SessionsController < ApplicationController

# def new

# end
  
  def create
    user = User.find_by(username: params[:username])
   if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      # user.shopping_cart = current_cart
      # user.save
      # byebug
       current_cart.user = current_user
       current_cart.save
      # byebug
      redirect_to '/'
   else
      redirect_to '/login'
   end
    end

    def destroy
      session.delete(:user_id)
      @current_user = nil
      redirect_to '/'
    end
end 