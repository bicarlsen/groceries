require 'spec_helper'

describe "HomePages" do
	subject { page }

	describe 'Home page' do
		let(:user) { FactoryGirl.build :user }

		before { visit root_path }

		it { should have_title 'Groceries To Go' }
		it { should have_content 'Groceries To Go' }
		it { should have_button 'Sign In' }
		it { should have_button 'Sign Up' }

		describe 'signing up' do
			context 'with correct information' do
				before do
					fill_in 'Name', with: user.name
					fill_in 'user_email', with: user.email
					fill_in 'user_password', with: user.password
					fill_in 'Password Confirmation', with: user.password

					click_button 'Sign Up'
				end 

				it { should have_content 'Welcome to Groceries To Go' }
				it 'should be the user\'s home page' do
					current_path.should eq root_path
				end
			end # with correct information
				
			context 'with incorrect information' do
				before { click_button 'Sign Up' }

				it 'should be the signin path' do
				 	current_path.should eq signup_path 
				end

				it { should have_selector '.form-error' }
			end # with incorrect information
		end # signing up

		describe 'signing in' do
			context 'with proper credentials' do
				let!(:saved_user) { FactoryGirl.create :user }
				before do
					fill_in 'email', with: saved_user.email
					fill_in 'password', with: saved_user.password

					click_button 'Sign In'
				end

				it 'should be the root path' do
					current_path.should eq root_path
				end

				it { should have_content saved_user.name }
			end # with proper credentials

			context 'with improper credentials' do
				before { click_button 'Sign In' }
				
				it 'should be the singin path' do
					current_path.should eq signin_path
				end

				it { should have_selector '.form-error' }
			end # with imporper credentials
		end # singing in
	end # Home page 

	describe 'Sign up page' do
		before { visit signup_path }
		let(:user) { FactoryGirl.build :user }

		it { should have_button 'Sign Up' }
			
		context 'with improper information' do
			before { click_button 'Sign Up' }

			it { should have_selector '.form-error' }
		end # with improper information

		context 'with proper information' do
			before do
				fill_in 'Name', with: user.name
			 	fill_in 'user_email', with: user.email
				fill_in 'user_password', with: user.password
				fill_in 'Password Confirmation', with: user.password  	

				click_button 'Sign Up'
			end 
				
			it { current_path.should eq root_path }
			it { should have_content 'Welcome to Groceries To Go' }
		end # with proper information
	end # Sign up page
end # HomePages
