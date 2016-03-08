require 'selenium-webdriver'
require_relative '../pages/login'
require_relative 'spec_helper'

describe 'Login' do
  
  before(:each) do
    @login = Login.new(@driver)
  end

  it 'will succeeded in login' do
    @login.with($username, $password)
    expect(@login.login_was_success?).to eql true
  end

  it 'will fail in login' do
    @login.with('', $password)
    expect(@login.login_was_success?).to eql true
  end

  #before all, after all

end
