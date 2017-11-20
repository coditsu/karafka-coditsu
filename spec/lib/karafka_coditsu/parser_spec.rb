# frozen_string_literal: true

RSpec.describe KarafkaCoditsu::Parser do
  subject(:parser_class) { described_class }

  describe '.generate' do
    context 'when content is a string' do
      let(:content) { rand.to_s }

      it 'expects to put it in a data wrap' do
        expect(parser_class.generate(content)).to eq({ data: content }.to_json)
      end
    end

    context 'when content can be serialied with #to_json' do
      let(:content) { { rand.to_s => rand.to_s } }

      it 'expect to serialize it with data namespace' do
        expect(parser_class.generate(content)).to eq({ data: content }.to_json)
      end
    end

    context 'when content cannot be serialied with #to_json' do
      let(:content) { instance_double(Class, respond_to?: false) }

      it 'expect to raise parsing error' do
        expect { parser_class.generate(content) }.to raise_error(::Karafka::Errors::ParserError)
      end
    end
  end
end
