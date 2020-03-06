require_relative "plurk_module.rb"
require_relative "plurk/timeline.rb"
require_relative "plurk/response.rb"
require_relative "plurk/utils.rb"
require_relative "plurk/emoticon.rb"
require_relative "plurk/user.rb"

class PlurkClient
  extend PlurkModule
  include Plurk::Timeline
  include Plurk::Response
  include Plurk::Utils
  include Plurk::Emoticon
  include Plurk::User
end
