class Entry < ActiveRecord::Base
  has_secure_token :token
  belongs_to :user
  has_many :reviewer_entries, dependent: :destroy

  validate :body, :user_id, presence: true
end
