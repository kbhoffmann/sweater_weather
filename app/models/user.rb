class User < ApplicationRecord
  validates :email, uniqueness: true, presence: true
  validates_presence_of :password, require: true

  has_secure_password

  def api_key
   loop do
     key = SecureRandom.hex
     return key unless User.where(api_key: key).exists?
   end
  end

end
