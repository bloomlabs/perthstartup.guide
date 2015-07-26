class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.float :lat
      t.float :lng
      t.string :address
      t.string :name
      t.string :type

      t.timestamps null: false
    end
  end
end
