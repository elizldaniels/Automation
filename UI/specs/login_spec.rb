require 'selenium-webdriver'
require_relative '../pages/login'
require_relative 'spec_helper'

describe 'Login' do
  
  before(:each) do
    @login = Login.new(@driver)
  end

  it 'will succeeded' do
    @login.with('liz@toutapp.com', 'Monkeyw1!')
    expect(@login.login_was_success?).to eql true
  end

  it 'will fail' do
    @login.with('', 'Monkeyw1')
    #expect(@login.error_message_present?).to eql true
    expect(@login.login_was_success?).to eql false
  end

end
