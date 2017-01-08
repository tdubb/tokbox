
class TokBox
  require "opentok"
  attr_accessor :opentok
  def initialize
    @opentok = OpenTok::OpenTok.new("45746092", "856a9189e2a50dc87660f40f3fd65abad8dc5306")
  end

end
