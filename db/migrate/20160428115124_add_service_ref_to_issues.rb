class AddServiceRefToIssues < ActiveRecord::Migration
  def change
    add_reference :issues, :service, index: true, foreign_key: true
  end
end
