# frozen_string_literal: true

RSpec.describe_current do
  subject(:airbrake_listener) { described_class.new }

  describe 'error trigger event' do
    let(:caller_class) { Class.new }
    let(:error) { Class.new(StandardError) }

    it 'expect to notify airbrake' do
      expect(Airbrake).to receive(:notify).with(error)
      airbrake_listener.on_notice_error(caller_class, error: error)
    end
  end

  describe 'respond to missing for #on_notice_error' do
    it { expect(airbrake_listener.respond_to?(:on_notice_error)).to eq true }
  end

  describe 'retry trigger event' do
    let(:caller_class) { Class.new }
    let(:error) { Class.new(StandardError) }

    it 'expect to notify airbrake' do
      expect(Airbrake).to receive(:notify).with(error)
      airbrake_listener.on_sync_producer_call_retry(caller_class, error: error)
    end
  end

  describe 'respond to missing for #on_sync_producer_call_retry' do
    it { expect(airbrake_listener.respond_to?(:on_sync_producer_call_retry)).to eq true }
  end
end
