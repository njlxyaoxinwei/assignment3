class PostsController < ApplicationController
	before_filter :signed_in_user

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
    	
    end

	def destroy
	end

end