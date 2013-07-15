class FeedItem < ActiveRecord::Base
  @@feeds = [
    "http://www.austinchronicle.com/gyrobase/rss/arts.xml",
    "http://www.examiner.com/rss/recent/austin/theater",
    "http://feeds.feedburner.com/austinpost/latestnews",
    "http://austin.culturemap.com/feeds/news/arts/",
    "http://austinlivetheatre.blogspot.com/feeds/posts/default?alt=rss",
    "http://www.buyplaytix.com/nowplaying.rss",
    "http://www.nowplayingaustin.com/feeds/event/rss/2/",
    "http://kut.org/feed",
    "http://austinlifestylemag.com/feed/",
  ]
  has_and_belongs_to_many :companies

  def self.update
    companies = Company.all

    feeds = Feedzirra::Feed.fetch_and_parse(@@feeds)
    feeds.each do |key, feed|
      logger.info(key)
      feed.entries.each do |entry|
        entry.sanitize!
       
        found_companies = Array.new
        companies.each do |company| 
          found_company = false
          if(!entry.title.empty? && !entry.title.index(company.name).nil?)
            found_company = true
          elsif(!entry.summary.empty? && !entry.summary.index(company.name).nil?)
            found_company = true
          else 
            company.company_url.each do |url|
              if (entry.summary.empty? && !entry.summary.index(url.url).nil?)
                found_company = true;
              elsif (entry.title.empty? && !entry.title.index(url.url).nil?)
                found_company = true;
              end
            end
            if(!found_company)
              company.alias_record.each do |alias_record|
                if (entry.summary.empty? && !entry.summary.index(alias_record.alias).nil?)
                  found_company = true;
                elsif (entry.title.empty? && !entry.title.index(alias_record.alias).nil?)
                  found_company = true;
                end
              end
            end
          end

          if(found_company)
            logger.info("Found company " + company.name)
            found_companies.push(company)
          end
        end
        if(found_companies.size() > 0)
          items = FeedItem.where("title = ? and url = ?", entry.title, entry.url)
          if(items.size() == 0) 
            item = FeedItem.new
            item.title = entry.title
            item.url = entry.url
            item.content = entry.content
            item.published = entry.published
            item.companies = found_companies
            item.save
          end
 
        end
      end
    end
    return true
    
    #feeds.each do |feed|
    #  
    #end
    #feed.entries.each do |entry|
    #  logger.info(YAML::dump(entry))

    #  if !entry.empty? && !entry.title.empty?
    #    logger.info(entry.title)
    #  end
    #end
  end
end
