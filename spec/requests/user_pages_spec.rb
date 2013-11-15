require 'spec_helper'

describe "UserPages" do
	subject { page }

	let!(:user) { FactoryGirl.create :user }
	before { sign_in user }

	describe  'Home page' do
		before { visit root_path }

		it { should have_link 'Sign Out', href: signout_path } 
		it { should have_content 'My Cart' }
	 	it { should have_content 'Shop' } 	

		describe 'signing out' do
			before { click_link 'Sign Out' }
			
			it 'should redirect to the root path' do
				current_path.should eq root_path
			end

			it { should have_button 'Sign In' }
		end # signing out
	end # Home page
end
