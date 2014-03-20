class UserMailer < ActionMailer::Base
  	#default from: "from@example.com"
  	def registration_confirmation(user) 
   		@message = 'whatever you want to say here!'
   		mail(:from => "thank-you@whichbus.com", :to => user.email, :subject => "Thank you for registration")
	end
end
