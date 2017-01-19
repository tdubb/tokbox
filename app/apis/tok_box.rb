
class TokBox
  require "opentok"
  attr_accessor :opentok
  def initialize
    @opentok = OpenTok::OpenTok.new(ENV["TOKBOX_API_KEY"], ENV["TOKBOX_API_SECRET"])
  end

end
