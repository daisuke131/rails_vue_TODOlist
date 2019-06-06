# frozen_string_literal: true

class Todo < ApplicationRecord
  validates :body, presence: true
end
