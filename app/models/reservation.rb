class Reservation < ApplicationRecord
  belongs_to :post
  belongs_to :profile
end
