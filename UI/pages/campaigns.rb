require_relative 'base_page'
require_relative 'template'

class Campaigns < BasePage
	Sales_Category = { link_text: 'Sales' }
	Select_Template = { css: '.content-option.cadence-option' }
	Dropdown = { id: 's2id_category-select'}
	Dropdown_Search = { xpath: '//*[contains(@class, "select2-result-label") and normalize-space(text()) = "Sales"]' }
	Continue_Btn = { css: '.continue-btn' }
	Campaign_Subject_field = { id: 'textinput' }
	First_Step_Dropdown = { id: 's2id_template-select' }
	Campaign_Email_Template = { css: '#select2-drop .select2-results-dept-0.select2-result.select2-result-selectable.select2-highlighted' }
	Call_Task = { css: '.call' }
	Call_Day = { id: 'newStepDay' }
	Call_Subject = { id: 'newStepName' }
	Iframe = { xpath: '/html/body' }
	Add_Step_Btn = { css: '.btn.btn-success.pull-left.add-btn' }
	#Delete campaign page objects
	Campaign_To_Delete = { xpath: '//*[contains(@class, "template-name") and normalize-space(text()) = "Automated Test"]' }
	Delete_Btn = { id: 'remove-cadence' }
	Confirm_Delete = { id: 'btnPrimary' }
	#edit campaign page objects
	Add_New_Step_Btn = { css: '.btn-add-step' }
	#add new template when creating a campaign
	New_Step_With_New_Email = { xpath: '//*[contains(@class, "help-block create-new") and normalize-space(text()) = "+ Create a New Template"]' }


	def initialize(driver)
		super
	end

	def create()
		click $Template_Btn, Sales_Category
		wait_for(10) { is_displayed? $Create_New }
		click $Create_New, Select_Template
		click Dropdown
		click Dropdown_Search
		click Continue_Btn
		type 'Automated Test', Campaign_Subject_field
		click First_Step_Dropdown
		wait_for(10) { is_displayed? Campaign_Email_Template }
		click Campaign_Email_Template
		click Continue_Btn
		wait_for(10) { is_displayed? Call_Task }
		click Call_Task
		type_enter '1', Call_Day
		type 'Automated call, are you there', Call_Subject
		sleep(8)
		switch_frame(0)
		type_paragraph Iframe, 2
		switch_back_to_original_frame
		click Add_Step_Btn
	end

	def delete()
		click $Template_Btn, Sales_Category, Campaign_To_Delete
		wait_for(10) { is_displayed? Delete_Btn }
		click Delete_Btn, Confirm_Delete
	end

	def edit()
		click $Template_Btn, Sales_Category
		wait_for(10) { is_displayed? $Create_New }
		click Campaign_To_Delete
		wait_for(10) { is_displayed? Add_New_Step_Btn }
		click Add_New_Step_Btn
		click Call_Task
		type_enter '1', Call_Day
		type 'Why have you not picked up?', Call_Subject
		sleep(8)
		switch_frame(0)
		type_paragraph Iframe, 2
		switch_back_to_original_frame
		click Add_Step_Btn
	end

	def new_campaign_new_template()
		click $Template_Btn, Sales_Category
		wait_for(10) { is_displayed? $Create_New }
		click $Create_New, Select_Template
		click Dropdown
		click Dropdown_Search
		click Continue_Btn
		type 'Automated Test', Campaign_Subject_field
		click New_Step_With_New_Email
		type 'Campaign test template', $Name_Field
		click $Create_Button
		type 'An automated template for a campaign', $Subject_Field
		sleep(8)
		switch_frame(0)
		type_paragraph Iframe_Id, 8
		switch_back_to_original_frame
		click Save_Updates
	end

	
end

