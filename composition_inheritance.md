## Inheritance

Teh example below shows inheritance from __parent class__ `Dog` to __child class__ `ShihTzu`. The child class __inherits__ all the methods of the parent class without having define them. (This is the same thing as `include`ing a `module` `Dog`.)

```
class Dog

  def bark()
    puts "Woof!"
  end

end

class ShihTzu < Dog
end

dog = Dog.new
dog.bark #=> Woof!

little_dog = ShihTzu.new
little_dog.bark #=> Woof!

```

In this exaple we've explicitly defined our own instance of method `bark()` in the child class, and this is called in preference to the inherited one (from the parent class).

```
class Dog

  def bark()
    puts "Woof!"
  end

end

class ShihTzu < Dog

  def bark()
    puts "(Annoying) Yap!"
  end

end

dog = Dog.new
dog.bark #=> Woof!

little_dog = ShihTzu.new
little_dog.bark #=> (Annoying) Yap!

```
Note that within the overriding method in the child class, you can call `super()` to call the method in the parent class, as if `yield`ing to it (you return back and carry on in the child method).

```
class Dog

  def bark()
    puts "Woof!"
  end

end

class ShihTzu < Dog

  def bark()
    puts "This dog goes..."
    super()
  end

end

dog = Dog.new
dog.bark #=> Woof!

little_dog = ShihTzu.new
little_dog.bark #=> This dog goes...
                    Woof!

```
## Composition

The below illustrates the concept of composition, where class `ShihTzu` contains an instance of class `Dog` and uses one of its methods (`bark()`).

```
class Dog

  def bark()
    puts "Woof!"
  end

end

class ShihTzu

  def initialize
    @dog = Dog.new
  end

  def bark()
    @dog.bark
  end

end

dog = Dog.new
dog.bark #=> Woof!

little_dog = ShihTzu.new
little_dog.bark #=> Woof!
```
## Composition vs Inheritance

_Why would we prefer composition over inheritance?_

It's very subjective! But, in general you would use inheritance where you want all of the methods from a class, and composition where you might only want to take some elements.

For example, we'd probably want our `ShihTzu` class to __inherit__ `Dog` but only __have an instance of__ class `Animal`, which includes functionality that all animals might have. All animals are __composed with__ an instance of `Animal` class inside them, but only dogs will __inherit__ behaviour from class `Dog`.