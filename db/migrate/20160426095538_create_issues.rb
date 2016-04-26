class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.text :content
      t.text :address
      t.references :customer, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :issues, [:customer_id, :created_at]
  end
end
