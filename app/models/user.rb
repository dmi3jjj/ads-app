class User < ActiveRecord::Base
  VALID_PHONE_REGEX = /\A\d{9,10}\z/i
  validates :phone, presence: true, format: { with: VALID_PHONE_REGEX }, 
    length: { minimum: 9, maximum: 10 }, uniqueness: { case_sensitive: false }
end
