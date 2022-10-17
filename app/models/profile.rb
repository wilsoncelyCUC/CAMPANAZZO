class Profile < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  has_many :posts, dependent: :destroy
  has_many :reservations, dependent: :destroy
  has_many :my_professions, dependent: :destroy

  #Filter
  TYPE_PROFILE = ['Customer', 'Professional']
  DATE=["Hoy", "Max en 3 Días", "Max en 7 Días", "Elegir Fecha"]
  HOUR=["Mañana (8:00 - 12:00)", "Tarde (12:00 - 17:00)", "Noche (17:00 - 21:00)"]
  TYPE_PROFESSIONAL = ["Elite", "Bueno Bonito y Barato"]
  PRICE = ['20 y 50 kCOP', '51 y 70 kCOP', '+ de 70 kCOP' ]

  #PG Search
  include PgSearch::Model
    # it filters out profiles by a job category wanted by the customer
    pg_search_scope :pgsearch_super,
    against: [ :type_professional ],
    using: {
      tsearch: { prefix: true }
    }

    def available?(from, to)
      reservations.where('start_date <= ? AND end_date >= ?', to, from).none?
    end

end
