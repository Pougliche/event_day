class UserMailer < ApplicationMailer
    default from: 'pugliese.viktor@gmail.com'
    layout 'welcome_email'

    def welcome_email(user)
        @user = user
        @url = 'www.lite-event.com/sessions/new'
        mail(to: @user.email, subject: 'welcome home !', body: 'something')

    end

    #def attendance_email(user)
        #@user = user
        #@url = 'www.lite-event.com/sessions/new'
        #mail(to: @user.email, subject: 'dont forget this event !', body: 'something')
    #end
end
