# Humanize

[![Build Status](https://travis-ci.org/radar/humanize.svg?branch=master)](https://travis-ci.org/radar/humanize)

Converts numbers to strings.

```ruby
2.humanize  # => "two"
4.humanize  # => "four"
8.humanize  # => "eight"
15.humanize # => "fifteen"
16.humanize # => "sixteen"
23.humanize # => "twenty three"
42.humanize # => "forty two"
```

All the way up to 156 digit numbers:

```ruby
999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999.humanize
# => "nine hundred and ninety nine quinquagintillion, nine hundred and ninety nine novenquadragintillion, nine hundred and ninety nine octoquadragintillion, nine hundred and ninety nine septenquadragintillion, nine hundred and ninety nine sesquadragintillion, nine hundred and ninety nine quinquadragintillion, nine hundred and ninety nine quattuorquadragintillion, nine hundred and ninety nine trequadragintillion, nine hundred and ninety nine duoquadragintillion, nine hundred and ninety nine unquadragintillion, nine hundred and ninety nine quadragintillion, nine hundred and ninety nine novemtrigintillion, nine hundred and ninety nine octotrigintillion, nine hundred and ninety nine septentrigintillion, nine hundred and ninety nine sextrigintillion, nine hundred and ninety nine quintrigintillion, nine hundred and ninety nine quattuortrigintillion, nine hundred and ninety nine trestrigintillion, nine hundred and ninety nine duotrigintillion, nine hundred and ninety nine untrigintillion, nine hundred and ninety nine trigintillion, nine hundred and ninety nine novemvigintillion, nine hundred and ninety nine octovigintillion, nine hundred and ninety nine septenvigintillion, nine hundred and ninety nine sexvigintillion, nine hundred and ninety nine quinvigintillion, nine hundred and ninety nine quattuortillion, nine hundred and ninety nine trevigintillion, nine hundred and ninety nine duovigintillion, nine hundred and ninety nine unvigintillion, nine hundred and ninety nine vigintillion, nine hundred and ninety nine novemdecillion, nine hundred and ninety nine octodecillion, nine hundred and ninety nine septendecillion, nine hundred and ninety nine sexdecillion, nine hundred and ninety nine quindecillion, nine hundred and ninety nine quattuordecillion, nine hundred and ninety nine tredecillion, nine hundred and ninety nine duodecillion, nine hundred and ninety nine undecillion, nine hundred and ninety nine decillion, nine hundred and ninety nine nonillion, nine hundred and ninety nine octillion, nine hundred and ninety nine septillion, nine hundred and ninety nine sextillion, nine hundred and ninety nine quintrillion, nine hundred and ninety nine quadrillion, nine hundred and ninety nine trillion, nine hundred and ninety nine billion, nine hundred and ninety nine million, nine hundred and ninety nine thousand nine hundred and ninety nine"
```

If you are dealing with numbers larger than 156 digits, we accept patches. Word list is sourced from: [ Wordlist.source ]

## Usage (Extends Ruby Core)
Note: this extends to Ruby core classes `Integer`, `Float`, and `BigDecimal`.
See below for usage without extending Ruby core.

### Install the gem using RubyGems

```bash
gem install humanize
```

or:

### Add it to your Gemfile

```ruby
gem 'humanize'
```

### Include it in your program

```ruby
require 'humanize'
```

### Call the method on the numbers

```ruby
100.humanize => "one hundred"
1001.humanize => "one thousand and one"
0.001.humanize => "zero point zero zero one"
```

##  Usage (Without Extending Ruby Core)
Note: this usage does not extend Ruby core.
Instead it relies on explicitly calling the pure function `Humanize.format`.

### Install the gem using RubyGems

```bash
gem install humanize
```

or:

### Add it to your Gemfile

```ruby
gem 'humanize', require: false
```

### Include the module in your program

```ruby
require 'humanize/module' # does not extend Ruby corex
```

### Call the format function on the numbers

```ruby
Humanize.format(100) => "one hundred"
Humanize.format(1001) => "one thousand and one"
Humanize.format(0.001) => "zero point zero zero one"
```

## Configuration

```ruby
Humanize.configure do |config|
  config.locale = :en  # [:en, :es, :fr, :'fr-CH', :tr, :az, :de, :id, :th, :ru, :pt, :ms, :jp, :vi, :'zh-tw'], default: :en
  config.decimals_as = :digits # [:digits, :number], default: :digits
end
```

The default locale can be overridden by passing an explicit `locale:`:

```ruby
42.humanize(locale: :fr) # => "quarante-deux"
1666.humanize(locale: :tr) # => "bin altı yüz altmış altı"
```

Or, functionally:

```ruby
Humanize.format(42, locale: :fr) # => "quarante-deux"
Humanize.format(1666, locale: :tr) # => "bin altı yüz altmış altı"
```

### Decimals

Similarly, the default display of decimals can be overridden by passing an explicit `decimals_as:` value:

```ruby
0.42.humanize(decimals_as: :digits) # => "zero point four two"
0.42.humanize(decimals_as: :number) # => "zero point forty-two"
```

Or, functionally:

```ruby
Humanize.format(0.42, decimals_as: :digits) # => "zero point four two"
Humanize.format(0.42, decimals_as: :number) # => "zero point forty-two"
```

## I18n

Currently supported locales:

* English: `:en`
* Spanish: `:es`
* French: `:fr`
* Swiss French: `:'fr-CH'`
* Turkish: `:tr`
* Azerbaijani `:az`
* German: `:de`
* Indonesian: `:id`
* Thai: `:th`
* Russian: `:ru` (except for decimals)
* Portuguese: `:pt`
* Malaysia `:ms`
* Japanese `:jp`
* Vietnamese `:vi`
* Traditional Chinese `:zh-tw`

## Testing

Install development dependencies by running `bundle install`.

You can run mutation testing by calling `bundle exec mutant run`.

## Credits

* *Original idea*: Brenton Fletcher
* *Unbastardisation of original idea*: Ryan Bigg
* *Awesome speed up*: Jack "Chendo" Chen
