# frozen_string_literal: true

module Cleanse
  module Cleaner
    def self.included(cleanable_class)
      clean!(cleanable_class)
    end

    def self.clean!(cleanable_class)
      return if cleanable_class.abstract_class?

      includable_modules = cleanable_class.constants.map do |constant|
        cleanable_class.const_get(constant)
      end

      includable_modules.each do |constant|
        cleanable_class.include(constant) if constant.instance_of?(Module)
      end
    end
  end
end
