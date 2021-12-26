require 'faraday'

class FaradayRequestWrapper
  class << self
    def call(url)
      response = Faraday.get url

      File.open('./images/image.jpg', 'wb') do |file|
        file.write(response.body)
      end
    end
  end
end