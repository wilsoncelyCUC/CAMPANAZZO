class ChangeProfileToUser < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :type_profile, :string

  end
end
