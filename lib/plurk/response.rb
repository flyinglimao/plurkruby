class Plurk
  module Response
    def add_response(plurk_id = nil, content = nil, qualifier = ':', **hash)
      hash["plurk_id"] ||= plurk_id
      hash["content"] ||= content
      hash["qualifier"] ||= qualifier

      access "/APP/Responses/responseAdd", hash
    end

    def get_response(plurk_id = nil, **hash)
      hash["plurk_id"] ||= plurk_id

      access "/APP/Responses/get", hash
    end

    def delete_response(plurk_id = nil, response_id = nil, **hash)
      hash["response_id"] ||= response_id
      hash["plurk_id"] ||= plurk_id

      access "/APP/Responses/responseDelete", hash
    end
  end
end
