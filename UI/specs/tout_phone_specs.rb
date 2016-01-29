require 'selenium-webdriver'
require_relative '../pages/tout_phone'
require_relative 'spec_helper'

Describe 'TPhone' do 

	Before(:each) do
		@login = Login.new(@driver)
		@tphone = TPhone.new(@driver)
	end

	


	
end