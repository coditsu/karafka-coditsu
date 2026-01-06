# frozen_string_literal: true

module KarafkaCoditsu
  # Listener for error notifications upon Karafka problems
  # Subscribes to Karafka's error.occurred event and reports to Airbrake
  class AirbrakeListener
    # Karafka 2.x consolidated error event handler
    # All errors are reported through this single event
    #
    # @param event [Karafka::Core::Monitoring::Event] the error event
    def on_error_occurred(event)
      Airbrake.notify(event[:error])
    end
  end
end
