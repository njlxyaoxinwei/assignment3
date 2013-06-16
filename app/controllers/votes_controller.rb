class VotesController < ApplicationController
	before_filter :signed_in_user

	def create
		#raise params.to_yaml
		@post = Post.find(params[:post])
		@vote = Vote.new
		@vote.up=params[:up]
		@vote.user_id=params[:user]
		@vote.post_id=params[:post]
		if @vote.save
			flash[:success] = "Vote created!"
			redirect_to	post_path(@post)
		else
		    flash[:error] = "You already voted!"
		    redirect_to post_path(@post)
		end    	
	end

	def destroy
		Vote.find(params[:id]).destroy
		flash[:success] = "Vote destroyed!"
		redirect_to post_path(params[:post])
	end



end
