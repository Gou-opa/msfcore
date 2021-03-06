#
# Project
#
######################################
puts "loi chao tu file console.rb"
puts "trong nay co chua lenh Start"
#######################################

################################################đoạn track file
puts "####################bat dau doan in ra####################"
puts "tu file" + __FILE__ + "\nrequire:\nfile dat tai "
puts 'metasploit/framework/command'
require 'metasploit/framework/command'     ##da doc xong, goi toi gem activesupport de lm gi day can thiet
puts 'metasploit/framework/command/base'
require 'metasploit/framework/command/base'
puts "####################ket thuc doan in ra####################"
###########################################################

# Based on pattern used for lib/rails/commands in the railties gem.
class Metasploit::Framework::Command::Console < Metasploit::Framework::Command::Base

  # Provides an animated spinner in a seperate thread.
  #
  # See GitHub issue #4147, as this may be blocking some
  # Windows instances, which is why Windows platforms
  # should simply return immediately.

=begin  ###############comment toan bo de bo di spinner

  def spinner
#########################################################neu la windows thi ko spinner
    return if Rex::Compat.is_windows
    return if Rex::Compat.is_cygwin

    return if $msf_spinner_thread
    $msf_spinner_thread = Thread.new do
      base_line = "[*] Starting the Metasploit Framework console..."
      cycle = 0
      loop do
        %q{/-\|}.each_char do |c|
          status = "#{base_line}#{c}\r"
          cycle += 1
          off    = cycle % base_line.length
          case status[off, 1]
          when /[a-z]/
            status[off, 1] = status[off, 1].upcase
          when /[A-Z]/
            status[off, 1] = status[off, 1].downcase
          end
          $stderr.print status
          ::IO.select(nil, nil, nil, 0.10)
        end
      end
    end
  end

=end

################################################################
#chuong trinh bat dau goi tai day
################################################################
  def start #######################################goi ham spinner
####lenh case dung nhu switch case
puts "##################can tim hieu bien nay:parsed_options.options.subcommand ||||| va bien nay: parsed_options.options.console.quiet ################"
########### 
    case parsed_options.options.subcommand
    when :version
      $stderr.puts "Framework Version: #{Metasploit::Framework::VERSION}"
    else
      #spinner unless parsed_options.options.console.quiet
      driver.run ##################day la phan chinh
#lenh run nay nam trong file lib/msf/core/auxiliary/timed.rb
    end
  end

  private

  # The console UI driver.
  #
  # @return [Msf::Ui::Console::Driver]
  def driver
    unless @driver
      # require here so minimum loading is done before {start} is called.

################################################đoạn track file
puts "####################bat dau doan in ra####################"
puts "tu file" + __FILE__ + "\nrequire:\nfile dat tai "
puts	'msf/ui'
      require 'msf/ui'
puts "####################ket thuc doan in ra####################"
###########################################################

      @driver = Msf::Ui::Console::Driver.new(
          Msf::Ui::Console::Driver::DefaultPrompt,
          Msf::Ui::Console::Driver::DefaultPromptChar,
          driver_options
      )
    end

    @driver
  end

  def driver_options
    unless @driver_options
      options = parsed_options.options
##################################################3
	puts "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<day la class cua parsed_options"
	puts parsed_options.class
	a = parsed_options.options.source_location
#khong in ra gi
#theo rapid7 not rubydoc thi file nay dat trong lib/metasploit/framework/parsed_options/console.rb#dung nhu ten class = ten file
####################################################
      driver_options = {}
      driver_options['Config'] = options.framework.config
      driver_options['ConfirmExit'] = options.console.confirm_exit
      driver_options['DatabaseEnv'] = options.environment
      driver_options['DatabaseMigrationPaths'] = options.database.migrations_paths
      driver_options['DatabaseYAML'] = options.database.config
      driver_options['DeferModuleLoads'] = options.modules.defer_loads
      driver_options['DisableBanner'] = options.console.quiet
      driver_options['DisableDatabase'] = options.database.disable
      driver_options['HistFile'] = options.console.histfile
      driver_options['LocalOutput'] = options.console.local_output
      driver_options['ModulePath'] = options.modules.path
      driver_options['Plugins'] = options.console.plugins
      driver_options['RealReadline'] = options.console.real_readline
      driver_options['Resource'] = options.console.resources
      driver_options['XCommands'] = options.console.commands
#########################nap cac thong tin tu parsed option vao driver option de chay
      @driver_options = driver_options
    end

    @driver_options
  end
end
