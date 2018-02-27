require_relative '../../../../lib/mdt/commands/base'
require_relative '../modules/extensible_spec_module'

RSpec.describe MDT::Commands::Base do
  include MDT::ExtensibleSpecModule

  it 'requires command to be overriden in a subclass' do
    c = MDT::Commands::Base.new
    expect { c.command('base') }.to raise_error(MDT::Errors::OverrideNeeded, 'Method command must be overriden in a subclass!')
  end
end