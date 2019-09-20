require "securerandom"

class ShortenedUrl < ApplicationRecord
  include SecureRandom

  validates :short_url, uniqueness: true, presence: true
  validates :long_url, :user_id, presence: true

  def self.random_code
    shortened = SecureRandom.urlsafe_base64 
    if !self.exists?(shortened)
      shortened
    else
      self.random_code
    end
  end
end