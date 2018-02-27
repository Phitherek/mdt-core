require_relative '../../../../lib/mdt/fetchers/base'
require_relative '../modules/extensible_spec_module'

RSpec.describe MDT::Fetchers::Base do
  include MDT::ExtensibleSpecModule

  it 'requires fetch to be overriden in a subclass' do
    f = MDT::Fetchers::Base.new
    expect { f.fetch('base') }.to raise_error(MDT::Errors::OverrideNeeded, 'Method fetch must be overriden in a subclass!')
  end
end