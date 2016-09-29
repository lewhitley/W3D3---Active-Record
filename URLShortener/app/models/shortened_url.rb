class ShortenedUrl < ActiveRecord::Base
  include SecureRandom
  validates :short_url, presence: true, uniqueness: true
  validates :long_url, presence: true
  validates :user_id, presence: true
  validate :less_than_1024

  def less_than_1024
    unless long_url.length < 1024
      self.errors[:url_length] << "too long"
    end
  end

  def self.random_code
    short_url = SecureRandom.urlsafe_base64
    while ShortenedUrl.exists?(short_url: short_url)
      short_url = SecureRandom.urlsafe_base64
    end
    short_url
  end

  def self.create_for_user_and_long_url!(user, long_url)
    url_small = ShortenedUrl.random_code
    shortened_url = ShortenedUrl.create!(short_url: url_small, long_url: long_url, user_id: user.id)
    url_small
  end

  belongs_to :submitter,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  has_many :visits,
    primary_key: :id,
    foreign_key: :url_id,
    class_name: :Visit

  has_many :visitors,
    Proc.new { distinct },
    through: :visits,
    source: :users

  has_many :taggings,
    primary_key: :id,
    foreign_key: :url_id,
    class_name: :Tagging

  has_many :tags,
    through: :taggings,
    source: :tags

  def num_clicks
    Visit.select { |visit| visit.url_id == self.id }.length
  end

  def num_uniques
    visitors.count
  end

  def num_recent_uniques
    Visit.select(:url_id).where({ created_at: 10.minutes.ago..Time.now}).distinct.length
  end
end
