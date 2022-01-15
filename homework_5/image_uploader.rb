require 'faraday'
require './faraday_request_wrapper'
require './url_validator'

class ImageUploader
  class << self
    def call(url)
      @url = url
      validate
    end

    def upload(filename)
      FaradayRequestWrapper.call do
        response = Faraday.get @url

        extension = @url.split('.')[-1]
        filename = filename.nil? || filename.strip.empty? ? @url.split('/')[-1] : "#{filename}.#{extension}"
        File.open("./images/#{filename}", 'wb') do |file|
          file.write(response.body)
        end
      end
    end

    private

    def validate
      UrlValidator.call @url
    end
  end
end
