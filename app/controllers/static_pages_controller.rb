class StaticPagesController < ApplicationController
  def home
  	if signed_in? 
  		redirect_to posts_path
  	end	
  end

  def about
  end

  def contact
  end
end
