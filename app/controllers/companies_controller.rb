class CompaniesController < ApplicationController 
    before_action :set_user

    def index 
        @companies = find_companies 
    end 

    def new

    end 

    def create

    end 

    def show 

    end 

    def edit 

    end 

    def update 

    end 

    def destroy 

    end 



    private 

    def set_user 
        @user = current_user if current_user
    end 


    def company_params 
        params.require(:company).permit(
            :name,
            :hourly_rate,
            :phone_number,
            :website,
            :user_id
        )
    end 
end 