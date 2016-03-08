require 'selenium-webdriver'

RSpec.configure do |config|

	config.before(:each) do
		case ENV['browser']	
		when 'firefox'	
			@driver = Selenium::WebDriver.for :firefox
		when 'chrome'
			Selenium::WebDriver::Chrome::Service.executable_path = File.join(Dir.pwd,'../vendor/chromedriver')
			@driver = Selenium::WebDriver.for :chrome
		end	
	end

	config.after(:each) do
	 	# @driver.quit
	  #   if example.exception
   #      	# Save screenshot to 'path/to/foo.png'
   #      	example.metadata[:screenshot] = './#{Time.now.strftime("../../logs/Photos/failshot__%d_%m_%Y__%H_%M_%S")}.jpg'
   #  	end
	end

end