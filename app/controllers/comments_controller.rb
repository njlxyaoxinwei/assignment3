class CommentsController < ApplicationController
	before_filter :signed_in_user

	def create
		#raise params.to_yaml
		@comment = Comment.new(params[:comment], without_protection: true)
		if @comment.save
			flash[:success] = "Comment created!"
			redirect_to post_path(@comment.post_id)
		else 
			flash[:fail] = "Please write the content"
			redirect_to post_path(@comment.post_id)
		end	
	end

	def destroy
	end
end
