class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :authenticate_user!
  
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :role])
      #devise_parameter_sanitizer.permit(:accept_invitation, keys: [:role])
      #devise_parameter_sanitizer.permit(:invite, keys: [:role])
    end
  
    # def after_sign_in_path_for(resource)
    #   if current_user.role == "performer" 
    #     new_performer_path
    #   elsif current_user.role == "partner"
    #     new_partner_path
    #   elsif current_user.role == "admin"
    #     root_path
    #   end 
    # end
  
  
    # def after_sign_out_path_for(resource)
    #   "/users/sign_in"
    # end 
end
