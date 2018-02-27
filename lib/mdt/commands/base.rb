require_relative '../errors/override_needed'
require_relative '../modules/extensible'

module MDT
  module Commands
    class Base
      include MDT::Extensible

      def command(key, options = {})
        raise MDT::Errors::OverrideNeeded.new('command')
      end
    end
  end
end