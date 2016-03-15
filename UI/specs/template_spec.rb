require 'selenium-webdriver'
require_relative '../pages/template'
require_relative '../pages/login'
require_relative 'spec_helper'

describe 'Template' do

	before(:each) do
		@template = Template.new(@driver)
	end

	#create a new template
	it 'will create a template' do
		@template.create()
		expect(@template.is_there? 'Automated TemplatesAuto C...').to eql true
	end

	#delete the template that was created
	it 'will delete a template' do
		@template.delete($Auto_Category, $Auto_Template)
		expect(@template.is_there? 'Automated TemplatesAuto C...').to eql false
	end

	#create and share a template
	it 'will create and share a template' do
		@template.create()
		@template.share()
		expect(@template.is_shared?).to eql true
		@template.delete($Auto_Category, $Auto_Template)
		expect(@template.is_there? 'Automated TemplatesAuto C...').to eql false
	end

	#edit a template subject line
	it 'will edit the general template' do
		@template.edit()
		expect(@template.edits_made? $Subject_Line, ', with updates').to eql true
	end

	#change template back to what it was before
	it 'will re-do the edits made' do
		@template.re_edit()
		expect(@template.edits_made? $Subject_Line, ', with updates').to eql false
	end


	clone a template
	it 'will clone a template' do 
		@template.clone()
		expect(@template.is_there? 'clone of:').to eql true
	end

	#delete cloned template
	it 'will delete the cloned template' do
		@template.delete($Hiring_Category, $Hiring_Template)
	end

end





#TODO
#adding attachments to templates
#adding images to templates
#adding links to templates
#clone a shared template
