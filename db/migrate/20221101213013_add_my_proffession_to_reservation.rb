class AddMyProffessionToReservation < ActiveRecord::Migration[7.0]
  def change
    add_reference :reservations, :my_profession, foreign_key: true
  end
end
