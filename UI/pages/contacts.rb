require_relative 'base_page'

class Contacts < BasePage

	Relationships_Btn = {css: '#relationships-tab a'}
	New_Contact = {id: 'new-person'}
	First_Name = {id: 'new_person_first_name'}
	Last_Name = {id: 'new_person_last_name'}
	Email = {id: 'new_person_email'}
	Create_Contact_Btn = {id: 'createPersonSubmit'}
	Contact_Error_Msg = {css: '.modal-body .error'}
	#create a group page objects
	New_Group_Btn = {id: 'add-group'}
	Group_Name = {css: '.controls input'}
	Group_Desciption = {css: '.controls textarea'}
	Create_Group_Btn = {id: 'createGroupSubmit'}
	Group_Error_Msg = {css: '.controls .help-inline'}
	#delete contact page objects
	Search_Field = {css: '.span6 input'}
	Check_Box = {css: '.backgrid .select-all-header-cell input'}
	Dropdown_Btn = {css: '.btn-group button.dropdown-toggle'}
	Delete_Btn = {css: '.btn-group .delete-people'}
	Confirm_Btn = {id: 'btnPrimary'}



	def create(first, last, email)
		click Relationships_Btn
		wait_for(10) {is_displayed? New_Contact}
		click New_Contact
		type first, First_Name
		type last, Last_Name
		type email, Email
		click Create_Contact_Btn
	end

	def delete(name)
		click Relationships_Btn
		wait_for(10) {is_displayed? New_Contact}
		type_enter name, Search_Field
		sleep(2)
		check_the_item Check_Box
		dropdown_select Dropdown_Btn, Delete_Btn
		click Confirm_Btn		
	end

	def create_group(name, description)
		click Relationships_Btn
		wait_for(10) {is_displayed? New_Contact}
		click New_Group_Btn
		type name, Group_Name
		type description, Group_Desciption
		click Create_Group_Btn
	end

	# def add_to_group()
	# end


	def was_created?
		is_displayed? Contact_Error_Msg
	end
	#should test to be false 

	# def can_search?
	# end

	# def was_deleted?
	# end

end

	#TODO
	#find a unique verification for a group that is created
