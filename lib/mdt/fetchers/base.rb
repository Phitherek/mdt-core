require_relative '../errors/override_needed'
require_relative '../modules/extensible'

module MDT
  # A module containing all fetchers
  module Fetchers
    # A base class for fetchers
    class Base
      include MDT::Extensible

      # A method that defines how to fetch project contents to a deploy directory with fetchers. Raises MDT::Errors::OverrideNeeded.
      # Arguments:
      # * +key+ - a key identifier of a particular fetcher
      # * +options+ - options for fetchers as a Hash
      def fetch(key, options ={})
        raise MDT::Errors::OverrideNeeded.new('fetch')
      end
    end
  end
end