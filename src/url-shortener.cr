# This library allows you to create shortened URLs.
require "http/client"

module UrlShortener
  VERSION = "0.1.0"

  # This object will create a shortened URL using a provided provider.
  # If no provider is given, it will use a default one instead.
  class Shortener
    property provider : TinyUrlProvider | NoOpProvider # TODO generalize (like an interface)

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

    # Lets you supply a provider (optional)
    def with_provider(provider)
      self.provider = provider
      return self
    end

    # Creates a shortened URL, using the provider and original url already supplied.
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
      response.body.strip.chomp
    end
  end

  # TODO this is here for testing purposes.
  # Figure out how to use some sort of interface, and provide a mock on the tests.
  class NoOpProvider
    def prefix
      "http://noop.url/"
    end

    def generator_url
      "shorten?url="
    end

    def provider_url(url)
      prefix + generator_url + url
    end

    def generate(url)
      provider_url(url)
    end
  end
end
