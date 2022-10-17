class ChangeStartDateToReservations < ActiveRecord::Migration[7.0]
  def change
    change_column :reservations, :start_date, :datetime
    change_column :reservations, :end_date, :datetime
  end
end
