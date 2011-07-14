#!/usr/bin/ruby

begin
  require 'irb/ext/save-history'

  IRB.conf[:AUTO_INDENT]  = true
  IRB.conf[:USE_READLINE] = true
  IRB.conf[:SAVE_HISTORY] = 1000
  IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb_history"
  IRB.conf[:PROMPT_MODE]  = :SIMPLE

  # Load rubygems and wirble
  # begin
  #   require 'rubygems'
  #   require 'wirble'
  #   Wirble.init
  #   Wirble.colorize
  # rescue LoadError
  # end
  
  ARGV.concat [ "--readline", "--prompt-mode", "simple" ]

  alias :q :exit

  # Load Rails specific settings
  load File.expand_path('../.railsrc', __FILE__) if defined?(Rails)

rescue Exception => e
  puts "[!] ERROR loading ~/.irbrc: #{e.class} (#{e.message})"
end
