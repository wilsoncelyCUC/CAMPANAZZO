class AddCarrierToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :carrier, :string
  end
end
