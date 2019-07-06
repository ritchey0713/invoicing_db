module CurrentUserConcern 
    extend ActiveSupport::Concern
    def find_companies # set companies index
        current_user.companies.all if current_user
    end 

    def find_jobs # set jobs index
        current_user.jobs.all if current_user
    end 
end 