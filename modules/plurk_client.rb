require_relative "plurk_module.rb"
require_relative "plurk/timeline.rb"
require_relative "plurk/response.rb"

class PlurkClient
  extend PlurkModule
  include Plurk::Timeline
  include Plurk::Response
end
