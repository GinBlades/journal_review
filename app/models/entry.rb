class Entry < ActiveRecord::Base
  has_secure_token :token
  belongs_to :user
  has_many :reviewer_entries, dependent: :destroy
  has_many :entry_logs, dependent: :destroy
  after_save :log_entry

  validates :body, :user_id, presence: true

  protected

    def log_entry 
      return unless body_changed?

      last_entry = EntryLog.where(entry_id: id).first
      revision_number = last_entry ? (last_entry.revision + 1) : 0
      EntryLog.create(entry_id: id, body: body, revision: revision_number)
    end
end
