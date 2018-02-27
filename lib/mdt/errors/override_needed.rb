module MDT
  module Errors
    class OverrideNeeded < StandardError
      def initialize(method_key)
        super("Method #{method_key} must be overriden in a subclass!")
      end
    end
  end
end