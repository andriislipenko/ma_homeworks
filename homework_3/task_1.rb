class User
  attr_reader :first_name, :last_name, :email

  def initialize(first_name:, last_name:, email:)
    self.first_name = first_name
    self.last_name = last_name
    self.email = email
  end

  def full_name
    "#{@first_name} #{@last_name}"
  end

  def errors
    @first_name_errors + @last_name_errors + @email_errors
  end

  def valid?
    @first_name_errors.empty? && @last_name_errors.empty? && @email_errors.empty?
  end

  def is_valid_email?
    /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.match?(@email)
  end

  def first_name=(first_name)
    @first_name = first_name
    validate_first_name
  end

  def last_name=(last_name)
    @last_name = last_name
    validate_last_name
  end

  def email=(email)
    @email = email
    validate_email
  end

  private

  def validate_first_name
    @first_name_errors = []
    @first_name_errors << 'first_name can not be empty' if empty?(@first_name)
    @first_name_errors << 'first_name must be a string' unless string?(@first_name)
    @first_name_errors << 'first_name must be at least three characters' if length_valid?(@first_name)
  end

  def validate_last_name
    @last_name_errors = []
    @last_name_errors << 'last_name can not be empty' if empty?(@last_name)
    @last_name_errors << 'last_name must be a string' unless string?(@last_name)
    @last_name_errors << 'last_name must be at least three characters' if length_valid?(@last_name)
  end

  def validate_email
    @email_errors = []
    @email_errors << 'email can not be empty' if empty?(@email)
    @email_errors << 'email must be a string' unless string?(@email)
    @email_errors << 'email is not valid' unless is_valid_email?
  end

  def empty?(value)
    value.to_s.empty?
  end

  def string?(value)
    value.is_a?(String)
  end

  def length_valid?(value, length = 3)
    string?(value) && value.size < length
  end
end
