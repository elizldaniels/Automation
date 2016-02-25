require 'selenium-webdriver'
require_relative '../pages/task'
require_relative '../pages/login'
require_relative 'spec_helper'
require_relative '../pages/base_page'
require_relative '../util'

describe 'Task' do 

	before(:each) do
		@login = Login.new(@driver)
		@task = Task.new(@driver)
	end

	it 'will create' do
		@login.with('qateam+automation@toutapp.com', 'Monkeyw1!')
		@task.create()
		expect(@task.was_created?).to eql true
	end

	it 'will create a task for tomorrow' do
		@login.with('qateam+automation@toutapp.com', 'Monkeyw1!')
		@task.for_tomorrow()
	end

	it 'will create a task for yesterday' do
		@login.with('qateam+automation@toutapp.com', 'Monkeyw1!')
		@task.for_yesterday()
	end
	
end