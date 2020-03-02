class AddColumnsToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :age, :integer
    add_column :users, :bio, :text
    # add_column :users, :profile_pic, :string
  end
end
