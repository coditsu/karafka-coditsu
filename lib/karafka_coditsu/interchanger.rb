# frozen_string_literal: true

module KarafkaCoditsu
  # Interchanger that allows us to use Sidekiq unique jobs
  # Since Sidekiq unique jobs rely on the 'uniqueness_scope' attribute from params
  # we cannot marshal everything directly. Instead we need to leave a hash with data and the
  # scope so we can use the scope later on
  class Interchanger
    class << self
      # @param params_batch [Karafka::Params::ParamsBatch] Karafka params batch object
      def encode(params_batch)
        [
          Base64.encode64(Marshal.dump(params_batch.parsed))
        ]
      end

      # @param params_batch [String] Encoded params batch string that we use to rebuild params
      # @return [Karafka::Params::ParamsBatch] rebuilt params batch
      def decode(params_batch)
        Marshal.load(Base64.decode64(params_batch))
      end
    end
  end
end
