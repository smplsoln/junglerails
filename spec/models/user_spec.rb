require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do
    it "password and password_confirmation should match" do
      user = User.new
      user.password = 'password1'
      user.password_confirmation = 'password2'
      user.email = 'email@dot.com'
      user.first_name = 'MyFirstName'
      user.last_name = 'MyLastName'
      user.save
      expect(user.id).to be_nil
    end

    it "password cannot be blank" do
      user = User.new
      user.password = nil
      user.password_confirmation = nil
      user.email = 'email@dot.com'
      user.first_name = 'MyFirstName'
      user.last_name = 'MyLastName'
      user.save
      expect(user.errors.messages[:password]).to include 'can\'t be blank'
    end

    it "password length should be minimum 3" do
      user = User.new
      user.password = "pa"
      user.password_confirmation = "pa"
      user.email = 'email@dot.com'
      user.first_name = 'MyFirstName'
      user.last_name = 'MyLastName'
      user.save
      expect(user.errors.messages[:password]).to include 'is too short (minimum is 3 characters)'
    end

    it "email cannot be blank" do
      user = User.new
      user.password = "pass1"
      user.password_confirmation = "pass1"
      user.email = nil
      user.first_name = 'MyFirstName'
      user.last_name = 'MyLastName'
      user.save
      expect(user.errors.messages[:email]).to include 'can\'t be blank'
    end

    it "first_name cannot be blank" do
      user = User.new
      user.password = "pass1"
      user.password_confirmation = "pass1"
      user.email = 'test@test.COM'
      user.first_name = nil
      user.last_name = 'MyLastName'
      user.save
      expect(user.errors.messages[:first_name]).to include 'can\'t be blank'
    end

    it "last_name cannot be blank" do
      user = User.new
      user.password = "pass1"
      user.password_confirmation = "pass1"
      user.email = 'test@test.COM'
      user.first_name = 'MyFirstName'
      user.last_name = nil
      user.save
      expect(user.errors.messages[:last_name]).to include 'can\'t be blank'
    end


    it "email should be unique and not case sensitive" do
      user1 = User.new
      user1.password = 'pass1'
      user1.password_confirmation = 'pass1'
      user1.email = 'test@test.COM'
      user1.first_name = 'MyFirstName'
      user1.last_name = 'MyLastName'
      user1.save

      user2 = User.new
      user2.password = 'pass1'
      user2.password_confirmation = 'pass1'
      user2.email = 'TEST@TEST.com'
      user2.first_name = 'MyFirstName'
      user2.last_name = 'MyLastName'
      user2.save
      expect(user2.errors.messages[:email]).to include 'has already been taken'
    end

  end

  describe '.authenticate_with_credentials' do
    # examples for this class method here
    before do
      @user1 = User.new
      @user1.password = 'pass1'
      @user1.password_confirmation = 'pass1'
      @user1.email = 'test@test.COM'
      @user1.first_name = 'MyFirstName'
      @user1.last_name = 'MyLastName'
      @user1.save
    end

    it 'should authenticate a user with valid email and password' do
      authed_user = User.authenticate_with_credentials(@user1.email, @user1.password)

      expect(authed_user).to be_present

    end

    it 'should allow space before or after email' do
      authed_user = User.authenticate_with_credentials(' test@test.COM ', @user1.password)

      expect(authed_user).to be_present
    end

    it 'should allow different case email' do
      authed_user = User.authenticate_with_credentials('TEST@test.COM', @user1.password)

      expect(authed_user).to be_present
    end

  end

end
