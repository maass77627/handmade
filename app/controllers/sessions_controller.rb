class SessionsController < ApplicationController
  
  def create
    user = User.find_by(username: params[:username])
   if user && user.authenticate(params[:password])
      session[:user_id] = user.id
       current_cart.user = current_user
       current_cart.save
      redirect_to '/'
   else
      redirect_to '/login'
   end
    end

    def destroy
      session.delete(:user_id)
      session.delete(:shopping_cart_id)
      @current_user = nil
      redirect_to '/'
    end
end 