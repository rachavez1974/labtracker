class CreateExperiments < ActiveRecord::Migration
  def change
    create_table :experiments do |t|
      t.string :name
      t.string :description
      t.integer :lab_id

      t.timestamps null: false
    end
  end
end
