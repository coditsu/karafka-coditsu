# frozen_string_literal: true

module KarafkaCoditsu
  # Default parser that namespaces the data within a 'data' scope
  class Parser
    # @param content [String] content based on which we want to get our hash
    # @return [Hash] hash with parsed JSON data namespaced within a 'data' key
    # @note This parser supports both old and new messaging format, so we can easily assume
    #   that proper data will be stored under the 'data' key. It normalizes both formats
    #   into the same output.
    #
    # @example Nested hash
    #   Parser.parse("{\"repository\":{\"name\":\"a\"}}") #=> { 'data' => { 'name' => 'a' } }
    #
    # @example Flatten hash
    #   Parser.parse("{\"name\":\"a\",\"id\":8}") #=> { 'data' => { 'name' => 'a', 'id' => 8 } }
    def self.parse(content)
      parsed = Karafka::Parsers::Json.parse(content)

      { 'data' => parsed.size == 1 ? parsed.values[0] : parsed }
    end

    # @param content [Object] any object that we want to convert to a json string
    # @return [String] Valid JSON string containing serialized data
    def self.generate(content)
      Karafka::Parsers::Json.generate(content)
    end
  end
end
