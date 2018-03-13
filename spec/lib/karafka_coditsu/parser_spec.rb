# frozen_string_literal: true

RSpec.describe KarafkaCoditsu::Parser do
  subject(:parser_class) { described_class }

  describe '.parse' do
    context 'when we can parse given content and it is a nested hash' do
      let(:content_source) { { 'repository' => { 'name' => 'test', 'id' => rand } } }
      let(:content) { content_source.to_json }

      it 'expect to parse into a data key' do
        expect(parser_class.parse(content)).to eq('data' => content_source['repository'])
      end
    end

    context 'when content is malformatted' do
      let(:content) { 'abc' }

      it 'expect to raise with Karafka internal parsing error' do
        expect { parser_class.parse(content) }.to raise_error(::Karafka::Errors::ParserError)
      end
    end

    context 'when we can parse given content and it is a flat hash' do
      let(:content_source) { { 'name' => 'test', 'id' => rand } }
      let(:content) { content_source.to_json }

      it 'expect to parse into a data key' do
        expect(parser_class.parse(content)).to eq('data' => content_source)
      end
    end

    context 'when content is malformatted' do
      let(:content) { 'abc' }

      it 'expect to raise with Karafka internal parsing error' do
        expect { parser_class.parse(content) }.to raise_error(::Karafka::Errors::ParserError)
      end
    end
  end

  describe '.generate' do
    context 'when content is a string' do
      let(:content) { rand.to_s }

      it 'expect not to do anything' do
        expect(parser_class.generate(content)).to eq content
      end
    end

    context 'when content can be serialied with #to_json' do
      let(:content) { { rand.to_s => rand.to_s } }

      it 'expect to serialize it that way' do
        expect(parser_class.generate(content)).to eq content.to_json
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
