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
      
      @lifting_entry = LiftingEntry.new(lifting_entry_params)
      
      respond_to do |format|
        if @lifting_entry.save
          format.html { redirect_to @lifting_entry, notice: 'Lifting entry was successfully created.' }
          format.json { render :show, status: :created, location: @lifting_entry }
        else
          format.html { render :new }
          format.json { render json: @lifting_entry.errors, status: :unprocessable_entity }
        end
  
      @entry = Entry.new(generate_entry_params(@lifting_entry.id, "LiftingEntry"))
      @entry.save
  
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
            :lifting_entry_id, 
            :sets, 
            :reps, 
            :name, 
            :rpe, 
            :weight, 
            :notes, 
            :rep_units
        )
      end
  
      # Generate params for creating new Entry
      def generate_entry_params(entryable_id, entryable_type)
        entry_params = { 
          "title" => params[:lifting_entry][:title], 
          "text" => params[:lifting_entry][:text], 
          "activity_id" => params[:lifting_entry][:activity_id],
          "entryable_id" => entryable_id,
          "entryable_type" => entryable_type
        }
        entry_params
      end
  
end
