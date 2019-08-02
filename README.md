```ruby
class Parent < ApplicationRecord
  has_many :children
  accepts_nested_attributes_for :children
end
```

```ruby
class Child < ApplicationRecord
  belongs_to :parent
  validates :name, presence: true
  validate -> { errors.add(:base, 'Parent is invalid') unless parent.valid? }
end
```

```ruby
class ParentTest < ActiveSupport::TestCase
  test "invalid when nested object is invalid" do
    parent = Parent.new(children_attributes: [{}, { name: 'Second Child'}])
    assert_equal false, parent.children.first.valid?
    assert_equal false, parent.valid?
  end
end
```

```sh
rails-nested-validation-test (master) $ bin/rake
Running via Spring preloader in process 10560
Run options: --seed 29533

# Running:

F

Failure:
ParentTest#test_invalid_when_nested_object_is_invalid [/Users/kevinthompson/Code/rails-nested-validation-test/test/models/parent_test.rb:7]:
Expected: false
  Actual: true


bin/rails test test/models/parent_test.rb:4



Finished in 0.054285s, 18.4213 runs/s, 36.8426 assertions/s.
1 runs, 2 assertions, 1 failures, 0 errors, 0 skips
```