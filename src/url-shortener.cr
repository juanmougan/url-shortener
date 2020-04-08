# TODO: Write documentation for `Url::Shortener`
require "http/client"

module UrlShortener
  VERSION = "0.1.0"

  class Shortener
    @original_url : String
    @provider : TinyUrlProvider # TODO generalize

    def initialize(url : String)
      @original_url = url
      @provider = default_provider
    end

    def default_provider
      TinyUrlProvider.new
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
