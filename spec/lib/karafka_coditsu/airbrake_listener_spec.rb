# frozen_string_literal: true

RSpec.describe_current do
  subject(:airbrake_listener) { described_class.new }

  describe '#on_error_occurred' do
    let(:error) { StandardError.new('test error') }
    let(:event) { { error: } }

    before { allow(Airbrake).to receive(:notify) }

    it 'notifies airbrake with the error' do
      airbrake_listener.on_error_occurred(event)
      expect(Airbrake).to have_received(:notify).with(error)
    end

    it 'responds to on_error_occurred' do
      expect(airbrake_listener.respond_to?(:on_error_occurred)).to be(true)
    end
  end
end
