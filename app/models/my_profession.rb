class MyProfession < ApplicationRecord
  belongs_to :profession
  belongs_to :profile
  validates :profile, uniqueness: { scope: :profession }


end
