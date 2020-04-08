# url-shortener

Small library that uses external URL shorteners transparently.

## Installation

1. Add the dependency to your `shard.yml`:

   ```yaml
   dependencies:
     url-shortener:
       github: juanmougan/url-shortener
   ```

2. Run `shards install`

## Usage

```crystal
require "url-shortener"
```

### API

#### Without specifing a provider

The simplest use case is to only provide a URL, and rely on the default provider.

```crystal
shortened = UrlShortener::Shortener
  .from_url("www.uca.edu.ar")
  .shorten
```

#### Specifing a provider

Alternatively, you can specify a provider to generate the URL.

```crystal
shortened = UrlShortener::Shortener
  .from_url("www.uca.edu.ar")
  .with_provider(UrlShortener::TinyUrlProvider.new)
  .shorten
```

## Development

TODO: Write development instructions here

## Contributing

1. Fork it (<https://github.com/juanmougan/url-shortener/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Juan Manuel Mougan](https://github.com/juanmougan) - creator and maintainer
