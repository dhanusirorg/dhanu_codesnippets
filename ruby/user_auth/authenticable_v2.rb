# Module Authenticable

module Authenticable
  DB_FOLDER = 'db'
  AUTH_SEP = ' '
  AUTH_FORMAT = {
    username: 0, email: 1, password: 2
  }

  def self.register(user = {})
    File.open(auth_file(user[:username]), 'w') do |file|
      file.write(auth_line((user)))
    end
    true
  end

  def self.authenticate(username, password)
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

  def self.auth_line(user)
    "#{user[:username]}#{AUTH_SEP}#{user[:email]}#{AUTH_SEP}#{user[:password]}"
  end

  def self.auth_file(username)
    "#{DB_FOLDER}/#{username}.auth"
  end
end

