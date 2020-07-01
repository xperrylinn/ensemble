require "uri"
require "net/http"
# require "JSON"

class StravaController < ApplicationController
  def exchange_token
    logger.debug "Hey!? DEBUG!! #{params}"
    logger.debug "Hey!? DEBUG new auth code!!: #{params["code"]}"
    authorization_code = params["code"]
    accepted_scopes = params["scope"]

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
    logger.debug "Hey!? DEBUG!! params before strava post req #{params}"
    res = Net::HTTP.post_form(URI.parse('https://www.strava.com/oauth/token'), params)
    logger.debug "Hey!? DEBUG!! post res #{res}"
    logger.debug "Hey!? DEBUG!! post res.body #{res.body}"
    res = JSON.parse(res.body)
    logger.info ENV["STRAVA_CLIENT_ID"]
    current_user.strava_client_id = ENV["STRAVA_CLIENT_ID"]
    current_user.strava_access_token = res["access_token"]
    current_user.strava_expires_at = res["expires_at"]
    current_user.strava_refresh_token = res["refresh_token"]
    current_user.strava_accepted_scopes = accepted_scopes
    logger.debug "Hey!? DEBUG!! #{current_user.attributes.inspect}"
    logger.debug "Hey!? DEBUG!! #{current_user.strava_client_id}"
    logger.debug "Hey!? DEBUG!! #{current_user.strava_access_token}"
    logger.debug "Hey!? DEBUG!! #{current_user.strava_expires_at}"
    logger.debug "Hey!? DEBUG!! #{current_user.strava_refresh_token}"
    logger.debug "Hey!? DEBUG!! #{current_user.strava_accepted_scopes}"
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
