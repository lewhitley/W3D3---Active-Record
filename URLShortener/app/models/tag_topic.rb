class TagTopic < ActiveRecord::Base
  validates :tag, presence: true, uniqueness: true
  has_many :taggings,
    primary_key: :id,
    foreign_key: :tag_id,
    class_name: :Tagging

  has_many :short_urls,
    through: :taggings,
    source: :urls
    
end
