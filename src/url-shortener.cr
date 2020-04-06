# TODO: Write documentation for `Url::Shortener`
require "http/client"

module Url::Shortener
  VERSION = "0.1.0"

  class TinyUrlProvider
    def prefix
      "http://tinyurl.com/"
    end

    def generator_url
      "api-create.php?url="
    end

    def provider_url(url)
      prefix + generator_url + url
    end

    def generate(url)
      response = HTTP::Client.get(provider_url(url))
      puts response.body.strip
    end
  end

  class URLShortener
    def self.from_url(url)
      self.original_url = url
    end

    def with_provider(provider)
      self.provider = provider
    end

    def shorten
      self.provider.generate(self.original_url)
    end
  end
end
