cheatsheet do
  title 'Ruby Debugging Magic'
  docset_file_name 'Ruby Debug Magic'
  keyword 'ruby_debug'

  introduction 'Ruby Debugging Magic Cheatsheet' # https://www.schneems.com/2016/01/25/ruby-debugging-magic-cheat-sheet.html

  category do
    id 'Finding stuff'

    entry do
      name 'Figure out where a method was defined'
      notes <<-NOTE
      ```object = Object.new
puts object.method(:blank?).source_location
=> ["/gems/activesupport-5.0.0.beta1/lib/active_support/core_ext/object/blank.rb", 14]
```
NOTE
    end

    entry do
      command 'bundle open active_support'
      name 'Opening a dependency from a project'
    end

    entry do
      name 'See where an object was created'
      notes <<-NOTE
      ```
      require 'objspace'
ObjectSpace.trace_object_allocations_start

Kernel.send(:define_method, :sup) do |obj|
  puts "ObjectSpace.allocation_sourcefile(obj) }:ObjectSpace.allocation_sourceline(obj) }"
end

world = "hello"

sup world
```
      NOTE
    end
  end

  category do
    id 'Method stuff'

    entry do
      command 'puts caller'
      name 'Figure out how a method was called'
    end

    entry do
      name 'Find out which method super is calling'
      notes <<-NOTE
      ```
      def foo
  puts method(:foo).super_method.source_location
  super
end

      ```
      NOTE
    end

    entry do
      command 'object.methods'
      name 'List all methods on an object'
    end

    entry do
      command 'User.instance_method(:github_url).source_location'
      name 'Get instance method location without an instance'
    end

    entry do
      command 'method(:parse).parameters'
      name 'Introspect method arguments'
    end

    entry do
      name 'See where an argument is mutated'
      notes <<-NOTE
      Often times, I’ll instantiate a variable

config.thing = { "foo" => "bar" }

But later I’ll find it was changed, but I don’t know where:

puts config.thing
# => {"bar" => "THE FOO KEY IS GONE"}

You can see where the value of an object was modified by first freeze-ing the object:

config.thing.freeze

Then later if other code modifies the object, an error will be raised:

config.thing.delete("foo")

# active_support/concurrency/share_lock.rb:151:in `delete': can't modify frozen Hash (RuntimeError)
#  from active_support/concurrency/share_lock.rb:151:in `yield_shares'
#  from active_support/concurrency/share_lock.rb:79:in `block in stop_exclusive'

There are some caveats: In this example the hash is frozen, but the keys and values are not. If you try to modify a key or value, no exception will be raised. If you’re trying to freeze a complex object such as a Hash, you’ll need to deep freeze it. This technique also won’t work for cases where a variable is assigned instead of mutated.
NOTE
    end

    entry do
      command 'gem pristine'
      name 'Remove any debug statements you might have added'
    end
  end
end
