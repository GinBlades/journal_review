class EntryMailer < ApplicationMailer
  def new_entry(entry)
    @entry = entry
    mail(to: @entry.reviewer_entries.map(&:user).map(&:email), subject: "#{@entry.user.email} has posted a new journal entry.")
  end

  def reviewed_entry(entry)
    @entry = entry
    mail(to: @entry.user.email, subject: "Your entry was reviewed.")
  end
end
