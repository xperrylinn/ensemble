class EntriesController < ApplicationController
    def index
        # logger.debug "Entires#index params: #{params}"
        # if params[:id].nil?
        #     @entries = Entry.all
        # else
        #     logger.debug "User we found the user! #{params}"
        #     @entries = Entry.all.where(user_id: params[:id])
        # end
        @entries = Entry.all
    end

    def user_index
        @entries = Entry.all.where(user_id: params[:id])
        render "index"
    end
    
    def show
        @entry = Entry.find(params[:id])
    end

    def new
        @entry = Entry.new(activity_id: params[:id])
    end

    def edit
        @entry = Entry.find(params[:id])
    end

    def create
        @entry = Entry.new(entry_params)
        @entry.images.attach(params[:images])
        if @entry.save
          redirect_to @entry
        else
          render 'new'
        end
    end

    def update
        @entry = Entry.find(params[:id])
        @entry.images.attach(params[:images])
        if @entry.update(entry_params)
          redirect_to @entry
        else
          render 'edit'
        end
    end

    def destroy
        @entry = Entry.find(params[:id])
        @entry.destroy
       
        redirect_to entries_path
    end
       
    private
    def entry_params
        params.require(:entry).permit(:title, :text, :activity_id, :images)
    end
end
