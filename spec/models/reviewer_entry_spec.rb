require "rails_helper"

RSpec.describe ReviewerEntry, type: :model do
  it "has a valid factory" do
    expect(build(:reviewer_entry)).to be_valid
  end
end
