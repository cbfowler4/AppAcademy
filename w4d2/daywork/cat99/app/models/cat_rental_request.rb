# == Schema Information
#
# Table name: cat_rental_requests
#
#  id         :integer          not null, primary key
#  cat_id     :integer          not null
#  start_date :date             not null
#  end_date   :date             not null
#  status     :string           default("PENDING")
#

class CatRentalRequest < ApplicationRecord 
  validates :cat_id, :start_date, :end_date, :status, presence: true 
  validates :status, inclusion: {in: %w(APPROVED DENIED PENDING), message: "Not a valid status"}
  
  validate :does_not_overlap_approved_requests
  
  belongs_to :cat 
  
  
  def overlapping_requests 
    
    CatRentalRequest.where.not('id = :id', id: self.id)
                    .where('cat_id = :cat_id', cat_id: self.cat_id)
                    .where.not(':start_date < start_date OR :end_date > end_date', 
                      start_date: self.start_date, end_date: self.end_date)
  end 
  
  def overlapping_approved_requests 
    debugger 
    overlapping_requests.each do |overlap|
      return true if overlap.where(status: 'APPROVED').exists? 
    end 
    false 
  end 
  
  def does_not_overlap_approved_requests 
    if overlapping_approved_requests
      record.errors[:overlap] << "There is overlap!"
    end 
  end 
  
  
  
end 
