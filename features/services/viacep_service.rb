class ViaCep
  include HTTParty

  base_uri CONFIG['url_default'].to_s

  def get_request(path)
    self.class.get("/ws/#{path[:path]}/json/")
  end

end
