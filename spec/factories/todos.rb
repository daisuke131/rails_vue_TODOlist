# frozen_string_literal: true

FactoryBot.define do
  factory :todo do
    body { "MyString" }
    done { false }
  end
end
