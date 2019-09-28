class CatRentalRequest < ApplicationRecord
  validates :cat_id, :start_date, :end_date, :status, presence: true
  validates :status, inclusion: ['PENDING', 'APPROVED', 'DENIED']
  validate :overlapping_requests


  belongs_to :cat,
    foreign_key: :cat_id,
    class_name: :Cat


  def overlapping_requests

    if CatRentalRequest.where("cat_id = ?", self.cat_id).where("status = ?", 'APPROVED').where('? <  end_date and ? > start_date', self.start_date, self.end_date).any?
        errors.add(:date_end, 'it overlaps another')
    end
  end

  
end
