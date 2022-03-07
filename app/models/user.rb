class User < ApplicationRecord
  validates :email, uniqueness: true, presence: true
  validates_presence_of :password, require: true

  has_secure_password

  before_create :create_api_key

  private

  def create_api_key
   loop do
     self.api_key = SecureRandom.hex
     return api_key unless User.where(api_key: api_key).exists?
   end
  end
end
