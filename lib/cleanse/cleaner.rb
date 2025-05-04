# frozen_string_literal: true

module Cleanse
  module Cleaner
    def self.included(cleanable_class)
      clean!(cleanable_class)
    end

    def self.clean!(cleanable_class)
      cleanable_class.constants.each do |constant|
        cleanable_class.include(constant) if !cleanable_class.abstract_class? && constant.is_a?(Module)
      end
    end
  end
end
