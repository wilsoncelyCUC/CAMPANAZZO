class MyProfession < ApplicationRecord
  belongs_to :profession
  belongs_to :profile
  validates :profile, uniqueness: { scope: :profession }
  has_many :reviews, dependent: :destroy
  has_many :reservations



end
