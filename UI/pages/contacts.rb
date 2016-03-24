require_relative 'base_page'

class Contacts < BasePage

	Relationships_Btn = {css: '#relationships-tab a'}
	New_Contact = {id: 'new-person'}
	First_Name = {id: 'new_person_first_name'}
	Last_Name = {id: 'new_person_last_name'}
	Email = {id: 'new_person_email'}
	Create_Contact_Btn = {id: 'createPersonSubmit'}
	Contact_Error_Msg = {css: '.modal-body .error'}
	Close_Btn = {css: '.pull-left button'}
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
	#adding contact to a group page objects
	Select_Contact = {css: '#relationship-grid tr td.string-cell'}
	To_Group = {css: 'button.btn.add-to-group'}
	Group = {css: 'div.span6.no-wrap-text'}
	Group_Tag = {css: 'button.btn.btn-mini.btn-inverse'}
	Remove_Mber = {id: 'manageRemove'}
	#unsubscribe
	Single_Box = {css: 'td.select-row-cell input'}
	Unsubscribe_Btn = {id: 'midbar-inbox-unsubscribe'}
	Save_Unsubscribe = {css: 'button.btn.btn-primary.save-unsubscribe'}
	Unsubscribe_Tag = {css: 'span.label.label-warning'}
	Remove_Unsub_Btn = {css: 'button.remove-unsubscribe.btn.btn-danger'}



	def create(first, last, email)
		click Relationships_Btn
		wait_for(20) {is_displayed? New_Contact}
		click New_Contact
		type first, First_Name
		type last, Last_Name
		type email, Email
		click Create_Contact_Btn
		sleep(3)
		# if close button is visible 
		click Close_Btn
		#, if not move on
	end

	def delete(name)
		click Relationships_Btn
		wait_for(20) {is_displayed? New_Contact}
		type_enter name, Search_Field
		sleep(2)
		click Check_Box, Dropdown_Btn, Delete_Btn, Confirm_Btn	
	end

	def create_group(name, description)
		click Relationships_Btn
		wait_for(20) {is_displayed? New_Contact}
		click New_Group_Btn
		type name, Group_Name
		type description, Group_Desciption
		click Create_Group_Btn
	end

	def added_to_group()
		click Relationships_Btn
		wait_for(20) {is_displayed? Select_Contact}
		click Select_Contact
		wait_for(20) {is_displayed? To_Group}
		click To_Group, Group
		wait_for(20) {is_displayed? Group_Tag}
	end

	def remove_frm_group()
		click Relationships_Btn
		wait_for(20) {is_displayed? Select_Contact}
		click Select_Contact
		wait_for(20) {is_displayed? Group_Tag}
		click Group_Tag, Remove_Mber
		sleep(2)
	end

	def unsubscribe()
		click Relationships_Btn
		wait_for(20) {is_displayed? Single_Box}
		click Single_Box, Dropdown_Btn, Unsubscribe_Btn, Save_Unsubscribe
		sleep(5)
	end

	def remove_unsubscribe()
		click Relationships_Btn
		wait_for(20) {is_displayed? Single_Box}
		click Single_Box, Dropdown_Btn, Unsubscribe_Btn, Remove_Unsub_Btn
		sleep(5)
	end

	def paginate()
	 	click Relationships_Btn
	# 	on the everyone tab, confirm how many pages of contacts there are
	# 	click to the next page, confirm that the number changes and the contacts show up
	# 	click to the next page confirm that the number changes and the contacts show up
	# 	click back and make sure the page number changes and the contacts show up
	end


	def was_created?
		is_displayed? Contact_Error_Msg
	end

	def was_added?
		is_displayed? Group_Tag
	end	

	def was_unsubscribed?
		click Select_Contact
		sleep(2)
		is_displayed? Unsubscribe_Tag
	end

	# def can_search?
	# end

end

	#TODO
	#find a unique verification for a group that is created, right now you are just confirming there was no errro message (that all fields were filled out)
	#pagination


