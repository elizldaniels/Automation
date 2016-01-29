require_relative 'base_page'

class Login < BasePage

	Login_Form = {id: 'new_user_session'}
	Ussername_Input = {id: 'user_session_email'}
	Password_Input = {id: 'user_session_password'}
	Submit_Button = {id: 'user_session_submit'}
	Login_Success = {css: '.pane-header h3'}
	Error_Message= {css: '.narrow .narrow-box .narrow-body form .formError'}

	def initialize(driver)
		super
		visit '/login'
		raise 'Login Page Is Not Ready' unless 
			@driver.find_element(Login_Form).displayed?
	end
	
	def with(username, password)
	    clear Ussername_Input
	    type username, Ussername_Input
	    clear Password_Input
	    type password, Password_Input
	    click Submit_Button
  	end	

  	def login_was_success?
  		is_displayed? Login_Success
  	end

  	def error_message_present?
  		is_displayed? Error_Message
  	end	

end  	

#TODO
#username length
#password length



