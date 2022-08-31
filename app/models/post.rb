class Post < ApplicationRecord
  #belongs_to :customer, class_name: 'Profile', foreign_key: "profile_id"
  belongs_to :customer, class_name: 'Profile', foreign_key: "profile_id"
  has_one_attached :photo
  belongs_to :profession

  ASSESSMENT = ['1 hora', '2 horas', '3 horas']
  STATE = ['Open','Closed']
  VALIDATED = ['Si', 'No']
  TRANSPORT = ['Small car', 'Small truck', 'big truck', 'Not required']
  AVAILABILITY_48 = ['Si', 'No']
end
