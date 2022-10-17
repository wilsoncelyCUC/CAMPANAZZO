class RemoveProfessionsToProfile < ActiveRecord::Migration[7.0]
  def change
    remove_reference :profiles, :profession, foreign_key: true
  end
end
