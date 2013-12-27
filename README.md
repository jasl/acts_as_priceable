ActsAsPriceable
====

A easy way to store price as cents in database, but keep usability. It designed for ActiveModel, not dependent Rails or
ActiveRecord.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'acts_as_priceable', github: 'jasl/acts_as_priceable'
```

And then execute:

    $ bundle

## Usage

Say you have a model, `Llama`.  You can buy `Llama`s for a `cost`.  Let's add the `cost` to the `Llama` model.

First, you need define a column named `cost_in_cents` for persistence, this is a convention,
but you can change it by `suffix` option.

Now we just need to tell model that the `cost` field is act_as_priceable

```ruby
# app/models/llama.rb

class Llama < ActiveRecord::Base
  acts_as_priceable :cost
end
```

**Important for Mongoid user: you need add `include ActsAsPriceable` in your model.**

And now lets check it out in the console

```ruby
>> llama = Llama.last
>> llama.cost # => nil
>> llama.cost = 100
>> llama.cost_in_cents # => 10000
>> llama.cost # => 100
```

By default, `cost` should be a `BigDecimal`,
if you want to present price as other type like [Money](https://github.com/RubyMoney/money), can give `class` option.

Isn't that special. So go, and add prices easily to your models, with ActsAsPriceable.

PS: `acts_as_priceable` can take more than one field at a time, so go ahead and load it up like a baked potato.

```ruby
acts_as_priceable :retail_price, :employee_price, :cost
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License

This project rocks and uses MIT-LICENSE.
