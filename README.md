# El Pinguino
[![Gem Version](https://badge.fury.io/rb/el_pinguino.svg)](http://badge.fury.io/rb/el_pinguino)
[![Code Climate](https://codeclimate.com/github/HackerParadise2014/el_pinguino/badges/gpa.svg)](https://codeclimate.com/github/HackerParadise2014/el_pinguino)

El Pinguino lets you scrape Travelmob locations by country and convert to JSON.

## Installation

```ruby
# Gemfile
gem 'el_pinguino'
```
```
$ bundle
```

Or install it yourself as:

    $ gem install el_pinguino

## Usage
```ruby
# Country is mandatory to prevent city-name collisions
ElPinguino.find_locations(country: 'Thailand',
	city: 'Bangkok',
	people: 6,
	beds: 3,
	amenities: 'air_conditioning,internet')
```

#### Optional Fields
```ruby
amenities	# String of comma seperated values
bathrooms 	# Number of bathrooms
bedrooms  	# Number of bedrooms
beds 		# Number of beds 
pages 		# Maximum number of pages to scrape
people 		# Number of guests that can be accomodated
```

## Contributing

1. Fork it ( https://github.com/HackerParadise2014/el_pinguino/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
