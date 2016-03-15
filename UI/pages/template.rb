require_relative 'base_page'

class Template < BasePage 
	#objects for creating a template
	$Template_Btn = { link_text: 'Templates' }
	$Create_New = { id: 'new-template' }
	Select_Template = { css: 'body > div.content-select.content-select-modal.modal.in > div.modal-body.text-center.cadence-new-modal-body > div.content-option.template-option' }
	$Catagory_Field = { css: '#newTemplateForm > div:nth-child(1) > input' }
	$Name_Field = { css: '#newTemplateForm > div:nth-child(2) > input[type="text"]' }
	$Create_Button = { id: 'createTemplate' }
	$Subject_Field = { name: 'subject' }
	Iframe_Id = { xpath: '/html/body' }
	Save_Updates = { id: 'update-template' }
	#page objects for deleting
	$Auto_Category = { link_text: 'Automated TemplatesAuto C...' }  
	$Auto_Template = { xpath: '//*[contains(@class, "template-name") and normalize-space(text()) = "Temporary Template"]' }
	Remove_Template = { id: 'remove-template' }
	Remove_Confirm = { id: 'btnPrimary' }
	#objects for shared templates
	Share_Template = { id: 'share-template' }
	Share_With = { css: '.select2-container input' }
	Everyone_Group = { id: 'select2-result-label-4' }
	Save_Shared = { css: '.modal-footer button' }
	Shared_Tag = { css: '.contact .tag' }
	Frame_id = { css: '.cke_contents .cke_wysiwyg_frame' }
	#objects to edit  template
	General_Category = { link_text: 'General' }
	Contact_Template = { css: '#template-list .contact.template.cadence-view' }
	Edit_Button = { id: 'edit-template' }
	$Subject_Line = { css: '#template-content .feed-content h3' }
	#objects to clone a template
	$Hiring_Category = { link_text: 'Hiring' }
	$Hiring_Template = { xpath: '//*[contains(@class, "template-name") and normalize-space(text()) = "First clone of: Response to Applicant"]'}
	Clone_Template = { id: 'clone-template' }
	Cloned_Template_Name = { name: 'name'}
	Template_Title = { css: '#content .content-inner h2'}
	$Search_Group = { xpath: '//*[contains(@class, "template-name")]' }

	#objects to clone a shared template



	def initialize(driver)
		super
	end
	
	#works with campaigns enabled accounts
	def create()
		click $Template_Btn
		wait_for(10) { is_displayed? $Create_New }
		click $Create_New, Select_Template
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

	def delete(category, template)
		click $Template_Btn, category
		wait_for(10) { is_displayed? template }
		click template
		wait_for(10) { is_displayed? Remove_Template }
		click Remove_Template, Remove_Confirm
		sleep(2)
	end

	def share()
		wait_for(10) { is_displayed? Share_Template }
		click Share_Template, Save_Shared
		wait_for(10) { is_displayed? Share_With }
		click Share_With, Everyone_Group, Save_Shared
		sleep(2)
	end

	#editing that i can edit the subject line and body text of the template
	def edit()
		click $Template_Btn, General_Category, Contact_Template
		wait_for(10) { is_displayed? Edit_Button }
		click Edit_Button
		type ', with updates', Subject_Field
		click Save_Updates
		sleep(5)
	end

	#editing the same template to remove the content that was added
	def re_edit()
		click $Template_Btn, General_Category, Contact_Template
		wait_for(10) { is_displayed? Edit_Button }
		click Edit_Button
		select_all_type 14, Subject_Field
		click Save_Updates
		sleep(5)
	end

	#clone the tempalte but make no other chages then the title of the template
	def clone()
		click $Template_Btn, $Hiring_Category, Contact_Template
		wait_for(10) { is_displayed? Clone_Template }
		click Clone_Template
		type 'First clone of: ', Cloned_Template_Name
		click Create_Button
		wait_for(10) { is_displayed? Save_Updates }
		click Save_Updates
	end

	def is_there?(words)
		on_page? words
	end

	def is_shared?
		is_displayed? Shared_Tag
	end

	def edits_made?(locator, words)
		text_displayed? locator, words
	end



end

#TODO
#find a better way to sleep and wait for the iframe to load and page to load after deleting
#find specific template that was created instead of looking for the css/xpath - so specific templates can be deleted instead of randomly


