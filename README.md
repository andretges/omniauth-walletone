# OmniAuth WalletOne

OmniAuth strategy for WalletOne

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'omniauth-walletone'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install omniauth-walletone

## Usage

```ruby
provider :walletone, "API_KEY", "API_SECRET", scope: 'GetBalance.CurrencyId(643)', format: :json
```

## Contributing

1. Fork it ( https://github.com/heretge/omniauth-walletone/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
