class AddAddressdetailsToIssues < ActiveRecord::Migration
  def change
    add_column :issues, :zip, :string
    add_column :issues, :city, :string
  end
end
