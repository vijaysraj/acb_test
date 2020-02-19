FactoryBot.define do 
	factory :invoice do 
		brand_manager { 'Test' }
		customer_name { 'test' }
		reference { 'test' }
		amount {1000}
		narration {'testing'}
	end
end