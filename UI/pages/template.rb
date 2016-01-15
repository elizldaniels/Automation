require_relative 'base_page'

class Template < BasePage 
	Create_New = {id: 'new-template'}
	Catagory_Field = {name: 'catagory'}
	Name_Field = {name: 'name'}
	Create_Button = {id: 'createTemplate'}
	Subject_Field = {name: 'subject'}
	Save_Updates = {id: 'update-template'}

	def initialize(driver)
		super
		visit '/next#email_templates'
	end
	
	def create()
		click Create_New
		type 'category name' Catagory_Field
		type 'tempalte name' Name_Field
		wait_for(10) { is_displayed? Subject_Field }
		type 'tempalte subject' Subject_Field
		#type 'body text' selector_name
		click Save_Updates
	end	
