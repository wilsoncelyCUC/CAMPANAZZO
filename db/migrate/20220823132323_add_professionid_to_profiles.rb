class AddProfessionidToProfiles < ActiveRecord::Migration[7.0]
  def change
    add_reference :profiles, :profession, foreign_key: true
  end
end
