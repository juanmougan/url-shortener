require "./manual_test.cr"

if ARGV.size < 1
  raise "Need a URL to shorten"
end
shortened = UrlShortener::Shortener
  .from_url(ARGV[0])
  .with_provider(UrlShortener::TinyUrlProvider.new)
  .shorten

puts shortened
