# == Schema Information
#
# Table name: users
#
#  id       :bigint           not null, primary key
#  username :string           not null
#

class User < ApplicationRecord
  validates :username, uniqueness: true, presence: true

  has_many :authored_polls,
    foreign_key: :author_id,
    class_name: :Poll
  
  has_many :responses,
    foreign_key: :user_id,
    class_name: :Response
    
end
