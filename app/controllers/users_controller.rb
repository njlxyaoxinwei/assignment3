class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:index, :edit, :update, :destroy]
  before_filter :correct_user,   only: [:edit, :update]
  before_filter :admin_user,     only: :destroy

  def index
    @users = User.paginate(page: params[:page])
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.paginate(page: params[:page])
    @comments = @user.comments.paginate(page: params[:page])
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
  	if @user.save
      sign_in @user
      flash[:success] = "Welcome to Reddit Demo!"
      redirect_to user_path(@user.id) #A way to refer to the action, here is the index action
    else
      render 'new'
    end
  end	

  def edit

  end

  def update
  	if @user.update_attributes params[:user]
      flash[:success] = "Profile updated"
      sign_in @user
  	  redirect_to user_path(@user)
    else 
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_url
  end

  private



    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user) || current_user.admin?
    end

    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end
end