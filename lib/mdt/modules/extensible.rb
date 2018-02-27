module MDT
  module Extensible
    def self.included(klass)
      klass.class_eval do
        @@descendants = []
        def self.key
          raise MDT::Errors::OverrideNeeded.new('key')
        end

        def self.subkeys
          raise MDT::Errors::OverrideNeeded.new('subkeys')
        end

        def self.inherited(subclass)
          @@descendants << subclass
          @@descendants.uniq!
        end

        def self.descendants
          @@descendants
        end
      end
    end
  end
end