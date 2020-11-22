class LiftingEntriesController < ApplicationController
    before_action :set_lifting_entry, only: [:show, :edit, :update, :destroy]
    skip_before_action :verify_authenticity_token
    
    # GET /lifting_entries
    # GET /lifting_entries.json
    def index
      @lifting_entries = LiftingEntry.all
    end
  
    # GET /lifting_entries/1
    # GET /lifting_entries/1.json
    def show
    end
  
    # # GET /lifting_entries/new
    # def new
    #   @lifting_entry = LiftingEntry.new
    # end
  
    # GET /lifting_entries/new
    def new
        @lifting_entry = LiftingEntry.new()
    end
  
    # GET /lifting_entries/1/edit
    def edit
    end
  
    # POST /lifting_entries
    # POST /lifting_entries.json
    def create
      lifting_entry_params
      @lifting_entry = LiftingEntry.new()
      
      respond_to do |format|
        if @lifting_entry.save
          format.html { redirect_to @lifting_entry, notice: 'Lifting entry was successfully created.' }
          format.json { render :show, status: :created, location: @lifting_entry }
        else
          format.html { render :new }
          format.json { render json: @lifting_entry.errors, status: :unprocessable_entity }
        end
      end
      
      @entry = Entry.new(generate_entry_params(@lifting_entry.id, "LiftingEntry"))
      @entry.images.attach(params[:lifting_entry][:images])
      result = @entry.save!
      logger.debug result
      logger.debug "@entry"
      logger.debug @entry.inspect
      logger.debug params[:lifting_entry][:exercises]
      logger.debug params[:lifting_entry][:exercises].class
      params[:lifting_entry][:exercises].each do |exercise_params|
        logger.debug exercise_params
        logger.debug exercise_params.class
        @new_exercise = Exercise.create(
          {
            "lifting_entry" => @lifting_entry,
            "name" => exercise_params[1]["name"],
            "sets" => exercise_params[1]["sets"],
            "reps" => exercise_params[1]["reps"],
            "rep_units" => exercise_params[1]["rep_units"],
            "weight" => exercise_params[1]["weight"],
            "weight_units" => exercise_params[1]["weight_units"],
            "rpe" => exercise_params[1]["rpe"],
            "notes" => exercise_params[1]["notes"],
        })
        
        logger.debug @new_exercise.attributes.inspect
        
        if @new_exercise.save
          logger.debug "saving @new_exercise"
        else
          logger.debug "not saving @new_exercise" 
          logger.debug  @new_exercise.errors.full_messages       
        end
      end
    end
  
    # PATCH/PUT /lifting_entries/1
    # PATCH/PUT /lifting_entries/1.json
    def update
      respond_to do |format|
        if @lifting_entry.update(lifting_entry_params)
          format.html { redirect_to @lifting_entry, notice: 'Lifting entry was successfully updated.' }
          format.json { render :show, status: :ok, location: @lifting_entry }
        else
          format.html { render :edit }
          format.json { render json: @lifting_entry.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # DELETE /lifting_entries/1
    # DELETE /lifting_entries/1.json
    def destroy
      @lifting_entry.destroy
      respond_to do |format|
        format.html { redirect_to lifting_entries_url, notice: 'Lifting entry was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_lifting_entry
        @lifting_entry = LiftingEntry.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def lifting_entry_params
        params.require(:lifting_entry).permit(
            :exercises,
            :activity_id, 
            :title, 
            :text,
            :images
        )
      end
  
      # Generate params for creating new Entry
      def generate_entry_params(entryable_id, entryable_type)
        entry_params = { 
          "title" => params[:lifting_entry][:title], 
          "text" => params[:lifting_entry][:text], 
          "activity_id" => params[:lifting_entry][:activity_id],
          "entryable_id" => entryable_id,
          "entryable_type" => entryable_type,
          "user_id" => current_user.id,
        }
        entry_params
      end
  
end
