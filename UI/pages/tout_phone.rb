require_relative 'base_page'

class TPhone < BasePage
	Tphone_Button = {css: '.click-to-call .btn'}
	Call_Text = {css: '.popover-header span'}
	Close_Phone = {css: '.popover-close img'}




end 


#TODO
#open toutphone after landing on the base base page 
#make sure lesser plans cannot user tout phone
#if i have toutphone open and click to another page then it should stay open


#if your phone number field is empty or less than 10 numbers
#and recipient phone number field is not selected or empty and less than 10 numbers
#then the call button should not be active

