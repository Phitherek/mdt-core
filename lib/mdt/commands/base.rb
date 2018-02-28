require_relative '../errors/override_needed'
require_relative '../modules/extensible'

module MDT
  module Commands
    class Base
      include MDT::Extensible

      def execute(key, modifiers = [], options = {})
        raise MDT::Errors::OverrideNeeded.new('execute')
      end
    end
  end
end