require_relative '../errors/override_needed'
require_relative '../modules/extensible'

module MDT
  # A module containing all command modifiers
  module CommandModifiers
    # A base class for command modifiers
    class Base
      include MDT::Extensible

      # A method that defines how to prepend command modifiers to commands. Raises MDT::Errors::OverrideNeeded.
      # Arguments:
      # * +key+ - a key identifier of a particular command modifier
      # * +command+ - a command to apply command modifier on
      # * +options+ - options for modifier as a Hash
      def prepend(key, command, options = {})
        raise MDT::Errors::OverrideNeeded.new('prepend')
      end
    end
  end
end