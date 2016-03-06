require 'selenium-webdriver'
require_relative '../pages/template'
require_relative '../pages/login'
require_relative 'spec_helper'

describe 'Template' do

	before(:each) do
		@login = Login.new(@driver)
		@template = Template.new(@driver)
	end

	#create a new template
	it 'will create' do
		@login.with($username, $password)
		@template.create()
		expect(@template.is_there?).to eql true
	end

	#delete the template that was created
	it 'will delete' do
		@login.with($username, $password)
		@template.delete()
		expect(@template.is_there?).to eql false
	end

	#create and share a template
	it 'will create and share' do
		@login.with($username, $password)
		@template.create()
		@template.share()
		expect(@template.is_shared?).to eql true
	end

	# #template attachement
	# it 'will add an attachement' do
	# end


end
