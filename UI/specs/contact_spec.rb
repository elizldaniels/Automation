require 'selenium-webdriver'
require_relative '../pages/login'
require_relative '../pages/contacts'
require_relative 'spec_helper'


describe 'Contacts' do

	before(:each) do
		@login = Login.new(@driver)
		@contact = Contacts.new(@driver)
	end

	it 'will create contact' do
		@login.with('liz@toutapp.com', 'Monkeyw1!')
		@contact.create('Balinda', 'Granger', 'Balinda@sharklasers.com')
		expect(@contact.was_created?).to eql false
	end


	# it 'will add to group' do
	# end

	# it 'will delete contact' do
	# end

	it 'will create group' do
		@login.with('liz@toutapp.com', 'Monkeyw1!')
		@contact.create_group('group1', ' ')
	end

	# it 'will delete group' do
	# end


	
end

	#TODO
	#create a random email/name generator (gem that james and i talked about at home - forgery?)
	#add assertion for the group that was created
