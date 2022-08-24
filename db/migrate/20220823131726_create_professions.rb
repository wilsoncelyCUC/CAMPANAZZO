class CreateProfessions < ActiveRecord::Migration[7.0]
  def change
    create_table :professions do |t|
      t.string :name
      t.integer :recommended_price
      t.string :currency

      t.timestamps
    end
  end
end
