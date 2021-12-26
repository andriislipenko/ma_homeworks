require 'uri'
require './faraday_request_wrapper'

class ImageUploader
  EXTENSIONS = %w[.jpeg .png .jpg].freeze

  class << self
    def call(url)
      @url = url
      validate

      @response = FaradayRequestWrapper.call(@url)
    end

    def upload(filename = nil)
      filename ||= @url.split('/')[-1]
      File.open("./images/#{filename}", 'wb') do |file|
        file.write(@response.body)
      end
    end

    private

    def validate
      URI.parse(@url)
      raise(URI::InvalidURIError, 'Invalid image url') unless @url.end_with?(*EXTENSIONS)
    end
  end
end
