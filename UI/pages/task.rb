require_relative 'base_page'
#require 'pry'

def wait_and_type_enter text, element
	wait_for(10) { is_displayed? element }
	type_enter text, element
end

#non sf intigration
class Task < BasePage 
	Create_Task = {xpath: '//*[@id="command-center-grid"]/div[2]/div[1]/div[1]/a'}
	Subject = {id: 'reminder-subject-selector'}
	Type_Subject = {css: '.reminder-subject-selector-container input'}
	Contact_Person = {css: '.custom-contact-autocomplete input'}
	Notes = {css: '.notes-control-group textarea'}
	Save_Task = {css: '.modal-footer button'}
	New_Task = {css: '.middle-section .ellipse-text'}

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

	def was_created?
		is_displayed? New_Task
	end

end




#TODO
#create task from email - will need to wait till this gets fixed on production
#create task from campaign
