class FeedItem < ActiveRecord::Base
  @@feeds = [
    "http://www.austinchronicle.com/gyrobase/rss/arts.xml",
    "http://www.examiner.com/rss/recent/austin/theater",
    "http://feeds.feedburner.com/austinpost/latestnews",
    "http://austinlivetheatre.com/",
    "http://austin.culturemap.com/feeds/news/arts/",
  ]
  belongs_to :company

  

  def update

    feeds = Feedzirra::Feed.fetch_and_parse(@@feeds)
  end
end
