# Humanize

Converts numbers to strings.
    
    2  => "two"
    4  => "four"
    8  => "eight"
    15 => "fifteen"
    16 => "sixteen"
    23 => "twenty three"
    42 => "forty two"
    
All the way up to 156 digit numbers:


    999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999
    
    =>
    
    nine hundred and ninety nine quinquagintillion, nine hundred and ninety nine novenquadragintillion, nine hundred and ninety nine octoquadragintillion, nine hundred and ninety nine septenquadragintillion, nine hundred and ninety nine sesquadragintillion, nine hundred and ninety nine quinquadragintillion, nine hundred and ninety nine quattuorquadragintillion, nine hundred and ninety nine trequadragintillion, nine hundred and ninety nine duoquadragintillion, nine hundred and ninety nine unquadragintillion, nine hundred and ninety nine quadragintillion, nine hundred and ninety nine novemtrigintillion, nine hundred and ninety nine octotrigintillion, nine hundred and ninety nine septentrigintillion, nine hundred and ninety nine sextrigintillion, nine hundred and ninety nine quintrigintillion, nine hundred and ninety nine quattuortrigintillion, nine hundred and ninety nine trestrigintillion, nine hundred and ninety nine duotrigintillion, nine hundred and ninety nine untrigintillion, nine hundred and ninety nine trigintillion, nine hundred and ninety nine novemvigintillion, nine hundred and ninety nine octovigintillion, nine hundred and ninety nine septenvigintillion, nine hundred and ninety nine sexvigintillion, nine hundred and ninety nine quinvigintillion, nine hundred and ninety nine quattuortillion, nine hundred and ninety nine trevigintillion, nine hundred and ninety nine duovigintillion, nine hundred and ninety nine unvigintillion, nine hundred and ninety nine vigintillion, nine hundred and ninety nine novemdecillion, nine hundred and ninety nine octodecillion, nine hundred and ninety nine septendecillion, nine hundred and ninety nine sexdecillion, nine hundred and ninety nine quindecillion, nine hundred and ninety nine quattuordecillion, nine hundred and ninety nine tredecillion, nine hundred and ninety nine duodecillion, nine hundred and ninety nine undecillion, nine hundred and ninety nine decillion, nine hundred and ninety nine nonillion, nine hundred and ninety nine octillion, nine hundred and ninety nine septillion, nine hundred and ninety nine sextillion, nine hundred and ninety nine quintrillion, nine hundred and ninety nine quadrillion, nine hundred and ninety nine trillion, nine hundred and ninety nine billion, nine hundred and ninety nine million, nine hundred and ninety nine thousand nine hundred and ninety nine

Also works with decimal points

		2.1 => "two point one"
		4.2 => "four point two"
		1.123 => "one point one two three"
		
If you are dealing with numbers larger than 156, we accept patches. Word list is sourced from: [ Wordlist.source ]

## Usage
### Install the gem using RubyGems
		gem install humanize

### Include it in your program or add to gem file
		require 'rubygems'
		require 'humanize'
		
### Call the method on the numbers
		100.humanize => "one hundred"
		1001.humanize => "one thousand one"

## Benchmarks

### Late 2008 Macbook Pro - Ruby 1.8.7p286

1. 0.540000   0.010000   0.550000 (  0.554433)
2. 0.560000   0.010000   0.570000 (  0.564226)
3. 0.560000   0.010000   0.570000 (  0.581700)

### Late 2008 Macbook Pro - Ruby 1.91p0


1. 0.360000   0.000000   0.360000 (  0.370702)
2. 0.360000   0.000000   0.360000 (  0.367845)
3. 0.360000   0.000000   0.360000 (  0.370599)

## Credits

* *Original idea*: Brenton Fletcher
* *Unbastardisation of original idea*: Ryan Bigg
* *Awesome speed up*: Jack "Chendo" Chen
    

