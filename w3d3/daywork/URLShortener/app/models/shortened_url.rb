require 'securerandom'

class ShortenedUrl < ApplicationRecord
  validates :short_url, :long_url, presence: true, uniqueness: true
  validates :user_id, presence: true
  # validate :no_spamming

  belongs_to :submitter,
    class_name: :User,
    foreign_key: :user_id,
    primary_key: :id

  has_many :visits,
    class_name: :Visit,
    foreign_key: :shortened_url_id,
    primary_key: :id

  has_many :visitors,
    lambda { distinct },
    through: :visits,
    source: :visitor

  has_many :taggings,
    class_name: :Tagging,
    foreign_key: :shortened_url_id,
    primary_key: :id

  has_many :tag_topics,
    through: :taggings,
    source: :tag_topic

  def self.random_code(author, long_url)
    random_url = SecureRandom.urlsafe_base64
    until(!ShortenedUrl.exists?(short_url: random_url))
      random_url = SecureRandom.urlsafe_base64
    end
    ShortenedUrl.create!(user_id: author.id, long_url: long_url, short_url: random_url)
  end

  def num_clicks
    self.visits.count
  end

  def num_uniques
    self.visitors.count
  end

  def num_recent_uniques
    recent_time = Time.zone.now - 10*60
    recent_visits = Visit.where("created_at > ? AND shortened_url_id = ?", recent_time, self.id)
    recent_visits.reduce([]) {|recent_visitors, visit| recent_visitors << visit.visitor}.uniq.count
  end

  def no_spamming(user_id)
    recent_time = Time.zone.now - 60
    recent_submissions = all.select {|short_url| short_url.user_id == user_id && short_url.created_at > recent_time}
    if recent_submissions.count >= 5
      self.errors[:spamming] << "stop spamming"
    end
  end
end
