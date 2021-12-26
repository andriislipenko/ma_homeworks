require 'faraday'

class FaradayRequestWrapper
  class << self
    def call(url)
      Faraday.get url
    end
  end
end
