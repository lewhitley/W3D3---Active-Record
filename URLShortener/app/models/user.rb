class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true
  validate :no_more_than_5

  def no_more_than_5
    if submissions_last_min > 5
      self.errors[:too_many] << "submissions in last minute"
    end
  end

  def submissions_last_min
    submitted_urls.where({ created_at: 1.minute.ago..Time.now }).length
  end

  has_many :submitted_urls,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :ShortenedUrl

  has_many :visits,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :Visit

  has_many :visited_urls,
    Proc.new { distinct },
    through: :visits,
    source: :urls
end
