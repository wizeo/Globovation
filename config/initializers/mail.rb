ActionMailer::Base.smtp_settings = {
	address: 'smtp.mandrillapp.com',
	port: 587,
	enable_starttls_auto: true,
	user_name: 'globovatoin@gmail.com',
	password: 'B4wFqwkT9ALLfkWsfyTb0Q',
	authentication: 'login'
}

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.default charset: 'utf-8'