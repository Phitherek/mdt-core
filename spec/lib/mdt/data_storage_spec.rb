require_relative '../../../lib/mdt/data_storage'

RSpec.describe MDT::DataStorage do
  it 'should be a Singleton' do
    expect { MDT::DataStorage.instance }.not_to raise_error
  end

  it 'should correctly assign values' do
    expect(MDT::DataStorage.instance.test = "Test Test").to eq("Test Test")
    expect(MDT::DataStorage.instance.test).to eq("Test Test")
  end

  it 'should return nil if value does not exist' do
    expect(MDT::DataStorage.instance.makapaka).to be_nil
  end
end