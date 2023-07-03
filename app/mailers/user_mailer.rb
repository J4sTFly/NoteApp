class UserMailer < ApplicationMailer
  default from: ENV.fetch('mailer_from', 'from@example.com')
  layout 'mailer'
  def confirm_email(token, email)
    @token = token

    mail(to: email, subject: I18n.t('mailer.confirm_email.subject'))
  end
end
