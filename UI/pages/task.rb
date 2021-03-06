require_relative 'base_page'
#require 'pry'



#non sf intigration
class Task < BasePage 
	Create_Task = {xpath: '//*[@id="command-center-grid"]/div[2]/div[1]/div[1]/a'}
	Subject = {id: 'reminder-subject-selector'}
	Type_Subject = {css: '.reminder-subject-selector-container input'}
	Contact_Person = {css: '.custom-contact-autocomplete input'}
	Notes = {css: '.notes-control-group textarea'}
	Save_Task = {css: '.modal-footer button'}
	New_Task = {css: '.middle-section .ellipse-text'}
	Add_Date = {css: 'input.span2'}

	def initialize(driver)
		super
	end

#does not work with sales force connection
	def create()
		click Create_Task
		wait_for(20) { is_displayed? Subject }
		click Subject
		# binding.pry
		wait_and_type_enter 'Automated Template', Type_Subject
		wait_and_type_enter 'qateam@toutapp.com', Contact_Person
		type_paragraph Notes, 2
		click Save_Task
		sleep(2)
	end

	def for_tomorrow()
		click Create_Task
		wait_for(20) { is_displayed? Subject}
		click Subject
		wait_and_type_enter 'Automated Template', Type_Subject
		wait_and_type_enter 'qateam@toutapp.com', Contact_Person
		sleep(3)
		select_all_type 10, Add_Date, $tomorrow.strftime('%m/%d/%y')
		type_paragraph Notes, 2
		click Save_Task
		sleep(2)
	end

	def for_yesterday()
		click Create_Task
		wait_for(20) { is_displayed? Subject}
		click Subject
		wait_and_type_enter 'Automated Template', Type_Subject
		wait_and_type_enter 'qateam@toutapp.com', Contact_Person
		sleep(3)
		select_all_type 10, Add_Date, $yesterday.strftime('%m/%d/%y')
		type_paragraph Notes, 2
		click Save_Task
		sleep(2)
	end

	def was_created?
		is_displayed? New_Task
	end

end




#TODO
#create task from email - will need to wait till this gets fixed on production
#create task from campaign
#complete a task - does it show in the completed section
#create a high priority task -does it have the tag
#create a low priority task - does it have the tag







