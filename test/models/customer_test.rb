require 'test_helper'

class CustomerTest < ActiveSupport::TestCase
  
  def setup
  	@customer = Customer.new(name: "shree", email: "shree@shree.com", 
  								mobile: "1234567890", password: "foobar",
  								password_confirmation: "foobar")
  end

  test "should be valid customer" do
  	assert @customer.valid?
  end

  test "name should be present" do
  	@customer.name = " "
  	assert_not @customer.valid?
  end

  test "email should be present" do
  	@customer.email = " "
  	assert_not @customer.valid?
  end

  test "phone should be present" do
  	@customer.mobile = " "
  	assert_not @customer.valid?
  end

  test "name should not be less than 3" do
   @customer.name = "a"*51
   assert_not @customer.valid?
  end

  test "email should not be too long" do
  	@customer.email = "a" * 244 + "@example.com"
  	assert_not @customer.valid?
  end

  test "mobile should not be more than 10" do
  	@customer.mobile = "a"* 11
  	assert_not @customer.valid?
  end

  test "email validation should accept valid addresses" do
    valid_addresses = %w[customer@example.com CUSTOMER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @customer.email = valid_address
      assert @customer.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[customer@example,com customer_at_foo.org customer.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @customer.email = invalid_address
      assert_not @customer.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  test "email address should be unique" do
  	duplicate_customer = @customer.dup
  	duplicate_customer.email = @customer.email.upcase
    @customer.save
    assert_not duplicate_customer.valid?
  end

  test "password should be present (nonblank)" do
    @customer.password = @customer.password_confirmation = " " * 6
    assert_not @customer.valid?
  end

  test "password should have a minimum length" do
    @customer.password = @customer.password_confirmation = "a" * 5
    assert_not @customer.valid?
  end

end
