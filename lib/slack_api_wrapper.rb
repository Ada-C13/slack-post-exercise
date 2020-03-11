# slack_api_wrapper.rb
require "httparty"

module SlackApiWrapper
  BASE_URL = "https://slack.com/api/"
  API_KEY = ENV["SLACK_TOKEN"]
  POST_URL = "#{BASE_URL}/chat.postMessage"
  
  # Code goes here
  def self.send_msg(message, channel_name)
    resp = HTTParty.post(POST_URL, {
      headers: {
        "Content-Type": "application/x-www-form-urlencoded"
      },
      body: {
        token: API_KEY,
        channel: channel_name,
        text: message
      }
    })
    
    p POST_URL
    p API_KEY
    puts resp.body
    
    return resp.code == 200 && resp.parsed_response["ok"]
  end
end
