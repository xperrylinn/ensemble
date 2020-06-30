class AddStravaClientIdAndStravaAccessTokenAndStravaExpiresAtAndStravaRefreshTokenAndStravaAcceptedScopesToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :strava_client_id, :string
    add_column :users, :strava_access_token, :string
    add_column :users, :strava_expires_at, :string
    add_column :users, :strava_refresh_token, :string
    add_column :users, :strava_accepted_scopes, :string
  end
end
