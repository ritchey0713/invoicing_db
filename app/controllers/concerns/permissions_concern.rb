module PermissionsConcern 
    extend ActiveSupport::Concern

    def has_permissions? 
        if !current_user.companies.find_by(name: @company.name) 
            redirect_to errors_path
        end 
    end 

    def is_admin? 
        !!current_user.role == "Admin"
    end 
    
end 

