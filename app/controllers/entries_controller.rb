class EntriesController < ApplicationController
    def index
        @entries = Entry.all
    end
    
    def show
        @entry = Entry.find(params[:id])
    end
    
    def new
    end

    def create
        @entry = Entry.new(entry_params)
       
        @entry.save
        redirect_to @entry
    end
       
    private
    def entry_params
        params.require(:entry).permit(:title, :text)
    end
end
