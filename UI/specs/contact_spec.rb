require 'selenium-webdriver'
require_relative '../pages/login'
require_relative '../pages/contacts'
require_relative 'spec_helper'


describe 'Contacts' do

	before(:each) do
		@contact = Contacts.new(@driver)
	end

	it 'will create a contact' do
		@contact.create('Balinda', 'Granger', 'Balinda@sharklasers.com')
		expect(@contact.was_created?).to eql false
	end

	it 'will delete a contact' do
		@contact.delete('Balinda')
	end

	it 'will add a contact to group' do
		@contact.added_to_group()
		expect(@contact.was_added?).to eql true
	end

	it 'will remove a contact from group' do
		@contact.remove_frm_group()
		expect(@contact.was_added?).to eql false
	end

	it 'will regular unsubscribe the contact' do
		@contact.unsubscribe()
		expect(@contact.was_unsubscribed?).to eql true
	end

	it 'will remove the unsubscribe from the contact' do
		@contact.remove_unsubscribe()
		expect(@contact.was_unsubscribed?).to eql false
	end

	# it 'will create group' do
	# 	@contact.create_group('group1', ' ')
	# end

	# it 'will delete group' do
	# end


	
end

	#TODO
	#create a random email/name generator (gem that james and i talked about at home - forgery?)
	#add assertion for the group that was created - need to find a way to verify that specific group
	#add assertion that will verify if the specific contact was deleted
