class ReviewerEntriesController < ApplicationController
  before_action :set_entry

  def new
    @reviewer_entry = @entry.reviewer_entries.build
  end

  def create
    @reviewer_entry = @entry.reviewer_entries.build(reviewer_entry_params)

    if @reviewer_entry.save
      redirect_to @entry
    else
      render :new
    end
  end

  def destroy
  end

  private

    def set_entry
      @entry = Entry.find(params[:entry_id])
    end

    def reviewer_entry_params
      params.require(:reviewer_entry).permit(:user_id)
    end
end
