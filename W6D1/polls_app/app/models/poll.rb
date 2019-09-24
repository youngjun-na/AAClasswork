# == Schema Information
#
# Table name: polls
#
#  id        :bigint           not null, primary key
#  author_id :integer          not null
#  title     :string           not null
#

class Poll < ApplicationRecord
  validates :title, presence: true
  belongs_to :author,
    foreign_key: :author_id,
    class_name: :User
  
  has_many :questions,
    foreign_key: :poll_id,
    class_name: :Question
end
