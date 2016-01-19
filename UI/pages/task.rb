require_relative 'base_page'
require 'pry'

def wait_and_type_enter text, element
	wait_for(10) { is_displayed? element }
	type_enter text, element
end

class Task < BasePage 
	Create_Task = {xpath: '//*[@id="command-center-grid"]/div[2]/div[1]/div[1]/a'}
	Subject = {xpath: '//*[@id="s2id_reminder-subject-selector"]/a'}
	Type_Subject = {css: '.select2-focused'}
	Contact_Person = {css: '.custom-contact-autocomplete input'}
	Notes = {css: '.notes-control-group textarea'}
	Save_Task = {css: '.modal-footer button'}

	def initialize(driver)
		super
	end

	def create()
		click Create_Task
		wait_for(10) { is_displayed? Subject }
		click Subject
		# binding.pry
		wait_and_type_enter 'Automated Template', Type_Subject
		wait_and_type_enter 'qateam@toutapp.com', Contact_Person
		type_paragraph Notes, 2
		click Save_Task
	end

end




#TODO
#unable to  use send keys with chrome - need to lookinto this
#create task from email
#create task from campaign
