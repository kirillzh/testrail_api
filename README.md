# Testrail API v2

[TestRail API v2](http://docs.gurock.com/testrail-api2/start) wrapper, written in Ruby.

[![Gem Version](https://badge.fury.io/rb/testrail_api.svg)](http://badge.fury.io/rb/testrail_api)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'testrail_api', '~> 1.1.5'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install testrail_api

## Usage

```ruby
client = TestRail::Client.new('example.testrail.com', 'admin@example.com', 'pass')
puts client.projects
```

## Documentation

[http://www.rubydoc.info/gems/testrail_api](http://www.rubydoc.info/gems/testrail_api)

## Development

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/kirillzh/testrail_api. This project is 
intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org/) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

