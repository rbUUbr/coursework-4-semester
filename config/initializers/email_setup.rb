ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
    address:              'smtp.gmail.com',
    port:                 587,
    domain:               'gentle-taiga-96997.herokuapp.com',
    user_name:            ENV["GMAIL_USER"],
    password:             ENV["GMAIL_PASSWORD"],
    authentication:       'plain',
    enable_starttls_auto: true
}
