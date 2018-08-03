# frozen_string_literal: true

RSpec.describe KarafkaCoditsu::ResponseBuilder do
  subject(:result) { described_class.send(name, *args) }

  let(:name) { :test_name }

  context 'when we have too many args' do
    let(:args) { [1, 2] }

    it { expect { result }.to raise_error(NoMethodError) }
  end

  context 'when we dont have args' do
    let(:args) { [] }

    it { expect { result }.to raise_error(NoMethodError) }
  end

  context 'when we provide a block' do
    subject(:result) { described_class.send(name, *args) {} }

    let(:args) { [1] }

    it { expect { result }.to raise_error(NoMethodError) }
  end

  context 'when we have one arg and no block' do
    let(:args) { [1] }

    it 'expect to generate a proper hash with values' do
      is_expected.to eq(resource: args[0], event: name)
    end
  end
end
