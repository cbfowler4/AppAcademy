class TagTopic < ApplicationRecord
  validates :topic, uniqueness: true, presence: true

  has_many :taggings,
    class_name: :Tagging,
    foreign_key: :tag_topic_id,
    primary_key: :id

  has_many :shortened_urls,
    through: :taggings,
    source: :shortened_url


  def popular_links
    self.shortened_urls.sort_by {|shortened_url| shortened_url.num_clicks}.reverse.take(3)
  end

end
