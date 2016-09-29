class Tagging < ActiveRecord::Base
  validates :tag_id, presence: true
  validates :url_id, presence: true

  belongs_to :tags,
    primary_key: :id,
    foreign_key: :tag_id,
    class_name: :TagTopic

  belongs_to :urls,
    primary_key: :id,
    foreign_key: :url_id,
    class_name: :ShortenedUrl
end
