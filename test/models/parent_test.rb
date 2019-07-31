require 'test_helper'

class ParentTest < ActiveSupport::TestCase
  test "invalid when nested object is invalid" do
    parent = Parent.new(children_attributes: [{}, { name: 'Second Child'}])
    assert_equal false, parent.children.first.valid?
    assert_equal false, parent.valid?
  end
end
