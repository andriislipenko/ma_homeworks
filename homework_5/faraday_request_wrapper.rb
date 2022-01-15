require 'faraday'

class FaradayRequestWrapper
  class << self
    def call
      retries = 0

      begin
        yield
      rescue Faraday::ConnectionFailed,
             Faraday::BadRequestError,
             Faraday::UnauthorizedError,
             Faraday::ResourceNotFound => e
        if retries < 3
          puts 'Connection failed! Retrying...'
          sleep(3)
          retries += 1
          retry
        else
          puts e.message
        end
      end
    end
  end
end
