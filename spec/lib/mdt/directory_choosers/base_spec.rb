require_relative '../../../../lib/mdt/directory_choosers/base'
require_relative '../modules/extensible_spec_module'

RSpec.describe MDT::DirectoryChoosers::Base do
  include MDT::ExtensibleSpecModule

  it 'requires mkdir to be overriden in a subclass' do
    dc = MDT::DirectoryChoosers::Base.new
    expect { dc.mkdir('base') }.to raise_error(MDT::Errors::OverrideNeeded, 'Method mkdir must be overriden in a subclass!')
  end

  it 'requires cd to be overriden in a subclass' do
    dc = MDT::DirectoryChoosers::Base.new
    expect { dc.cd('base') }.to raise_error(MDT::Errors::OverrideNeeded, 'Method cd must be overriden in a subclass!')
  end
end