class Child < ApplicationRecord
  belongs_to :parent
  validates :name, presence: true
  validate -> { errors.add(:base, 'Parent is invalid') unless parent.valid? }
end
