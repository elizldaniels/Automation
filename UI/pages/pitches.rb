require_relative 'base_page'

class Email < BasePage

	Command_Center = {id: 'command-center-grid'}
	New_Email = {id: 'new-email'}
	Send_To = {css: '.compose-meta .field>input, .compose-meta .field input.contact-autocomplete'}
	Email_Template = {css: '.template-select-area > div:nth-child(4)'}
	Send_Email = {css: '#compose-send-enabled .send-email'}
	Not_Sent = {id: 'notificationModal'}
	Sub_Line = {xpath: '//div[@id="cke_1_contents"]/iframe/html/body/div[1]'}

	def initialize (driver)
		super
		visit '/next#emails/command_center'
	end

	def to(recipient)
		click New_Email
		wait_for(10) { is_displayed? Send_To }
		type_enter recipient, Send_To
		wait_for(10) { is_displayed? Send_To }
		click Email_Template
		sleep(10)
		click Send_Email
	end

	def was_sent?
		is_displayed? Not_Sent
	end
end

		#TODO
		#find a better way to wait for the body text to load
		#wait_for(15) { is_displayed? Sub_Line }

