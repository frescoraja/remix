# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# FUTURE IMPLEMENTATION : TAG MODEL AND TAGGINGS MODEL, WHERE TAGGINGS IS JOIN TABLE BETWEEN VIDEOS AND TAGS, MANY TO MANY

  # video_params["tags"].each do |tag_name|
  #   next if tag_name.empty?
  #   tag = Tag.find_by_name(tag_name)
  #   if tag.nil?
  #     tag = Tag.create(name: tag_name)
  #   end
  #   Tagging.create(tag_id: tag.id, video_id: video.id)
  # end
#####


path = Dir.pwd + "/db/data.json"
file = File.read(path)
data = JSON.parse(file)["data"]

data.each do |video_params|
  video = Video.new
  video.attributes = video_params.select { |k, v| video.attributes.keys.member?(k) }
  video.tags.reject! { |t| t.empty? }
  video.save
end
