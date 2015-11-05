require "rails_helper"

RSpec.describe EntryLog, type: :model do
  it "has a valid factory" do
    expect(build(:entry_log)).to be_valid
  end
end
