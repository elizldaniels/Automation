require 'selenium-webdriver'
require_relative '../config'

class BasePage

	def initialize(driver)
		@driver = driver
		@driver.manage.window.resize_to(1230, 900)
		#1550, 900
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

	#to use click add whatever variable locatoryou need when calling the function
	#you can also call multiple variable locators at one time since this function locator is using '*' or splat/variable arguments.
	#calling one locator - click button
	#calling multiple locators at the same time in order - click button1, button2, button3, button4
	def click(*locators)
		locators.each {|locator| find(locator).click}
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
			#@driver.save_screenshot 'screenshot.jpg'
    		#@driver.save_screenshot "./#{Time.now.strftime("../../logs/Photos/failshot__%d_%m_%Y__%H_%M_%S")}.jpg"
		end	
	end

	def text_displayed?(locator, word)
		find(locator).text.include?(word)
	end

	def on_page?(words)
		@driver.page_source.include?(words)
	end

	def page_source()
  		@driver.getPageSource
	end

	def type_paragraph(locator, number)
		par = %w[the quick brown fox jumped over the lazy dog]
		text = (par.shuffle.join(' ') + ' ') * number
		find(locator).send_keys text
	end
	#type_paragraph the_locator, 'whatever amount of text you want'

	def switch_frame(locator)
		@driver.switch_to.frame(locator)
	end

	def switch_back_to_original_frame()
		@driver.switch_to.default_content
	end

	def select_all_type(number, locator)
		number.times {find(locator).send_keys :backspace}
		#find(locator).send_keys text
	end

	# def dropdown_select(locator, *option)
	# 	dropdown = find(locator)
	# 	select_list = Selenium::WebDriver::Support::Select.new(dropdown)
	# 	select_list.select_by(text: option)
	# end


	# def skip_btn(button1)
	# 	if button1.displayed?
	# 		click button1
	# 	end
	# end

end	