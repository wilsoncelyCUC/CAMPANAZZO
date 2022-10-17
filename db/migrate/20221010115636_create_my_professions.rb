class CreateMyProfessions < ActiveRecord::Migration[7.0]
  def change
    create_table :my_professions do |t|
      t.references :profession, null: false, foreign_key: true
      t.references :profile, null: false, foreign_key: true
      t.string :year
      t.integer :price_hour
      t.integer :price_day

      t.timestamps
    end
  end
end
