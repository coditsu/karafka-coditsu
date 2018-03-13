# frozen_string_literal: true

module KarafkaCoditsu
  # Default parser that namespaces the data within a 'value' scope
  class Parser
    # @param content [String] content based on which we want to get our hash
    # @return [Hash] hash with parsed JSON data namespaced within a 'value' key
    # @example
    #   Parser.parse("{\"a\":1}") #=> { 'value' => { 'a' => 1 } }
    def self.parse(content)
      { 'value' => Karafka::Parsers::Json.parse(content) }
    end

    # @param content [Object] any object that we want to convert to a json string
    # @return [String] Valid JSON string containing serialized data
    def self.generate(content)
      Karafka::Parsers::Json.generate(content)
    end
  end
end
