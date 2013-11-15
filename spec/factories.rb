FactoryGirl.define do
	factory :user do
		sequence(:name) 	{ |n| "#{Faker::Name.name}_#{n}" }
		sequence(:email) 	{ |n| "test_#{n}@test.com" }
		password 							'password'
		password_confirmation 'password'

		factory :grocer do
			grocer true
		end # grocer

		factory :admin do
			admin true
		end # admin
	end # user
end
