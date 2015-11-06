class EntryLog < ActiveRecord::Base
  belongs_to :entry
  belongs_to :user

  validates :entry_id, :user_id, :revision, :body, presence: true
end
