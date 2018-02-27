require_relative '../../../../lib/mdt/errors/override_needed'

RSpec.describe MDT::Errors::OverrideNeeded do
  it 'has the correct description' do
    e = MDT::Errors::OverrideNeeded.new('test')
    expect(e.message).to eq 'Method test must be overriden in a subclass!'
  end
end