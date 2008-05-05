class User < ActiveRecord::Base
  has_many :trades
  has_many :items
  has_many :live_searches
  
  #--{ Basic Authentication methods }--

    #--{ Example Usage: User.find(:first).password = "foobar" }--
    def password=(password)
      write_attribute(:password, User.hash_password(password))
    end
    
    #--{ Example Usage: User.generate_token }--
    def self.generate_token
      words = %w{ cat shovel cloud find pass risk taco glass dog bottle can bowl spoon cheese chili fork cup fish chips }
      new_pass = "%s%s" % [ words[ rand( words.length ) ], words[ rand( words.length ) ] ]
      return User.hash_password(new_pass)
    end
    
    #--{ Example Usage: User.hash_password(params[:user][:password]) }--
    def self.hash_password(password)
      return Digest::SHA256.hexdigest(password)
    end
    
    #--{ Example Usage: User.is_authentic(params[:user][:login], params[:user][:password]) }--
    def self.is_authentic(login, password)
      return User.find(:first, :conditions => ["login=? AND password=?", login, User.hash_password(password)]) || false
    end
  #--{ end }--
end
