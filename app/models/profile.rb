class Profile < ApplicationRecord
  belongs_to :user

  validates :phone_number, presence: true, on: :sms_send
  with_options presence: true, on: :value  do
    validates  :postalcode, :prefecture, :city, :street_number
  end
end
