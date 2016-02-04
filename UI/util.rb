require_relative 'config'

def repeat
	ENV['test_repeat'].to_i.times do 
		yield			
	end
end

#export test_repeat=2