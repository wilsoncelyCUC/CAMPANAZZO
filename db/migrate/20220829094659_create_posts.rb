class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :name
      t.date :date
      t.string :description
      t.string :url_video
      t.string :transport
      t.string :address
      t.boolean :validated
      t.string :quick_assessment
      t.boolean :experienced
      t.boolean :available_48
      t.string :state
      t.references :profile, null: false, foreign_key: true
      t.references :profession, null: false, foreign_key: true

      t.timestamps
    end
  end
end
