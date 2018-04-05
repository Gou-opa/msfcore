# -*- coding: binary -*-
#
# This file includes everything needed to interact with the user interface
# wrappers of the rex library.
#
###########################################################
puts "loi chao tu file rex/ui.rb"
puts "no require cac file ui trong thu muc rex/ui, rex/text ko xem nua"
###########################################################
# General classes
require 'rex/ui/output'


# Text-based user interfaces
require 'rex/ui/text/input'
require 'rex/ui/text/shell'
require 'rex/ui/text/dispatcher_shell'
require 'rex/ui/text/irb_shell'
require 'rex/ui/text/bidirectional_pipe'

require 'rex/text/color'
require 'rex/text/table'

# Ui subscriber
require 'rex/ui/subscriber'
require 'rex/ui/interactive'
