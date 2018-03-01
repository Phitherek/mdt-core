module MDT
  # A module to make the class a MDT base class
  module Extensible
    # Adds needed class methods when included in a class.
    # Arguments:
    # * +klass+ - the class a module is being included in
    def self.included(klass)
      klass.class_eval do
        # Stores the descendant classes.
        @descendants = []
        # Defines a key that a subclass can be found by. Raises MDT::Errors::OverrideNeeded.
        def self.key
          raise MDT::Errors::OverrideNeeded.new('key')
        end

        # Defines a set of subkeys that can be passed to class methods. Raises MDT::Errors::OverrideNeeded.
        def self.subkeys
          raise MDT::Errors::OverrideNeeded.new('subkeys')
        end

        # Adds a subclass to the descendants variable when it is inherited and makes the list unique.
        # Arguments
        # * +subclass+ - a subclass that the class is inherited by.
        def self.inherited(subclass)
          @descendants << subclass
          @descendants.uniq!
        end

        # Exposes descendants variable.
        def self.descendants
          @descendants
        end
      end
    end
  end
end