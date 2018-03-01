require 'fileutils'
require_relative '../errors/override_needed'
require_relative '../modules/extensible'

module MDT
  # A module containing all directory choosers
  module DirectoryChoosers
    # A base class for directory choosers
    class Base
      include MDT::Extensible

      # A method that defines how to create a deploy directory with directory choosers. Raises MDT::Errors::OverrideNeeded.
      # Arguments:
      # * +key+ - a key identifier of a particular directory chooser
      # * +options+ - options for directory chooser as a Hash
      def mkdir(key, options = {})
        raise MDT::Errors::OverrideNeeded.new('mkdir')
      end

      # A method that defines how to change the working directory to a deploy directory with directory choosers. Raises MDT::Errors::OverrideNeeded.
      # Arguments:
      # * +key+ - a key identifier of a particular directory chooser
      # * +options+ - options for directory chooser as a Hash
      def cd(key, options = {})
        raise MDT::Errors::OverrideNeeded.new('cd')
      end

      # A method that defines how to remove a deploy directory with directory choosers. Raises MDT::Errors::OverrideNeeded.
      # Arguments:
      # * +key+ - a key identifier of a particular directory chooser
      # * +options+ - options for directory chooser as a Hash
      def rm(key, options = {})
        raise MDT::Errors::OverrideNeeded.new('rm')
      end
    end
  end
end