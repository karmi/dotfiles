Pry.config.prompt = proc do |obj, level, _|
  [
    "Ruby #{RUBY_VERSION}".ansi(:faint),
    " @ (#{obj.to_s.ansi(:faint, :bold)})\n\e[0m".ansi(:faint),
    ANSI.reset,
    "> ".ansi(:faint)
  ].join
end
