class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.float :latitude
      t.float :longitude
      t.string :address
      t.string :name
      t.string :type_of

      t.timestamps null: false
    end
  end
end
