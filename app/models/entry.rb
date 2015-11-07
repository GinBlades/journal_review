class Entry < ActiveRecord::Base
  has_secure_token :token
  belongs_to :user
  has_many :reviewer_entries, dependent: :destroy
  has_many :entry_logs, dependent: :destroy
  before_save do
    self.name = "Untitled" if name.blank?
  end

  validates :body, :user_id, presence: true

  def log_entry(user)
    last_entry = EntryLog.where(entry_id: id).order(:revision).last
    revision_number = last_entry ? (last_entry.revision + 1) : 0
    return if last_entry && (body == last_entry.body)
    EntryLog.create(entry_id: id, body: body, revision: revision_number, user_id: user.id)
  end
end
