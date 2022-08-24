class AddUnitToProfessions < ActiveRecord::Migration[7.0]
  def change
    add_column :professions, :unit, :string
    add_column :professions, :url_photo, :string
  end
end
