class EntryLog < ActiveRecord::Base
  belongs_to :entry

  validates :entry_id, :user_id, :revision, :body, presence: true
end
