# == Schema Information
#
# Table name: artwork_shares
#
#  id         :integer          not null, primary key
#  artwork_id :integer          not null
#  viewer_id  :integer          not null
#

class ArtworkShare < ApplicationRecord
  validates :artwork_id, :viewer_id, presence: true
  validates :artwork_id, uniqueness: { scope: :viewer_id }
  
  belongs_to :artwork,
  foreign_key: :artwork_id,
  primary_key: :id,
  class_name: :Artwork
  
  belongs_to :viewer, 
  foreign_key: :viewer_id,
  primary_key: :id,
  class_name: :User
  
end
