class AddNotesToJobs < ActiveRecord::Migration[5.2]
  def change
    add_column :jobs, :ticketed_work_1, :string
    add_column :jobs, :ticketed_work_2, :string
    add_column :jobs, :ticketed_work_3, :string
    add_column :jobs, :ticketed_work_4, :string
    add_column :jobs, :ticketed_work_5, :string
    add_column :jobs, :ticketed_work_6, :string
  end
end
