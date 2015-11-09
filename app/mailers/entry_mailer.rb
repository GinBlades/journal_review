class EntryMailer < ApplicationMailer
  def new_entry(entry)
    @entry = entry
    mail(to: @entry.entry_reviewers.map(&:user).map(&:email), subject: "#{@entry.user.email} has posted a new journal entry.")
  end

  def reviewed_entry(entry)
    @entry = entry
    mail(to: @entry.user.email, subject: "Your entry was reviewed.")
  end
end
