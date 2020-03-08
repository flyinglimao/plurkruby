class Plurk
  module User
    def get_user
      access "/APP/Users/me"
    end

    def update_user(**hash)
      access "/APP/Users/update", hash
    end

    def update_avatar(image = nil, **hash)
      raise "Not implement"
    end

    def get_karma
      access "/APP/Users/getKarmaStats"
    end
  end
end
