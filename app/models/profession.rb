class Profession < ApplicationRecord
  UNIT = ["Persona", 'Hora', 'Dia', 'Trabajo', 'Clase', 'Sesión']
  CURRENCY = ["$"]
  PROFESSION = ["Albañil","Arquitecto", "Autos", "Manicurista", "Peluquero a domicilio", "Manicurista a domicilio", "Depiliación en casa", "Estética facial a domicilio", "Entrenador personal", "Asesor de nutrición", "Sonido a domicilio", "Animadores a domicilio", "Payasos a domicilio", "Meseros a domicilio", "Decoración a domicilio", "Catering a domicilio", "Reposteria a domicilio", "Coctelería a domicilio", "Pintor" ]
  has_many :my_professions, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :profiles, through: :my_professions
  has_one_attached :photo

  validates :name, uniqueness: true
  validates :name, presence: true

end
