require "oauth"
require_relative "plurk/timeline.rb"
require_relative "plurk/response.rb"
require_relative "plurk/utils.rb"
require_relative "plurk/emoticon.rb"
require_relative "plurk/user.rb"
require_relative "plurk/profile.rb"

class Plurk
  include Plurk::Timeline
  include Plurk::Response
  include Plurk::Utils
  include Plurk::Emoticon
  include Plurk::User
  include Plurk::Profile

  class PlurkError < StandardError
    attr_reader :response
    def initialize(msg, response = nil)
      super(msg)
      @response = response
    end
  end

  def use_consumer(key, secret)
    @key = key
    @secret = secret
  end

  def use_token(token, secret)
    @token = token
    @secret_ = secret
  end

  def consumer
    raise PlurkError.new("Consumer not set yet") unless @key && @secret

    OAuth::Consumer.new(
        @key, @secret, {
          :site               => 'https://www.plurk.com',
          :request_token_path => '/OAuth/request_token',
          :access_token_path  => '/OAuth/access_token',
          :authorize_path     => '/OAuth/authorize'
        }
      )
  end

  def accessor
    raise PlurkError.new("User not set yet") unless @token && @secret_

    OAuth::AccessToken.from_hash(consumer, :oauth_token => @token, :oauth_token_secret => @secret_)
  end

  def access(path, data = {})
    response = accessor.post(path, data)
    raise PlurkError.new("Bad request: #{response.message}", response) if response.is_a? Net::HTTPClientError
    raise PlurkError.new("Server died: #{response.message}", response) if response.is_a? Net::HTTPServerError

    JSON.parse(response.body)
  end
end
