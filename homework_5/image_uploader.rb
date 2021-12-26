require './faraday_request_wrapper'

class ImageUploader
  class << self
    def call(url)
      FaradayRequestWrapper.call(url)
    end
  end
end