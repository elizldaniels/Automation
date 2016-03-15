require 'selenium-webdriver'
require_relative '../pages/campaigns'
require_relative '../pages/login'
require_relative 'spec_helper'

describe 'Campaign' do 

	before(:each) do
		@campaigns = Campaigns.new(@driver)
	end

	#createa new campaign with an email as the first step and task as second (both on same day)
	it 'will create a new campaign with an email and a task on the same day' do 
		@campaigns.create()
	end

	#edit the template that has already been created
	it 'will edit the template that was already created to have a new custom task for day two' do 
		@campaigns.edit()
	end

	#delete campaign that was jsut created
	it 'will delete the campaign that was just created' do
		@campaigns.delete()
	end

end