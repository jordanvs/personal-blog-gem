module PersonalBlog
  class ApplicationController < ActionController::Base
    helper_method :admin?

    protected

    def admin?
      session[:password] == ENV["blog_password"] 
    end

    def authorize
      unless admin?
        flash[:error] = "unauthorized access"
        redirect_to login_path 
        false
      end
    end

 end
end
