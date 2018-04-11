require 'pathname'
require 'rubygems'

######################################
puts "loi chao tu file duoc require thu nhat"
puts "install cac gems len va bao loi neu ko co"
######################################

GEMFILE_EXTENSIONS = [
    '.local',
    ''
]

msfenv_real_pathname = Pathname.new(__FILE__).realpath
root = msfenv_real_pathname.parent.parent

unless ENV['BUNDLE_GEMFILE']
  require 'pathname'

  GEMFILE_EXTENSIONS.each do |extension|
    extension_pathname = root.join("Gemfile#{extension}")

    if extension_pathname.readable?
      ENV['BUNDLE_GEMFILE'] = extension_pathname.to_path
      break
    end
  end
end

begin
  require 'bundler/setup'   ########## nam o /opt/metasploit/ruby.....bundler/setup.rb###########
rescue LoadError
  $stderr.puts "[*] Metasploit requires the Bundler gem to be installed"
  $stderr.puts "    $ gem install bundler"
  exit(1)
end
###########################moi thu se duoc su dung trong thu muc lib
lib_path = root.join('lib').to_path

unless $LOAD_PATH.include? lib_path
  $LOAD_PATH.unshift lib_path
end
