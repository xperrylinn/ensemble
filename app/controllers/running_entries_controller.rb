class RunningEntriesController < ApplicationController
  before_action :set_running_entry, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token
  # GET /running_entries
  # GET /running_entries.json
  def index
    @running_entries = RunningEntry.all
  end

  # GET /running_entries/1
  # GET /running_entries/1.json
  def show
  end

  # # GET /running_entries/new
  # def new
  #   @running_entry = RunningEntry.new
  # end

  # GET /running_entries/new
  def new
    strava_token_expires_at = current_user.strava_expires_at.to_i
    valid_token = Time.at(strava_token_expires_at) > Time.now
    if (current_user.strava_access_token).nil? or !valid_token
      redirect_to "http://www.strava.com/oauth/authorize?client_id=" + ENV["STRAVA_CLIENT_ID"] +
                  "&response_type=code&redirect_uri=" + ENV["STRAVA_REDIRECT_URI"] + 
                  "&approval_prompt=force&scope=" + ENV["STRAVA_REQUESTED_SCOPES"]
    end
    @running_entry = RunningEntry.new()
  end

  def new_from_strava
  end

  # GET /running_entries/1/edit
  def edit
  end

  # POST /running_entries
  # POST /running_entries.json
  def create
    logger.debug "Hey!? DEBUG!! #{params}"
    @running_entry = RunningEntry.new(running_entry_params)

    respond_to do |format|
      if @running_entry.save
        format.html { redirect_to @running_entry, notice: 'Running entry was successfully created.' }
        format.json { render :show, status: :created, location: @running_entry }
      else
        format.html { render :new }
        format.json { render json: @running_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /running_entries/1
  # PATCH/PUT /running_entries/1.json
  def update
    respond_to do |format|
      if @running_entry.update(running_entry_params)
        format.html { redirect_to @running_entry, notice: 'Running entry was successfully updated.' }
        format.json { render :show, status: :ok, location: @running_entry }
      else
        format.html { render :edit }
        format.json { render json: @running_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /running_entries/1
  # DELETE /running_entries/1.json
  def destroy
    @running_entry.destroy
    respond_to do |format|
      format.html { redirect_to running_entries_url, notice: 'Running entry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_running_entry
      @running_entry = RunningEntry.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def running_entry_params
      params.require(:running_entry).permit(:strava_activity)
    end
end
