class CommentsController < ApplicationController
	before_filter :signed_in_user
	before_filter :admin_user,     only: :destroy

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
		comment_ = Comment.find(params[:id])
		post_id = comment_.post_id
		comment_.destroy
		flash[:success] = "Comment destroyed!"
		redirect_to post_path(post_id)
	end
end
