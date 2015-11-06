class EntriesController < ApplicationController
  before_action :set_entry, only: [:show, :edit, :update, :destroy]

  def index
    @entries = Entry.all
  end

  def show
  end

  def new
    @entry = Entry.new
  end

  def edit
  end

  def create
    @entry = current_user.entries.build(entry_params)

    if @entry.save
      @entry.log_entry(current_user)
      redirect_to @entry, notice: 'Entry was successfully created.'
    else
      render :new
    end
  end

  def update
    if @entry.update(entry_params)
      @entry.log_entry(current_user)
      redirect_to @entry, notice: 'Entry was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @entry.destroy
    redirect_to entries_url, notice: 'Entry was successfully destroyed.'
  end

  private
    def set_entry
      @entry = Entry.find(params[:id])
    end

    def entry_params
      params.require(:entry).permit(:name, :body)
    end
end
