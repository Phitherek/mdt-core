require_relative '../errors/override_needed'
require_relative '../modules/extensible'

module MDT
  module CommandModifiers
    class Base
      include MDT::Extensible

      def prepend(key, command, options = {})
        raise MDT::Errors::OverrideNeeded.new('prepend')
      end
    end
  end
end