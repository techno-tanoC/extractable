# Extractable

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'extractable'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install extractable

## Usage

```ruby
class Pair
  prepend Extractable

  def initialize(first, second)
  end
end

pair = Pair.new(1, 2)

pair.extract #=> [1, 2]

pair.match do
  with Pair.case(0, 1) do end # mismatch
  with Pair.case(1, 2) do end # match
  with Pair.case(2, 1) do end # mismatch
end
```


## Contributing

1. Fork it ( https://github.com/[my-github-username]/extractable/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
