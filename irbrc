#!/usr/bin/ruby

IRB.conf[:AUTO_INDENT]  = true
IRB.conf[:USE_READLINE] = true
IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb_history"
IRB.conf[:PROMPT_MODE]  = :SIMPLE

begin # ANSI codes
  ANSI_BLACK    = "\033[0;30m"
  ANSI_GRAY     = "\033[1;30m"
  ANSI_LGRAY    = "\033[0;37m"
  ANSI_WHITE    =  "\033[1;37m"
  ANSI_RED      ="\033[0;31m"
  ANSI_LRED     = "\033[1;31m"
  ANSI_GREEN    = "\033[0;32m"
  ANSI_LGREEN   = "\033[1;32m"
  ANSI_BROWN    = "\033[0;33m"
  ANSI_YELLOW   = "\033[1;33m"
  ANSI_BLUE     = "\033[0;34m"
  ANSI_LBLUE    = "\033[1;34m"
  ANSI_PURPLE   = "\033[0;35m"
  ANSI_LPURPLE  = "\033[1;35m"
  ANSI_CYAN     = "\033[0;36m"
  ANSI_LCYAN    = "\033[1;36m"

  ANSI_BACKBLACK  = "\033[40m"
  ANSI_BACKRED    = "\033[41m"
  ANSI_BACKGREEN  = "\033[42m"
  ANSI_BACKYELLOW = "\033[43m"
  ANSI_BACKBLUE   = "\033[44m"
  ANSI_BACKPURPLE = "\033[45m"
  ANSI_BACKCYAN   = "\033[46m"
  ANSI_BACKGRAY   = "\033[47m"

  ANSI_RESET      = "\033[0m"
  ANSI_BOLD       = "\033[1m"
  ANSI_UNDERSCORE = "\033[4m"
  ANSI_BLINK      = "\033[5m"
  ANSI_REVERSE    = "\033[7m"
  ANSI_CONCEALED  = "\033[8m"

  XTERM_SET_TITLE   = "\033]2;"
  XTERM_END         = "\007"
  ITERM_SET_TAB     = "\033]1;"
  ITERM_END         = "\007"
  SCREEN_SET_STATUS = "\033]0;"
  SCREEN_END        = "\007"
end
 
require 'pp'
  
# load rubygems and wirble
begin
  require 'rubygems'
  require 'wirble'
 
  # load wirble (http://www.rubyinside.com/wirble-tab-completion-and-syntax-coloring-for-irb-336.html)
  Wirble.init
  Wirble.colorize
rescue
end

# Load Rails specific settings
if ENV['RAILS_ENV']
  load File.dirname(__FILE__) + '/.railsrc'
end

# http://dotfiles.org/~sd/.irbrc
begin # Utility methods
  def pm(obj, *options) # Print methods
    methods = obj.methods
    methods -= Object.methods unless options.include? :more
    filter = options.select {|opt| opt.kind_of? Regexp}.first
    methods = methods.select {|name| name =~ filter} if filter

    data = methods.sort.collect do |name|
      method = obj.method(name)
      if method.arity == 0
        args = "()"
      elsif method.arity > 0
        n = method.arity
        args = "(#{(1..n).collect {|i| "arg#{i}"}.join(", ")})"
      elsif method.arity < 0
        n = -method.arity
        args = "(#{(1..n).collect {|i| "arg#{i}"}.join(", ")}, ...)"
      end
      klass = $1 if method.inspect =~ /Method: (.*?)#/
      [name, args, klass]
    end
    max_name = data.collect {|item| item[0].size}.max
    max_args = data.collect {|item| item[1].size}.max
    data.each do |item| 
      print " #{ANSI_BOLD}#{item[0].rjust(max_name)}#{ANSI_RESET}"
      print "#{ANSI_GRAY}#{item[1].ljust(max_args)}#{ANSI_RESET}"
      print "   #{ANSI_LGRAY}#{item[2]}#{ANSI_RESET}\n"
    end
    data.size
  end
end
  
ARGV.concat [ "--readline", "--prompt-mode", "simple" ]

alias :q :exit
