# Scenario: We need to simulate a sign up and sign in functionality through
#           command line

# Version 2
#-----------------
# In this version we are using module to keep core functionality and
# use them in class

# Used v2 in authenticable to map with the version of solution
require_relative 'authenticable_v2'

# User class
class User
  include Authenticable

  def initialize(user = {})
    @user = user
  end

  def sign_up
    if Authenticable.register(@user)
      puts "User '#{@user[:username]}' has been successfully signed up.'"
    else
      puts 'Something went wrong.'
    end
  end

  def self.sign_in(username, password)
    if Authenticable.authenticate(username, password)
      puts "Welcome, #{username}."
    else
      puts 'Invalid username or password.'
    end
  end
end

operation = ARGV.first

case operation
when 'signup'
  username = ARGV[1]
  email = ARGV[2]
  password = ARGV[3]

  user = User.new({ username: username, email: email, password: password })
  user.sign_up
when 'signin'
  username = ARGV[1]
  password = ARGV[2]

  User.sign_in(username, password)
else
  puts <<~USAGE
    Run as
      $ ruby user.rb signup <username> <email> <password>
      $ ruby user.rb signin <username> <password>
  USAGE
end
