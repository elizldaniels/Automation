require 'selenium-webdriver'
require_relative '../pages/task'
require_relative '../pages/login'
require_relative 'spec_helper'
require_relative '../pages/base_page'
require_relative '../util'

describe 'Task' do 

	before(:each) do
		@task = Task.new(@driver)
	end

	it 'will create a task for today' do
		@task.create()
		#expect(@task.was_created?).to eql true
	end

	it 'will create a task for tomorrow' do
		@task.for_tomorrow()
	end

	it 'will create a task for yesterday' do
		@task.for_yesterday()
	end
	
end