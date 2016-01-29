require 'selenium-webdriver'
require_relative '../config'

class BasePage

	def initialize(driver)
		@driver = driver
		@driver.manage.window.resize_to(1550, 900)
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

	def type_enter(text, locator)
		find(locator).send_keys text, :return
	end

	def wait_and_type_enter(text, element)
		wait_for(10) { is_displayed? element }
		type_enter text, element
	end

	def click(locator)
		find(locator).click
	end

	def select(dropdown, option)
		click dropdown
		click option
	end

	def clear(locator)
		find(locator).clear
	end	

	def wait_for(seconds = 15)
		Selenium::WebDriver::Wait.new(timeout: seconds).until {yield}
	end

	def wait_until()
		Selenium::WebDriver::Wait.new().until {yield}
	end
	
	def is_displayed?(locator)
		begin
			find(locator).displayed?
		rescue Selenium::WebDriver::Error::NoSuchElementError
			false
		end	
	end

	# def move_on(locator, action)
	# 	SkipIt = find(locator)
	# 	if SkipIt.displayed? = false
	# 		#move on to the next step in the script
	# 	else action locator
	# end

	def type_paragraph(locator, number)
		par = %w[the quick brown fox jumped over the lazy dog]
		text = (par.shuffle.join(' ') + ' ') * number
		find(locator).send_keys text
	end

	def switch_frame(locator)
		@driver.switch_to.frame(locator)
	end

	def switch_back()
		@driver.switch_to.default_content
	end
					


end	