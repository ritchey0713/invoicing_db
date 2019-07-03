class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.string :name 
      t.integer :hourly_pay_rate 
      t.string :phone_number
      t.string :website 
    end
  end
end
