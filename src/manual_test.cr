require "./manual_test.cr"

shortened = UrlShortener::Shortener.new("www.ole.com.ar")
  .shorten

puts shortened
