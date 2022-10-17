class Profession < ApplicationRecord
  UNIT = ["Persona", 'Hora', 'Dia']
  CURRENCY = ["$"]
  has_many :my_professions, dependent: :destroy


end
