require "./manual_test.cr"

shortened = UrlShortener::Shortener.from_url("www.ole.com.ar")
  .shorten

puts shortened
