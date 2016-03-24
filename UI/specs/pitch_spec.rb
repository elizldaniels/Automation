require 'selenium-webdriver'
require_relative '../pages/pitches'
require_relative '../pages/login'
require_relative 'spec_helper'

describe 'Email' do

	before(:each) do
    	@pitches = Email.new(@driver)
  	end

  	it 'will send a pitch' do
  		@pitches.to('toutqa@gmail.com')
  		expect(@pitches.was_sent?).to eql false
  	end	
  	
end
