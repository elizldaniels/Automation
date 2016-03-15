require 'selenium-webdriver'
require_relative '../pages/login'

RSpec.configure do |config|

	config.before(:each) do
		case ENV['browser']	
		when 'firefox'	
			@driver = Selenium::WebDriver.for :firefox
		when 'chrome'
			Selenium::WebDriver::Chrome::Service.executable_path = File.join(Dir.pwd,'../vendor/chromedriver')
			@driver = Selenium::WebDriver.for :chrome
		end	
		@login = Login.new(@driver)
		@login.with($username, $password)
	end

	config.after(:each) do #|example|
	 	 @driver.quit
	     # if example.exception
	     # 	relative_screenshot_path = "../../../logs/Photos/#{example.description.gsub(' ', '_') + Time.now.strftime("__%d_%m_%Y__%H_%M_%S")}.jpg"
	     # 	# Path to screenshot is relative to this file and expanded
	     # 	absolute_screenshot_path = File.expand_path(relative_screenshot_path, __FILE__)
    		# @driver.save_screenshot absolute_screenshot_path
      #    	example.metadata[:screenshot] = absolute_screenshot_path
     	#end
	end

end