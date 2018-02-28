require 'fileutils'
require_relative '../errors/override_needed'
require_relative '../modules/extensible'

module MDT
  module DirectoryChoosers
    class Base
      include MDT::Extensible

      def mkdir(key, options = {})
        raise MDT::Errors::OverrideNeeded.new('mkdir')
      end

      def cd(key, options = {})
        raise MDT::Errors::OverrideNeeded.new('cd')
      end

      def rm(key, options = {})
        raise MDT::Errors::OverrideNeeded.new('rm')
      end
    end
  end
end