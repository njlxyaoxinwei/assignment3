class UsersController < ApplicationController
  
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
  	@user = User.new
  end
  
  def create
  	#raise params.to_yaml  ;a hack that shows the param hash in the error code in the webpage
  	#@user = User.new(params[:user])
  	#@user.name = params[:user][:name]
  	#@user.email = params[:user][:email]
  	@user = User.create(params[:user]) #new and save
  	redirect_to users_path #A way to refer to the action, here is the index action
  end	

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
  	@user.update_attributes params[:user]
  	redirect_to user_path(@user)
  end


end