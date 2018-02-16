# frozen_string_literal: true

# Karafka Coditsu namespace with monitor and other things
module KarafkaCoditsu
  # Airbrake/Errbit listener for error only notifications upon Karafka problems
  module AirbrakeListener
    # Postfixes of things that we need to log
    PROBLEM_POSTFIXES = %w[
      _error
      _retry
    ].freeze

    class << self
      # All the events in which something went wrong trigger the *_error method, so we can
      #   catch all of them and notify Airbrake about that.
      #
      # @param method_name [Symbol] name of a method we want to run
      # @param args [Array] arguments of this method
      # @param block [Proc] additional block of this method
      def method_missing(method_name, *args, &block)
        return super unless eligible?(method_name)

        Airbrake.notify(args.last[:error])
      end

      # @param method_name [Symbol] name of a method we want to run
      # @return [Boolean] true if we respond to this missing method
      def respond_to_missing?(method_name, include_private = false)
        eligible?(method_name) || super
      end

      private

      # @param method_name [Symbol] name of invoked method
      def eligible?(method_name)
        PROBLEM_POSTFIXES.any? do |postfix|
          method_name.to_s.end_with?(postfix)
        end
      end
    end
  end
end
