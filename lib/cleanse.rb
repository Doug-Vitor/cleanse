# frozen_string_literal: true

require_relative 'cleanse/version'
require_relative 'cleanse/cleaner'
require_relative 'cleanse/railtie' if defined?(Rails::Railtie)

module Cleanse
  def self.children_of(parent_class)
    parent_class.descendants
  end

  def self.clean_rails_models!
    parent_class = 'ApplicationRecord'.safe_constantize || 'ActiveRecord::Base'.safe_constantize
    return unless parent_class

    children_of(parent_class).each { |cleanable_class| clean_rails_model!(cleanable_class) }
  end

  def self.clean_rails_model!(cleanable_class)
    return unless cleanable_class.is_a?(Class) && defined?(ActiveRecord::Base) &&
                  cleanable_class < ActiveRecord::Base && !cleanable_class.abstract_class?

    cleanable_class.include(Cleanse::Cleaner)
  end
end
