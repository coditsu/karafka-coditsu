# frozen_string_literal: true

RSpec.describe KarafkaCoditsu::AirbrakeListener do
  subject(:airbrake_listener) { described_class }

  describe 'error trigger event' do
    let(:caller_class) { Class.new }
    let(:error) { Class.new(StandardError) }

    it 'expect to notify airbrake' do
      expect(Airbrake).to receive(:notify).with(error)
      airbrake_listener.on_notice_error(caller_class, { error: error })
    end
  end

  describe 'respond to missing' do
    it { expect(airbrake_listener.respond_to?(:on_notice_error)).to eq true }
  end
end
