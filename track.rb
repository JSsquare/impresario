class Track
  MORNING_TRACK_MINS = 180 #9AM-12PM; 3HRS; 180mins
  AFTERNOON_TRACK_MINS = 240 #1PM-5PM; 4hrs; 240mins

  attr_reader :morning_time_filler, :afternoon_time_filler, :morning_talks, :afternoon_talks

  def initialize
    @morning_time_filler = 0
    @afternoon_time_filler = 0
    @afternoon_talks = []
    @morning_talks = []
  end

  def squeeze_talk_into_track(each_talk)
    if morning_vacancy? each_talk.pluck_talkmin_integer
      @morning_talks << each_talk.talk_name + each_talk.talk_mins
      @morning_time_filler += each_talk.pluck_talkmin_integer
    elsif afternoon_vacancy? each_talk.pluck_talkmin_integer
      @afternoon_talks << each_talk.talk_name + each_talk.talk_mins
      @afternoon_time_filler += each_talk.pluck_talkmin_integer
    end
   return @morning_talks, @afternoon_talks
  end

  def morning_vacancy?(talk_spell=0)
    @morning_time_filler + talk_spell < MORNING_TRACK_MINS
  end

  def afternoon_vacancy?(talk_spell=0)
    @afternoon_time_filler + talk_spell < AFTERNOON_TRACK_MINS
  end


end