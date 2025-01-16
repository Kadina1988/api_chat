module ResponseBodyAsJson
  def json
    JSON.parse(response.body)
  end
end