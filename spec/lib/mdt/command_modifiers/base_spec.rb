require_relative '../../../../lib/mdt/command_modifiers/base'
require_relative '../modules/extensible_spec_module'

RSpec.describe MDT::CommandModifiers::Base do
  include MDT::ExtensibleSpecModule

  it 'requires prepend to be overriden in a subclass' do
    cm = MDT::CommandModifiers::Base.new
    expect { cm.prepend('base', 'test') }.to raise_error(MDT::Errors::OverrideNeeded, 'Method prepend must be overriden in a subclass!')
  end
end