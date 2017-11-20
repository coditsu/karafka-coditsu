# frozen_string_literal: true

module KarafkaCoditsu
  # Default Karafka parser that always wraps outgoing messages with data key
  class Parser < Karafka::Parsers::Json
    # @param content [Object] any object that we want to convert to a json string
    # @return [String] Valid JSON string containing serialized data
    # @raise [Karafka::Errors::ParserError] raised when we don't have a way to parse
    #   given content to a json string format
    # @note We always wrap data that we process in the "data" namespace, so we have
    #   a constant convention across all the apps.
    #
    # @example From an ActiveRecord object
    #   Json.generate(Repository.first) #=> "{\"data\": {\"repository\":{\"id\":\"04b504e0\"}}}"
    # @example From a string
    #   Json.generate("{\"a\":1}") #=> "{\"data\": {\"a\":1}}"
    def self.generate(content)
      return { data: content }.to_json if content.is_a?(String)
      return { data: content }.to_json if content.respond_to?(:to_json)
      raise Karafka::Errors::ParserError, content
    end
  end
end
