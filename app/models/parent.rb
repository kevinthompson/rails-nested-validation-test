class Parent < ApplicationRecord
  has_many :children
  accepts_nested_attributes_for :children
end
