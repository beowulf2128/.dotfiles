#!/usr/bin/env ruby

# Echos and then runs a bash command
# Usage:
#   $ ./echo_and_run bundle exec rails s -p 3000
#
# Usage in bashrc
#   srails() { ~/.dotfiles/./e_and_r.rb bundle exec rails s -b 10.0.2.15 ; }; export srails
#
cmd = ARGV.join(' ')
puts "\e[36m>>>\e[0m #{cmd}"
system cmd
