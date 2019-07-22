# frozen_string_literal: true

RSpec.describe_current do
  describe 'dynamically generated responses' do
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
        expect(result).to eq(resource: args[0], event: name)
      end
    end
  end

  describe '#respond_to?' do
    it { expect(described_class.respond_to?(:test_name)).to eq(true) }
  end
end
