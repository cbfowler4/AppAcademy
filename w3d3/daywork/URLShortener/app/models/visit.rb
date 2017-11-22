class Visit < ApplicationRecord
  validates :visitor_id, :shortened_url_id, presence: true

  belongs_to :visitor,
  class_name: :User,
  foreign_key: :visitor_id,
  primary_key: :id

  def self.record_visit!(user, shortened_url)
    Visit.create!(visitor_id: user.id, shortened_url_id: shortened_url.id)
  end

end
