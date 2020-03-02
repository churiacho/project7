class CreateActivities < ActiveRecord::Migration[6.0]
  def change
    create_table :activities do |t|
      t.integer :name
      t.date :date_field
      t.integer :duration_minutes
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
