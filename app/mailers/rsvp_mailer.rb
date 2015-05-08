class RsvpMailer < ActionMailer::Base

  def rsvp_email(primary, guests, message)
    @primary = primary
    @guests  = guests
    @message = message

    #subject_prefix = primary.attending? ? "Attending" : "Not Attending"

    mail(:from => '"eimeeanddaron.com" <daronjp@gmail.com>', :to => 'daronjp@gmail.com', :subject => "New RSVP")
    
  end

end
