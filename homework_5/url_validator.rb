require 'uri'

class UrlValidator
  EXTENSIONS = %w[.jpeg .png .jpg].freeze

  class << self
    def call(url)
      URI.parse(url)
      raise(URI::InvalidURIError, 'Invalid image url') unless url.end_with?(*EXTENSIONS)
    rescue URI::InvalidURIError => e
      abort("Aborted! Error: #{e.message}")
    end
  end
end
