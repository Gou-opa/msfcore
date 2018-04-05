# -*- coding: binary -*-
module Msf
module Ui
end
end
###########################################################
puts "loi chao tu file UI.rb"
puts "file nay chi chua require toi cac thu muc xay dung UI"
###########################################################

################################################đoạn track file
puts "####################bat dau doan in ra####################"
puts "tu file" + __FILE__ + "\nrequire:\nfile dat tai "
puts 'rex/ui'
require 'rex/ui' #####requre cho thu muc rex/ui
puts "."
puts 'msf/ui/banner'
#require 'msf/ui/banner'  ##### bo cai nay di, ko can thiet
puts '.'
puts 'msf/ui/driver'
require 'msf/ui/driver'
puts '.'
puts 'msf/ui/common'
require 'msf/ui/common'
puts '.'
puts 'msf/ui/console'     ######cho nay import file msf/ui/console/driver.rb, gay ra loi banner
require 'msf/ui/console'
puts "####################ket thuc doan in ra####################"
###########################################################
