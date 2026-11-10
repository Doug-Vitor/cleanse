# frozen_string_literal: true

module Cleanse
  module Cleaner
    def self.included(cleanable_class)
      clean!(cleanable_class)
    end

    def self.clean!(cleanable_class)
      return if cleanable_class.respond_to?(:abstract_class?) && cleanable_class.abstract_class?

      cleanable_class.constants(false).each do |name|
        constant = cleanable_class.const_get(name, false)
        cleanable_class.include(constant) if constant.instance_of?(Module)
      end
    end
  end
end
