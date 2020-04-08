require "./spec_helper"

describe UrlShortener do
  # TODO: Add a test that exposes that providing an empty URL causes an error
  # The fix should be to require an URL neither null nor empty

  it "returns a shortened URL for a given URL" do
    given_url = "www.uca.edu.ar"
    given_provider = UrlShortener::NoOpProvider.new
    when_shortened = UrlShortener::Shortener
      .from_url(given_url)
      .with_provider(given_provider)
      .shorten
    then_expected = given_provider.prefix + given_provider.generator_url + given_url
    then_expected.should eq("http://noop.url/shorten?url=www.uca.edu.ar")
  end
end
