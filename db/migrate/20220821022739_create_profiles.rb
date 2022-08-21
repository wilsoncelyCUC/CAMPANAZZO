class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :last_name
      t.date :birthday
      t.string :type_profile
      t.string :type_professional
      t.string :country
      t.string :city
      t.string :address
      t.string :personal_number
      t.integer :score
      t.integer :number_jobs
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
