require 'selenium-webdriver'
require_relative '../pages/pitches'
require_relative '../pages/login'
require_relative 'spec_helper'

describe 'Email' do

	before(:each) do
    	@login = Login.new(@driver)
    	@pitches = Email.new(@driver)
  	end

  	it 'will send' do
  		@login.with('liz@toutapp.com', 'Monkeyw1!')
  		@pitches.to('toutqa@gmail.com')
  		expect(@pitches.was_sent?).to eql false
  	end	
  	
end
