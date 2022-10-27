class Post < ApplicationRecord
  #belongs_to :customer, class_name: 'Profile', foreign_key: "profile_id"
  belongs_to :customer, class_name: 'Profile', foreign_key: "profile_id"
  has_one_attached :photo
  belongs_to :profession
  has_many :reservations, dependent: :destroy
  has_many :reviews, dependent: :destroy


  #for Post quick assessment
  hard = 1
  moderate = 2
  difficult = 3

  ASSESSMENT = ["#{hard} hora", "#{moderate} horas", "#{difficult} horas"]
  STATE = ['Open','Closed']
  VALIDATED = ['Si', 'No']
  TRANSPORT = ['Small car', 'Small truck', 'big truck', 'Not required']
  AVAILABILITY_48 = ['Si', 'No']



end
