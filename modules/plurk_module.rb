require "oauth"
require "json"
require "yaml"

module PlurkModule
  class PlurkError < StandardError
    attr_reader :response
    def initialize(response = nil)
      @response = response
    end
  end

  def use_consumer(key, secret)
    define_method(:consumer) do
      OAuth::Consumer.new(
        key, secret, {
          :site               => 'https://www.plurk.com',
          :request_token_path => '/OAuth/request_token',
          :access_token_path  => '/OAuth/access_token',
          :authorize_path     => '/OAuth/authorize'
        }
      )
    end
  end

  def use_token(token, secret)
    define_method(:accessor) { OAuth::AccessToken.from_hash(consumer, :oauth_token => token, :oauth_token_secret => secret) }
    define_method(:access) do |path, data = {}|
      response = accessor.post(path, data)
      raise PlurkError.new(response), "Bad request: #{response.message}" if response.is_a? Net::HTTPClientError
      raise PlurkError.new(response), "Server died: #{response.message}" if response.is_a? Net::HTTPServerError

      JSON.parse(response.body)
    end
  end
end
