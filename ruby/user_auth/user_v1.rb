# Scenario: We need to simulate a sign up and sign in functionality through
#           command line

# Version 1
#-----------------
# In this version we are using class and putting every functionality inside it

# User class
class User
  DB_FOLDER = 'db'
  AUTH_SEP = ' '
  AUTH_FORMAT = {
    name: 0, email: 1, password: 2
  }

  def initialize(name:, email: '', password:)
    @user = {name: name, password: password, email: email}
  end

  attr_reader :user

  def sign_up
    File.open(auth_file(user[:name]), 'w') do |file|
      file.write(auth_line)
      "User '#{user[:name]}' has been successfully signed up.'"
    end
  end

  def sign_in
    if authenticate(user[:name], user[:password])
      "Welcome, #{user[:name]}."
    else
      'Invalid name or password.'
    end
  end

  private

  def authenticate(name, password)
    return false unless File.exist? auth_file(name)

    auth = File.read(auth_file(name))
    tokens = auth.split(AUTH_SEP)
    password == tokens[AUTH_FORMAT[:password]]
  end

  def auth_line
    "#{user[:name]}#{AUTH_SEP}#{user[:email]}#{AUTH_SEP}#{user[:password]}"
  end

  def auth_file(name)
    "#{DB_FOLDER}/#{name}.auth"
  end
end

operation = ARGV.first

case operation
when 'signup'
  name = ARGV[1]
  email = ARGV[2]
  password = ARGV[3]

  user = User.new(name: name, email: email, password: password)
  puts user.sign_up
when 'signin'
  name = ARGV[1]
  password = ARGV[2]

  user = User.new(name: name, password: password)
  puts user.sign_in
else
  puts <<~USAGE
    Run as
      $ ruby user.rb signup <name> <email> <password>
      $ ruby user.rb signin <name> <password>
  USAGE
end

# Potential Observations
# During sign in we need to create User object with empty email.
