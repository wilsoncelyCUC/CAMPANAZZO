class AddProfileToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :type_profile, :boolean
  end
end
