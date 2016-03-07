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
	#page objects for deleting
	Category = {css: '#category-list a.category.Automated.TemplatesAuto.Catagory'}  
	New_Template = {css: '.contact .template-name'}
	Remove_Template = {id: 'remove-template'}
	Remove_Confirm = {id: 'btnPrimary'}
	#objects for shared templates
	Share_Template = {id: 'share-template'}
	Share_With = {css: '.select2-container input'}
	Everyone_Group = {id: 'select2-result-label-4'}
	Save_Shared = {css: '.modal-footer button'}
	Shared_Tag = {css: '.contact .tag'}
	Frame_id = {css: '.cke_contents .cke_wysiwyg_frame'}
	#objects to upload a file



	def initialize(driver)
		super
	end
	
	#works with campaigns enabled accounts
	def create()
		click Template_Btn
		wait_for(10) { is_displayed? Create_New }
		click Create_New, Select_Template
		type 'Auto Catagory', Catagory_Field
		type 'Temporary Template', Name_Field
		click Create_Button
		wait_for(10) { is_displayed? Subject_Field }
		type 'This is an automated template', Subject_Field
		sleep(8)
		switch_frame(0)
		type_paragraph Iframe_Id, 8
		switch_back_to_original_frame
		click Save_Updates
	end	

	def delete()
		click Template_Btn, Category
		wait_for(10) { is_displayed? New_Template }
		click New_Template
		wait_for(10) { is_displayed? Remove_Template }
		click Remove_Template, Remove_Confirm
		sleep(2)
	end

	def share()
		wait_for(10) { is_displayed? Share_Template }
		click Share_Template, Save_Shared
		wait_for(10) { is_displayed? Share_With}
		click Share_With, Everyone_Group, Save_Shared
		sleep(2)
	end


	def is_there?
		is_displayed? New_Template
	end

	def is_shared?
		is_displayed? Shared_Tag
	end

end

#TODO
#find a better way to sleep and wait for the iframe to load and page to load after deleting
#find specific template that was created instead of looking for the css/xpath - so specific templates can be deleted instead of randomly


