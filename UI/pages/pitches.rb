require_relative 'base_page'

class Email < base_page

	Command_Center = {id: 'command-center-grid'}
	New_Email = {id: 'new-email'}
	Send_To = {css: 'input.contact-autocomplete'}
	Email_Template = {css: 'div.subject.no-wrap-text:contains("this is a test template")'}
	Send_Email = {xpath: '//div[@id="compose-send-enabled"]/button'}
	Not_Sent = {id: 'notificationModal'}

	def initialize (driver)
		super
		visit '/next#emails/command_center'
		raise 'The Page Has Not Loaded'
			@driver.find_element(Command_Center).displayed?
	end

	def to(recipient)
		click New_Email
		type recipient Send_To
		click Email_Template
		click Send_Email
	end

	def was_sent?
		is.displayed? notificationModal
	end
end


