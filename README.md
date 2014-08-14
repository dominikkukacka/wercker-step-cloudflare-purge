# cloudflare-purge

[![wercker status](https://app.wercker.com/status/680124519e5175c6a33e9122b43833eb/m "wercker status")](https://app.wercker.com/project/bykey/680124519e5175c6a33e9122b43833eb)

A Wercker step that purges the Cloudflare cache for a given domain.

## Example

```yaml
build:
  steps:
    - seigyo/cloudflare-purge:
        cloudflare_api: <<your Cloudflare API key>>
        cloudflare_email: <<your Cloudflare email>>
        domain: <<your domain name>>
```

## Changelog

### 0.2.0

- Echo the response whenever an error occurs

### 0.1.0

- Initial release

## License

MIT, see LICENSE
