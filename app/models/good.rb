class Good < ApplicationRecord
  validates :product, presence: true,
            length: { minimum: 1 }
end
