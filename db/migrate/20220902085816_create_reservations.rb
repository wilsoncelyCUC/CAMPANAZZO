class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.references :post, null: false, foreign_key: true
      t.references :profile, null: false, foreign_key: true
      t.date :start_date
      t.date :end_date
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
