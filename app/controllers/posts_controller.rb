class PostsController < ApplicationController
	before_filter :signed_in_user
	before_filter :admin_user,     only: :destroy

    def index
    	@posts=Post.paginate(page: params[:page])
    	@post = current_user.posts.build
    end

	def create
		@post = current_user.posts.build(params[:post])
		if @post.save
			flash[:success] = "Post created!"
			redirect_to post_path(@post)
		else
			render 'new'
		end
	end


    def show
    	@post=Post.find(params[:id])
    	@comments = @post.comments.paginate(page: params[:page])
    	@comment = @post.comments.build
    end

	def destroy
		Post.find(params[:id]).destroy
		flash[:success] = "Post destroyed!"
		redirect_to posts_path
	end

end