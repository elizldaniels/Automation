require 'selenium-webdriver'
require_relative '../pages/task'
require_relative '../pages/login'
require_relative 'spec_helper'
require_relative '../pages/base_page'

describe 'Task' do 

	before(:each) do
		@login = Login.new(@driver)
		@task = Task.new(@driver)
	end

	it 'will create' do
		@login.with('liz@toutapp.com', 'Monkeyw1!')
		@task.create()			
		expect(@task.was_created?).to eql true
	end
	
end