class ApplicationController < ActionController::Base
    
    private def current_user
        user.find_by(id: session[:user_id])
        if session[:user_id]
        end
        helper_method :current_user
    end
end
