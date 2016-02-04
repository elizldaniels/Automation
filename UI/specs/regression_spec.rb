require 'selenium-webdriver'
require_relative '../pages/contacts'
require_relative '../pages/login'
require_relative '../pages/pitches'
require_relative '../pages/task'
require_relative '../pages/template'
require_relative 'spec_helper'

describe 'Regressoion' do

	before(:each) do
		@login = Login.new(@driver)
		@task = Task.new(@driver)
		@template = Template.new(@driver)
		@pitches  = Email.new(@driver)
		@contacts = Contacts.new(@driver)
	end

	it 'will run a full suite' do
		@login.with('liz@toutapp.com', 'Monkeyw1!')
		@task.create()
		expect(@task.was_created?).to eql true
		sleep(1)
		@pitches.to('qateam@toutapp.com')
		expect(@pitches.was_sent?).to eql false
		sleep(1)
		@contacts.create('Belinda', 'Granger', 'Belinda@sharklasers.com')
		expect(@contacts.was_created?).to eql false
		sleep(2)
		@contacts.delete('Belinda')
		#@contacts.create_group('Auto-Group', 'Small')
		sleep(1)
		@template.create()
		expect(@template.is_there?).to eql true
		@template.delete()
		@template.create()
		@template.share()
		@template.delete()
	end
end
