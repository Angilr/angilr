# frozen_string_literal: true

# Field behaves
class Field < ApplicationRecord
  validates :name, presence: true
end
