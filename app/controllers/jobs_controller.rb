class JobsController < ApplicationController 
    before_action :set_job, only:[:show, :edit, :update, :destroy]
    before_action :set_company

    def index 
        @jobs = Job.all 
    end 

    def new 
        @company = Company.find_by(id: params[:company_id])
        @job = Job.new 
        @job.category = Category.new
    end 

    def create 
        
        @category = find_category 
        if @category 
        #     @job = Job.new(whitelist(job_params, @category.id))
            @job = Job.new(job_params)
        # else 
        #     @category = Category.create(name: job_params[:category][:name], work_type: job_params[:category][:work_type])
        #     @job = Job.new(whitelist(job_params, @category.id))
        end 
        
        if @job.save 
            redirect_to company_job_path(@job.company.id, @job)
        else
            redirect_to new_company_job_path(@job.company.id, @job)
        end 
    end 

    def show
    end 

    def edit 
    end 

    def update 
        if @job.update(job_params)
            redirect_to company_job_path(@job.company.id, @job)
        else 
            redirect_to edit_company_job_path(@job.company.id, @job)
        end 
    end 

    def destroy 
        #should a job be destroyed?
    end 

private 

    def set_user 
        @user = current_user if current_user
    end 

    def set_job
        @job = Job.find_by_id(params[:id])
    end 

    def set_company 
        @company = Company.find_by_id(params[:id])
    end 

    def find_category 
        @category = Category.find_or_create_by(name: params[:job][:category_attributes][:name])
    end 

    def job_params 
        params.require(:job).permit(
            :address,
            :duration,
            :notes,
            :job_type,
            :builder_name,
            :user_id,
            :company_id,
            :category_attributes => [:id, :name, :work_type]
        )
    end 

    # def whitelist(job_params, cat_id)
    #     {address: job_params[:address], duration: job_params[:duration], notes: job_params[:notes], job_type: job_params[:job_type], builder_name: job_params[:builder_name], user_id: current_user.id, company_id: job_params[:company_id], category_id: cat_id}
    # end 

end 
