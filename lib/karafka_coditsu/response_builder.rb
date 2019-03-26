# frozen_string_literal: true

module KarafkaCoditsu
  # Wraps up a builder for generating a pretty json with a internal compatible format
  # with the event type included
  module ResponseBuilder
    class << self
      # @param method_name [Symbol] method name
      # @param args [Array] arguments
      # @param block [Proc] block passed to the method we handle with method_missing
      # @return [Hash] Hash with an event and resource
      # @example
      #   Karafka::Coditsu::ResponseBuilder.created(1) #=> { resource: 1, event: :created }
      def method_missing(method_name, *args, &block)
        return super unless args.size == 1
        return super if block

        {
          resource: args[0],
          event: method_name
        }
      end

      # @param _method_name [Symbol] name of method
      # @param _include_private [Boolean] should be included in private checks
      # @return [Boolean] do we take care of this missing method
      def respond_to_missing?(_method_name, _include_private = false)
        true
      end
    end
  end
end
