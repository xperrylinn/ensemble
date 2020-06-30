require "uri"
require "net/http"

class StravaController < ApplicationController
  def exchange_token
    logger.debug "Hey!? DEBUG!! #{params}"
    logger.debug "Hey!? DEBUG!! #{params["code"]}"
    authorization_code = params["code"]

  #   curl -X POST https://www.strava.com/oauth/token \
	# -F client_id=YOURCLIENTID \
	# -F client_secret=YOURCLIENTSECRET \
	# -F code=AUTHORIZATIONCODE \
	# -F grant_type=authorization_code

    params = {'client_id' => ENV["STRAVA_CLIENT_ID"],
              'client_secret' => ENV["STRAVA_CLIENT_SECRET"],
              'code' => authorization_code,
              'grant_type' => 'authorization_code'
    }

    res = Net::HTTP.post_form(URI.parse('https://www.strava.com/oauth/token'), params)
    logger.debug "Hey!? DEBUG!! #{res}"
    puts res.body

  end
end
