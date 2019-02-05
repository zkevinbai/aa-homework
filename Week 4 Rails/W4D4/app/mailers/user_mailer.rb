class UserMailer < ApplicationMailer
    default from: "catarina@catrental.com"

    def welcome_email(user)
        @user = user
        @url = 'http://ninetyninecats.com/sessions.new'
        mail(to: user.username, subject: "Congratulations on Signing Up")
    end
end
