# Ruby Helpers

Small snippits of questionably useful helpers

### Instance method composition

A common pattern in ruby is to pass an instance method to a higher order
function - this works great so long as it doesn't need any additional arguments:

```ruby
['http', 'https'].collect(&:upcase) == ['HTTP', 'HTTPS']
```

But what if you need to pass additional, fixed arguments? Sure, Ruby has a curry
method on the Proc class, but actually making use of it in this context is a mess.

Instead, what if we had a helper method that could just transparently "do what you mean"?

```ruby
result = ['example.com', 'www.example.com'].collect(&M.split('.'))
result == [['example', 'com'], ['www', 'example', 'com']]
```

### Mixin fixer

Ruby libraries have a nasty tendency to use mixins instead of composition
This provides a mechanism to convert mixins to a class/instance variable for composition

See: https://8thlight.com/blog/eric-meyer/2012/11/16/composition-over-mixins.html
