require "./manual_test.cr"

shortened = UrlShortener::Shortener
  .from_url("www.ole.com.ar")
  .with_provider(UrlShortener::TinyUrlProvider.new)
  .shorten

puts shortened
