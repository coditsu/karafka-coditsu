# frozen_string_literal: true

module KarafkaCoditsu
  # Wraps up a builder for generating a pretty json with a internal compatible format
  # with the event type included
  module ResponseBuilder
    class << self
      # @param method_name [Symbol] method name
      # @param args [Array] arguments
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
    end
  end
end
