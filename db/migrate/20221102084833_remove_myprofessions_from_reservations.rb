class RemoveMyprofessionsFromReservations < ActiveRecord::Migration[7.0]
  def change
    remove_reference :reservations, :my_profession, null: false, foreign_key: true
  end
end
