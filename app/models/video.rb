class Video < ActiveRecord::Base
  before_save :tags_array
  def self.find_by_query(string)
    results = Video.all
    string.split.each do |word|
      query = "%#{word}%"
      videos = Video.arel_table
      results = results.where(videos[:title].matches(query)
                        .or(videos[:description].matches(query)))
    end
    results
  end

  def tags_array
  end
end
