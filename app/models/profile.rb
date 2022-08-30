class Profile < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  has_many :posts

  #Filter
  TYPE_PROFILE = ['Customer', 'Professional']
  DATE=["Hoy", "Max en 3 Días", "Max en 7 Días", "Elegir Fecha"]
  HOUR=["Mañana (8:00 - 12:00)", "Tarde (12:00 - 17:00)", "Noche (17:00 - 21:00)"]
  TYPE_SUPER = ["Elite", "Bueno Bonito y Barato"]
end
