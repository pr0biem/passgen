require 'securerandom'
module Rand
	public
	def Rand.true_rand(x)
		num = SecureRandom.random_number(x)
		until num != 0 
			num = SecureRandom.random_number(x)
		end
		return num
	end
end