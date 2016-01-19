require_relative 'base_page'

class Template < BasePage 

	Template_Btn = {css: '#email-templates-tab > a'}
	Create_New = {id: 'new-template'}
	Select_Template = {css: 'body > div.content-select.content-select-modal.modal.in > div.modal-body.text-center.cadence-new-modal-body > div.content-option.template-option'}
	Catagory_Field = {css: '#newTemplateForm > div:nth-child(1) > input'}
	Name_Field = {css: '#newTemplateForm > div:nth-child(2) > input[type="text"]'}
	Create_Button = {id: 'createTemplate'}
	Subject_Field = {name: 'subject'}
	Iframe_Id = {xpath: '/html/body'}
	Save_Updates = {id: 'update-template'}

	def initialize(driver)
		super
		# visit '/next#email_templates'
	end
	
	def create()
		click Template_Btn
		wait_for(10) {is_displayed? Create_New }
		click Create_New
		click Select_Template
		type 'Auto Catagory', Catagory_Field
		type 'Temporary Template', Name_Field
		click Create_Button
		wait_for(10) { is_displayed? Subject_Field }
		type 'This is an automated template', Subject_Field
		sleep(3)
		switch_frame(0)
		type_paragraph Iframe_Id, 8
		switch_back
		click Save_Updates
	end	
end

#TODO
#find a better way to sleep and wait for the oframe to load
#create share template w/ verivy shared method
#delete a template


