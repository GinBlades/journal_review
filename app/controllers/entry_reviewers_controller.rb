class EntryReviewersController < ApplicationController
  before_action :set_entry

  def new
    @entry_reviewer = @entry.entry_reviewers.build
  end

  def create
    @entry_reviewer = @entry.entry_reviewers.build(entry_reviewer_params)

    if @entry_reviewer.save
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

    def entry_reviewer_params
      params.require(:entry_reviewer).permit(:user_id)
    end
end
