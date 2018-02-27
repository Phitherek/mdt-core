require_relative '../../../../lib/mdt/errors/override_needed'
module MDT
  module ExtensibleSpecModule
    def self.included(klass)
      klass.class_eval do
        it 'requires key to be overriden in a subclass' do
          expect { described_class.key }.to raise_error(MDT::Errors::OverrideNeeded, 'Method key must be overriden in a subclass!')
        end

        it 'requires subkeys to be overriden in a subclass' do
          expect { described_class.subkeys }.to raise_error(MDT::Errors::OverrideNeeded, 'Method subkeys must be overriden in a subclass!')
        end

        it 'should have descendants as an array' do
          expect(described_class.descendants).to be_a(Array)
        end
      end
    end
  end
end