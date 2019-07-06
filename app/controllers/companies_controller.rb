class CompaniesController < ApplicationController 
    before_action :set_user
    before_action :set_company, only: [:show, :edit, :update]
    before_action :has_permissions?, only: [:edit, :update]
    before_action :is_admin?, only: [:destroy]

    def index 
        @companies = Company.all
    end 

    def new
        @company = Company.new 
    end 

    def create
        @company = Company.find_by(name: params[:company][:name])
        if !@company 
            @company = Company.create(company_params)
            current_user.companies << @company
            redirect_to company_path(@company)
        else  
            byebug
            # if @company.users.find(current_user.id)
            #     @company.users << current_user
            redirect_to new_company_path
        end 
    end 

    def show 
    end 

    def edit 
    end 

    def update 
        if @company.update(company_params)
            redirect_to company_path(@company)
        else 
            redirect_to edit_company_path(@company)
        end 
    end 

    def destroy 

    end 


    private 

    def set_user 
        @user = current_user if current_user
    end 

    def set_company 
        @company = Company.find_by_id(params[:id])
    end 

    #not needed, companies scoped to current user
 


    def company_params 
        params.require(:company).permit(
            :name,
            :hourly_pay_rate,
            :phone_number,
            :website,
            :user_id
        )
    end 
end 