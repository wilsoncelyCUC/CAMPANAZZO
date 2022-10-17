class AddBioToMyProfessions < ActiveRecord::Migration[7.0]
  def change
    add_column :my_professions, :bio, :text
  end
end
