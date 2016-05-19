class EntriesController < ApplicationController
  def new
    @entry = Entry.new
  end

  def create
    @entry = Entry.new(entry_params)
    if @entry.save
      redirect_to new_entry_path, notice: 'Thank you!'
    else
      render :new
    end
  end

  def index
  end

  def entry_params
    params.require(:entry).permit(:name)
  end
end
