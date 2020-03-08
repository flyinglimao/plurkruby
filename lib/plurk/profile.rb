class Plurk
  module Profile
    def get_profile(user = nil, **hash)
      hash["user_id"] ||= hash["user"] || user

      if hash["user_id"]
        access "/APP/Profile/getPublicProfile", hash
      else
        access "/APP/Profile/getOwnProfile"
      end
    end
  end
end
