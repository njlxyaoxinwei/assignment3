
# These are actually the helper functions for the entire app, 
# available in both controllers and views, as I included them 
# in the application controller


module SessionsHelper
	def sign_in(user)
		cookies.permanent[:remember_token] = user.remember_token #expire 20 years from now
		self.current_user = user
	end

	def current_user=(user)
		@current_user = user
	end

	def current_user
		@current_user ||= User.find_by_remember_token(cookies[:remember_token])
	end

	def current_user?(user)
		user == current_user
	end

    def signed_in_user
      store_location
      redirect_to signin_path, notice: "Please sign in." unless signed_in?
    end
    
	def redirect_back_or(default)
		redirect_to(session[:return_to] || default)
		session.delete(:return_to)
	end

	def store_location #So that after signing in, the page will go to where it was intended
		session[:return_to] = request.url
	end



	def signed_in?
		!current_user.nil?
	end

	def sign_out
		self.current_user = nil
		cookies.delete :remember_token
	end

	 def admin_user
      redirect_to(root_path) unless current_user.admin?
    end
end
