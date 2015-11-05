class ReviewerEntry < ActiveRecord::Base
  belongs_to :user
  belongs_to :entry
end
