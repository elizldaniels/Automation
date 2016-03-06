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
		@login.with($username, $password)
		@contact.create('Balinda', 'Granger', 'Balinda@sharklasers.com')
		expect(@contact.was_created?).to eql false
	end

	it 'will delete contact' do
		@login.with($username, $password)
		@contact.delete('Balinda')
	end

	it 'will add to group' do
		@login.with($username, $password)
		@contact.added_to_group()
		expect(@contact.was_added?).to eql true
	end

	it 'will remove from group' do
		@login.with($username, $password)
		@contact.remove_frm_group()
		expect(@contact.was_added?).to eql false
	end

	it 'will unsubscribe the contact' do
		@login.with($username, $password)
		@contact.unsubscribe()
		expect(@contact.was_unsubscribed?).to eql true
	end

	it 'will remove the unsubscribe from the contact' do
		@login.with($username, $password)
		@contact.remove_unsubscribe()
		expect(@contact.was_unsubscribed?).to eql false
	end

	# it 'will delete contact' do
	# end

	# it 'will create group' do
	# 	@login.with('liz@toutapp.com', 'Monkeyw1!')
	# 	@contact.create_group('group1', ' ')
	# end

	# it 'will delete group' do
	# end


	
end

	#TODO
	#create a random email/name generator (gem that james and i talked about at home - forgery?)
	#add assertion for the group that was created - need to find a way to verify that specific group
	#add assertion that will verify if the specific contact was deleted
