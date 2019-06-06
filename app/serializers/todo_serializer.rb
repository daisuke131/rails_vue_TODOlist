# frozen_string_literal: true

class TodoSerializer < ActiveModel::Serializer
  attributes :id, :body, :done
end
