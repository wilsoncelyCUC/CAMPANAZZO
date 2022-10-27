class Review < ApplicationRecord
  belongs_to :post
  belongs_to :profile
  belongs_to :my_profession
end
