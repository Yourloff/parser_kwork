require 'faraday'

class ParserResponse
  LINK_WORK = 'https://kwork.ru'
  def initialize(category, attr)
    @category = category
    @attr = attr
  end

  def response
    JSON.parse connect.post('projects') { |req| req.params['c'] = @category }.body
  end

  private

  def connect
    Faraday.new(
      url: LINK_WORK,
      params: { attr: @attr },
      headers: {
        'Content-Type' => 'application/json',
        'Accept' => 'application/json, text/plain, */*',
        'X-Requested-With' => 'XMLHttpRequest',
        'User-Agent' => 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36'
      }
    )
  end
end
