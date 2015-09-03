require 'test_helper'

class AdminTest < ActiveSupport::TestCase
  
  def setup
  	@admin = Admin.new(name: "Kevin", password: "foobar", password_confirmation: "foobar")
  end

   test "should be valid" do
    	assert @admin.valid?
   end

   test "admin name should be present" do
   		@admin.name = "   "
   		assert_not @admin.valid?
   end

   test "admin name should be too long" do
   		@admin.name = "x"*30
   		assert_not @admin.valid?
   end

   test "admin names should be unique" do
   		@faker = @admin.dup
   		@admin.save
   		assert_not @faker.valid?
   end

   test "password should exist" do
   		@admin.password = " "*6
   		assert_not @admin.valid?
   end

   test "password should be at least 6 characters long" do
   		@admin.password = "12345"
   		assert_not @admin.valid?
   end

end



