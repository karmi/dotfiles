require 'rubygems'
require 'rake'

desc "Install the dotfiles as symlinks in $HOME directory"
task :install do
  replace_all = false
  Dir['*'].each do |file|
    next if %w[Rakefile README.markdown].include? file
    
    if File.exist?(File.join(ENV['HOME'], ".#{file}"))
      if replace_all
        replace_file(file)
      else
        print "Overwrite ~/.#{file}? [ynaq] "
        case $stdin.gets.chomp
        when 'a'
          replace_all = true
          replace_file(file)
        when 'y'
          replace_file(file)
        when 'q'
          exit
        else
          puts "Skipping ~/.#{file}"
        end
      end
    else
      link_file(file)
    end
  end
  print "Reload ~/.profile? [yn] "
  if $stdin.gets.chomp == 'y'
    system ". $HOME/.profile"
  end
end

def replace_file(file)
  system %Q{rm "$HOME/.#{file}"}
  link_file(file)
end

def link_file(file)
  puts "Linking ~/.#{file}"
  system %Q{ln -s "$PWD/#{file}" "$HOME/.#{file}"}
end
