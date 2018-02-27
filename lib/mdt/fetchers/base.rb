require_relative '../errors/override_needed'
require_relative '../modules/extensible'

module MDT
  module Fetchers
    class Base
      include MDT::Extensible

      def fetch(key, options ={})
        raise MDT::Errors::OverrideNeeded.new('fetch')
      end
    end
  end
end