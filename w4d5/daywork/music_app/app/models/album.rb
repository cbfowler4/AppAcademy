# == Schema Information
#
# Table name: albums
#
#  id      :integer          not null, primary key
#  band_id :integer          not null
#  title   :string           not null
#  year    :integer          not null
#  studio  :boolean          default(TRUE)
#

class Album < ApplicationRecord
  validates :title, :year, :band_id, presence: true
  validates :studio, inclusion: {in: [true, false]}
  
  belongs_to :band
  
  
  def band=(band)
    @band = Band.find_by(name: band)
    self.band_id = @band.id
  end
  
end
