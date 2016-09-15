# GroceryList

Welcome to the GroceryList Gem
This gem scrapes data from a popular couponing website www.jillcataldo.com
The gem will give a list of the most recent sales by store name.
Once you select a store, it will provide a list of the following:

1. The item name
2. The item price
3. The coupon associated with the item, if there is one.
4. The size of the item, if applicable


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'grocery_list'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install grocery_list

## Usage

To use the program, start it by typing ruby bin/grocery_list
From then you will see a choice of stores available based on which stores have current sales ads.
Select the number corresponding to the store you wish to select.
After reviewing the items for sale, you can select another store, see the list of stores or exit the gem.

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/jmb521/grocery_list.
