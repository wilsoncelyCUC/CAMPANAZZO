class ChangeDateToPost < ActiveRecord::Migration[7.0]
  def change
    change_column :posts, :date, :datetime
  end
end
