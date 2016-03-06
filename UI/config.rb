#url that is going to be used when the test runs
ENV['base_url'] ||= 'https://toutapp.com'

#chrome or firefox
ENV['browser'] ||= 'chrome'

#repeat the tests
ENV['test_repeat'] ||= '1'

#user name used to login
$username = 'qateam+automation@toutapp.com'

#password associated with qateam+automation@toutapp.com to login
$password = 'Monkeyw1!'


#date variables and context
$date = Date.today
$tomorrow = $date + 1
$yesterday = $date - 1
$nextMonth = $date >> 1
#tomorrow.strftime("%m/%d/%y")


