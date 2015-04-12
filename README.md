# RZoopla
## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rzoopla'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rzoopla

## Usage

    RZoopla.configure do |config|
      config.api_key = ENV['ZOOPLA_API_KEY']
    end

    RZoopla::Listings.where(
      area: 'Edinburgh'
      radius: 0.1,
      order_by: 'age',
      maximum_beds: 2,
      listing_status: 'sale',
      include_sold: 0
    )

## Contributing

1. Fork it ( https://github.com/Omer/rzoopla/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
