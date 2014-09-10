class Talk
  attr_reader :talk_name, :talk_mins

  def initialize(talk_name, talk_mins)
    @talk_name = talk_name
    @talk_mins = talk_mins
  end

  def pluck_talkmin_integer
    if @talk_mins == "lightning"
      return 5
    else
      return @talk_mins.gsub(/min/, '').to_i
    end
  end

end