class CreateJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :jobs do |t|
      t.string :address 
      t.integer :duration 
      t.string :notes
      t.string :job_type
      t.string :builder_name
    end
  end
end
