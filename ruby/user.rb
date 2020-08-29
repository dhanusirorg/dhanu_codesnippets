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

  def self.auth_line
    "#{@user[:username]}#{AUTH_SEP}#{@user[:email]}#{AUTH_SEP}#{@user[:password]}"
  end

  def auth_file(username)
    "#{DB_FOLDER}/#{username}.auth"
  end
end

operation = ARGV.first

if operation == 'signup'
  username = ARGV[1]
  email = ARGV[2]
  password = ARGV[3]

  user = User.new({ username: username, email: email, password: password })
  user.sign_up
elsif operation == 'signin'
  username = ARGV[1]
  password = ARGV[2]

  user = User.new({ username: username, email: "", password: password })
  user.sign_in
end


# Run as
# $ ruby user.rb signup foo foo@example.com foo123
# $ ruby user.rb signin signin foo foo123

