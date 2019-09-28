class Cat < ApplicationRecord
  COLORS = ['black', 'white']
  validates :birth_date, :color, :name, :sex, presence: true
  validates :color, inclusion: COLORS
  validates :sex, inclusion: ["M", "F"]


  has_many :cat_rental_request,
    foreign_key: :cat_id,
    class_name: :CatRentalRequest,
    dependent: :destroy

  def age
    (Date.today - self.birth_date).to_i/365
  end

end
