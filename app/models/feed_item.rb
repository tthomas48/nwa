class FeedItem < ActiveRecord::Base
  @@feeds = [
    "http://www.austinchronicle.com/gyrobase/rss/arts.xml",
    "http://www.examiner.com/rss/recent/austin/theater",
    "http://feeds.feedburner.com/austinpost/latestnews",
    "http://austin.culturemap.com/feeds/news/arts/",
    "http://austinlivetheatre.blogspot.com/feeds/posts/default?alt=rss",
  ]
  belongs_to :company

  

  def self.update
    companies = Company.all

    feeds = Feedzirra::Feed.fetch_and_parse(@@feeds)
    feeds.each do |key, feed|
      logger.info(key)
      feed.entries.each do |entry|
        entry.sanitize!
       
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
            if !found_company
              company.alias_record.each do |alias|
                if (entry.summary.empty? && !entry.summary.index(alias.alias).nil?)
                  found_company = true;
                elsif (entry.title.empty? && !entry.title.index(alias.alias).nil?)
                  found_company = true;
                end
              end
            end

          end

          if(found_company)
            logger.info("Found company " + company.name)
            items = FeedItem.where("company_id = ?", company.id)
            next if items.length != 0

            item = FeedItem.new
            item.title = entry.title
            item.url = entry.url
            item.content = entry.content
            item.published = entry.published
            item.company = company
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
