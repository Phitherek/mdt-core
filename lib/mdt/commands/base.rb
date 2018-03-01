require_relative '../errors/override_needed'
require_relative '../modules/extensible'

module MDT
  # A module containing all commands
  module Commands
    # A base class for commands
    class Base
      include MDT::Extensible

      # A method that defines how to execute a command and how to apply command modifiers. Raises MDT::Errors::OverrideNeeded.
      # Arguments:
      # +key+ - a key identifier of a particular command
      # +modifiers+ - an array of command modifier configurations - each configuration is a Hash that includes modifier type and modifier options
      # +options+ - options for command as a Hash
      def execute(key, modifiers = [], options = {})
        raise MDT::Errors::OverrideNeeded.new('execute')
      end
    end
  end
end