class AddUsersCompaniesCategoriesToJobs < ActiveRecord::Migration[5.2]
  def change
    add_column :jobs, :user_id, :integer
    add_column :jobs, :company_id, :integer
    add_column :jobs, :category_id, :integer
  end
end
