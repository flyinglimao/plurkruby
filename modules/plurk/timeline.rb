module Plurk
  module Timeline
    def get_plurk(plurk_id = nil, **hash)
      hash[:plurk_id] ||= plurk_id
      access "/APP/Timeline/getPlurk", hash
    end

    def get_plurks(**hash)
      access "/APP/Timeline/getPlurks", hash
    end

    def get_unread_plurks(**hash)
      access "/APP/Timeline/getPlurks", hash
    end

    def get_public_plurks(user_id, **hash)
      hash[:user_id] ||= user_id

      access "/APP/Timeline/getPlurks", hash
    end

    def add_plurk(content = nil, qualifier = ":", **hash)
      hash[:content] ||= content
      hash[:qualifier] ||= qualifier

      access "/APP/Timeline/plurkAdd", hash
    end

    def delete_plurk(plurk_id = nil, **hash)
      hash[:plurk_id] ||= plurk_id

      access "/APP/Timeline/plurkAdd", hash
    end

    def edit_plurk(plurk_id = nil, content = nil, **hash)
      hash[:plurk_id] ||= plurk_id
      hash[:content] ||= content

      access "/APP/Timeline/plurkEdut", hash
    end

    def toggle_comments(plurk_id = nil, no_comments = nil, **hash)
      hash[:plurk_id] ||= plurk_id
      hash[:no_comments] ||= no_comments

      access "/APP/Timeline/toggleComments", hash
    end

    def mute_plurks(ids = nil, **hash)
      hash[:ids] ||= [*ids]

      access "/APP/Timeline/mutePlurks", hash
    end

    def unmute_plurks(ids = nil, **hash)
      hash[:ids] ||= [*ids]

      access "/APP/Timeline/unmutePlurks", hash
    end

    def favorite_plurks(ids = nil, **hash)
      hash[:ids] ||= [*ids]

      access "/APP/Timeline/favoritePlurks", hash
    end

    def unfavorite_plurks(ids = nil, **hash)
      hash[:ids] ||= [*ids]

      access "/APP/Timeline/unfavoritePlurks", hash
    end

    def replurks(ids = nil, **hash)
      hash[:ids] ||= [*ids]

      access "/APP/Timeline/replurk", hash
    end

    def unreplurks(ids = nil, **hash)
      hash[:ids] ||= [*ids]

      access "/APP/Timeline/unreplurk", hash
    end

    def mark_as_read(ids = nil, **hash)
      hash[:ids] ||= [*ids]

      access "/APP/Timeline/markAsRead", hash
    end

    def upload_picture(image = nil, **hash)
      hash[:image] ||= image

      raise 'Not implemented'
    end

    def report_abuse(plurk_id = nil, category = nil, **hash)
      hash[:plurk_id] ||= plurk_id
      hash[:category] ||= category

      access "/APP/Timeline/reportAbuse", hash
    end
  end
end
