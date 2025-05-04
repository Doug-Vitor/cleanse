# frozen_string_literal: true

require_relative 'cleanse/version'
require_relative 'cleanse/cleaner'

module Cleanse
  if defined?(ActiveRecord::Base)
    parent_classes = children_of(ActiveRecord::Base).flat_map do |parent_class|
      children_of(parent_class)
    end

    parent_classes.each do |parent_class|
      parent_class.include(Cleanse::Cleaner)
    end
  end

  def children_of(parent_class)
    parent_class.abstract_class? ? [] : parent.subclasses
  end
end
