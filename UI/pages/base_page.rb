require 'selenium-webdriver'
require_relative '../config'
require 'date'

	$date = Date.today
	$tomorrow = $date + 1
	$yesterday = $date - 1
	$nextMonth = $date >> 1
	#tomorrow.strftime("%m/%d/%y")


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

	def check_the_item(locator)
		click locator			
	end

	def dropdown_select(locator1, locator2)
		click locator1
		click locator2
	end

	def select_all_type(number, locator, text)
		number.times {find(locator).send_keys :backspace}
		find(locator).send_keys text
	end


	# def skip_btn(button1)
	# 	if button1.displayed?
	# 		click button1
	# 	end
	# end




end	