# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

ActiveRecord::Base.transaction do

  User.create(:email => "CJ")
  User.create(:email => "Flarnie")
  User.create(:email => "Jeff")
  User.create(:email => "Georges St. Pierre")
  User.create(:email => "Ned")

  ShortenedUrl.create(short_url: "289fjdsf902jn", long_url: "appacademy.io/fkdsjgfidsfkfkdsk", user_id: 1)
  ShortenedUrl.create(short_url: "hellofjdsf9095n", long_url: "appacademy.io/fkdsjgfidsfkfkdsk", user_id: 2)
  ShortenedUrl.create(short_url: "goodbyefjdsf9095n", long_url: "appacademy.io/fkdsjgfidsfkfkdsk", user_id: 2)
  ShortenedUrl.create(short_url: "yesfjdsf9095n", long_url: "appacademy.io/fkdsjgfidsfkfkdsk", user_id: 3)
  ShortenedUrl.create(short_url: "nofjdsf9095n", long_url: "youtube.com/fkdsjgfidsfwskjfdskdsk", user_id: 3)
  ShortenedUrl.create(short_url: "300jdsf9095n", long_url: "youtube.com/fkdsjgfidsfwskjfdskdsk", user_id: 3)
  ShortenedUrl.create(short_url: "bluefjdsf9095n", long_url: "google.com/fkdsjgfidsfwskjfdskdsk", user_id: 4)
  ShortenedUrl.create(short_url: "goldfjdsf9095n", long_url: "facebook.com/fkdsjgfidsfwskjfdskdsk", user_id: 4)
  ShortenedUrl.create(short_url: "yellowfjdsf9095n", long_url: "twitter.com/fkdsjgfidsfwskjfdskdsk", user_id: 4)
  ShortenedUrl.create(short_url: "purplefjdsf9095n", long_url: "reddit.com/fkdsjgfidsfwskjfdskdsk", user_id: 4)
  ShortenedUrl.create(short_url: "indigofjdsf9095n", long_url: "louis14.com/fkdsjgfidsfwskjfdskdsk", user_id: 5)
  ShortenedUrl.create(short_url: "mauvefjdsf9095n", long_url: "marieanne.com/fkdsjgfidsfwskjfdskdsk", user_id: 5)
  ShortenedUrl.create(short_url: "pucefjdsf9095n", long_url: "france.com/fkdsjgfidsfwskjfdskdsk", user_id: 5)

  Visit.create(user_id: 1, url_id: 3)
  Visit.create(user_id: 2, url_id: 3)
  Visit.create(user_id: 3, url_id: 3)
  Visit.create(user_id: 4, url_id: 3)
  Visit.create(user_id: 1, url_id: 3)
  Visit.create(user_id: 1, url_id: 8)
  Visit.create(user_id: 5, url_id: 8)
  Visit.create(user_id: 2, url_id: 8)
  Visit.create(user_id: 1, url_id: 8)

  TagTopic.create(tag: 'news')
  TagTopic.create(tag: 'sports')
  TagTopic.create(tag: 'colors')

  Tagging.create(tag_id: 1, url_id: 3)
  Tagging.create(tag_id: 2, url_id: 6)
  Tagging.create(tag_id: 3, url_id: 13)

  end
