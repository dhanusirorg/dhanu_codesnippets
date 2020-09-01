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
    username: 0, email: 1, password: 2
  }

  def initialize(user = {})
    @user = user
  end

  def sign_up
    File.open(auth_file(@user[:username]), 'w') do |file|
      file.write(auth_line)
      puts "User '#{@user[:username]}' has been successfully signed up.'"
    end
  end

  def sign_in
    if authenticate(@user[:username], @user[:password])
      puts "Welcome, #{@user[:username]}."
    else
      puts 'Invalid username or password.'
    end
  end

  private

  def authenticate(username, password)
    # unless File.exist? auth_file(username)
    #   return false
    # end

    return false unless File.exist? auth_file(username)

    auth = File.read(auth_file(username))
    tokens = auth.split(AUTH_SEP)
    # if password == tokens[AUTH_FORMAT[:password]]
    #   return true
    # else
    #   return false
    # end
    password == tokens[AUTH_FORMAT[:password]]
  end

  def auth_line
    "#{@user[:username]}#{AUTH_SEP}#{@user[:email]}#{AUTH_SEP}#{@user[:password]}"
  end

  def auth_file(username)
    "#{DB_FOLDER}/#{username}.auth"
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

  user = User.new({ username: username, email: '', password: password })
  user.sign_in
else
  puts <<~USAGE
    Run as
      $ ruby user.rb signup <username> <email> <password>
      $ ruby user.rb signin <username> <password>
  USAGE
end

# Potential Observations
# During sign in we need to create User object with empty email.
