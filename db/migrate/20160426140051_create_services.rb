class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :name
      t.string :photo

      t.timestamps null: false
    end
  end
end
