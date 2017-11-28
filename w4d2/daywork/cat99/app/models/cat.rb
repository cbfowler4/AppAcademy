# == Schema Information
#
# Table name: cats
#
#  id          :integer          not null, primary key
#  birth_date  :date
#  color       :string
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#


class Cat < ApplicationRecord
  COLORS = %w(red blue green yellow white)
    
  validates :color, inclusion: { in: COLORS, message: "Entered color is not the right color" }
  validates :sex, inclusion: { in: %w(m f)}
  validates :name, :sex, presence: true
  
  has_many :cat_rental_requests
  
  def age 
    diff_in_days = (Date.today - self.birth_date).to_i
    (diff_in_days/365.25).to_i
  end 
  
  def self.colors 
    COLORS
  end 
  
end
