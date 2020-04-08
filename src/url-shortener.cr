# TODO: Write documentation for `UrlShortener`
require "http/client"

module UrlShortener
  VERSION = "0.1.0"

  class Shortener
    property provider : TinyUrlProvider # TODO generalize

    def self.from_url(url)
      Shortener.new(url)
    end

    def initialize(url : String)
      @original_url = url
      @provider = provider
    end

    def provider
      TinyUrlProvider.new
    end

    def with_provider(provider)
      self.provider = provider
      return self
    end

    def shorten
      @provider.generate(@original_url)
    end
  end

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
      puts response.body.strip.chomp
    end
  end
end
