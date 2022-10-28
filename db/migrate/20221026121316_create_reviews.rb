class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.references :post, null: false, foreign_key: true
      t.references :profile, null: false, foreign_key: true
      t.references :my_profession, null: false, foreign_key: true
      t.string :description
      t.integer :score

      t.timestamps
    end
  end
end
