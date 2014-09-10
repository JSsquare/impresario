require_relative 'talk'
require_relative 'track'

file = File.open(ARGV[0], 'r')
file_data = file.read

talk_info_hash = {}
talk_array = []

file_data.split("\n").each do |talk_info|
  talk_info_split = /^(.*[^0-9])(\d+min|lightning)$/.match(talk_info)
  talk_name = talk_info_split[1]
  talk_mins = talk_info_split[2]
  talk_array << Talk.new(talk_name, talk_mins)
end


track_filler = Track.new()
@mt = []
@at = []

talk_array.each do |each_talk|
  @mt, @at = track_filler.squeeze_talk_into_track(each_talk)
end

p "mt #{@mt}"
p "at #{@at}"


