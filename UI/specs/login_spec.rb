require 'selenium-webdriver'
require_relative '../pages/login'
require_relative 'spec_helper'

describe 'Login' do
  
  before(:each) do
    @login = Login.new(@driver)
  end

  it 'will succeeded' do
    @login.with('qateam+automation@toutapp.com', 'Monkeyw1!')
    expect(@login.login_was_success?).to eql true
  end

  it 'will fail' do
    @login.with('', 'Monkeyw1')
    expect(@login.login_was_success?).to eql false
  end

end
