class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :authenticate_user!

    include CurrentUserConcern
  
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :username, :phone_number, :occupation, :hourly_rate])
    end
  
    def after_sign_in_path_for(resource)
      if current_user
        user_show_path(current_user)
      else 
        "/users/sign_in"
      end 
    end
  
  
    def after_sign_out_path_for(resource)
      "/users/sign_in"
    end 
end
