# frozen_string_literal: true

require_relative 'cleanse/version'
require_relative 'cleanse/cleaner'

module Cleanse
  def self.children_of(parent_class)
    parent_class.descendants
  end

  if defined?(ActiveSupport)
    ActiveSupport.on_load(:after_initialize) do
      Cleanse.clean_rails_models!
    end
  end

  def self.clean_rails_models!
    parent_class = 'ApplicationRecord'.safe_constantize || 'ActiveRecord::Base'.safe_constantize || nil
    return unless parent_class

    cleanable_classes = children_of(parent_class)
    cleanable_classes.each do |cleanable_class|
      cleanable_class.include(Cleanse::Cleaner)
    end
  end
end
