class AddApprovedToCompany < ActiveRecord::Migration
  def change
    add_column :companies, :approved, :boolean
  end
end
