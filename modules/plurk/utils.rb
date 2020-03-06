module Plurk
  module Utils
    def check_token
      access "/APP/checkToken"
    end

    def expire_token
      access "/APP/expireToken"
    end

    def check_time
      access "/APP/checkTime"
    end

    def echo(data = nil, **hash)
      hash["data"] ||= data

      access "/APP/echo", hash
    end
  end
end
