require "uri"
require "net/http"
# require "JSON"

class StravaController < ApplicationController
  def exchange_token
    authorization_code = params["code"]
    accepted_scopes = params["scope"]

    #  curl -X POST https://www.strava.com/oauth/token \
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
    res = JSON.parse(res.body)

    current_user.update(
      strava_client_id: ENV["STRAVA_CLIENT_ID"],
      strava_access_token: res["access_token"],
      strava_expires_at: res["expires_at"],
      strava_refresh_token: res["refresh_token"],
      strava_accepted_scopes: accepted_scopes
    )
    
    redirect_to '/running_entries/new'

  end
end
