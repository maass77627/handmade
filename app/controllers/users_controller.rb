class UsersController < ApplicationController

def index
    @users = User.all
end 

def new 
    @user = User.new
end

def create
    @user = User.create(params.require(:user).permit(:username, :password))
    session[:user_id] = @user.id
    redirect_to '/'
end

def show
    @user = User.find(params[:id])
end 

end 