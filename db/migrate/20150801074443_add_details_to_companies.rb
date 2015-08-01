class AddDetailsToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :description, :text
    add_column :companies, :link, :string
  end
end
