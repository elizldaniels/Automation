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
		@login.with('liz@toutapp.com', 'Monkeyw1!')
		@template.create()
		expect(@template.is_there?).to eql true
	end

	#delete the template that was created
	it 'will delete' do
		@login.with('liz@toutapp.com', 'Monkeyw1!')
		@template.delete()
		expect(@template.is_there?).to eql false
	end

	it 'will create and share' do
		@login.with('liz@toutapp.com', 'Monkeyw1!')
		@template.create()
		@template.share()
		expect(@template.is_shared?).to eql true
	end

end
