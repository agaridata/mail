# encoding: utf-8
module Mail
  class ReceivedElement
    
    include Mail::Utilities
    
    def initialize( string )
      received = Mail::Parsers::ReceivedParser.new.parse(string)
      begin
        @date_time = ::DateTime.parse("#{received.date} #{received.time}")
      rescue ArgumentError => e
        raise e unless e.message == "invalid date"
        @date_time = nil
      end
      @info = received.info
    end
    
    def date_time
      @date_time
    end
    
    def info
      @info
    end
    
    def to_s(*args)
      "#{@info}; #{@date_time.to_s(*args)}"
    end
    
  end
end
