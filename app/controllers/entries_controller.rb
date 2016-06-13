class EntriesController < ApplicationController
  def new
    @entry = Entry.new
  end

  def create
    @entry = Entry.new(entry_params)
    if @entry.save
      redirect_to new_entry_url, notice: "Thank you!"
    else
      render :new
    end
  end

  def index
    respond_to do |f|

      f.html do
        @entries = Entry.all 
      end

      f.json do
        dt = params[:from].blank? ? Entry.first.created_at - 1.day : Entry.find(params[:from].to_i).created_at
        render json: Entry.where('created_at > ?', dt).to_json 
      end

    end
  end

private
  def entry_params
    params.require(:entry).permit(:name)
  end

  def entry_params
    params.require(:entry).permit(:name)
  end
end
