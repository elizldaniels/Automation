require 'selenium-webdriver'
require_relative '../pages/template'
require_relative '../pages/login'
require_relative 'spec_helper'

describe 'Template' do

	before(:each) do
		@login = Login.new(@driver)
		@template = Template.new(@driver)
	end

	it 'will create' do
		@login.with('liz@toutapp.com', 'Monkeyw1!')
		@template.create()
	end
end
