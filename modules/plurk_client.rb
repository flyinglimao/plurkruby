require_relative "../modules/plurk_module.rb"
require_relative "plurk/timeline.rb"

class PlurkClient
  extend PlurkModule
  include Plurk::Timeline
end
