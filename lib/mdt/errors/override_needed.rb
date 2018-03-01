module MDT
  # A module containing all MDT errors
  module Errors
    # An error thrown when a method in a base class needs to be overriden in a subclass.
    class OverrideNeeded < StandardError
      # Initializes the error with the method key to be shown in error message.
      # Arguments:
      # * +method_key+ - the key of the method that needs to be overriden
      def initialize(method_key)
        super("Method #{method_key} must be overriden in a subclass!")
      end
    end
  end
end