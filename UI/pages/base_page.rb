require 'selenium-webdriver'
require_relative '../config'

class BasePage

	def initialize(driver)
		@driver = driver
		@driver.manage.window.resize_to(1250, 800)
	end
	
	def visit(url_path)
		@driver.get ENV['base_url'] + url_path
	end

	def find(locator)
		@driver.find_element locator
	end

	def type(text, locator)
		find(locator).send_keys text
	end

	def click(locator)
		find(locator).click
	end

	def clear(locator)
		find(locator).clear
	end	

	def wait_for(seconds = 15)
		Selenium::WebDriver::Wait.new(timeout: seconds).until {yield}
	end
	# to use the above: 
	# def finish_text_present?
	# 	wait_for(10) { is_displayed? FINISH_TEXT }
	# end

	def is_displayed?(locator)
		begin
			find(locator).displayed?
		rescue Selenium::WebDriver::Error::NoSuchElementError
			false
		end	
	end

end	