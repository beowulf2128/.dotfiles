# enable auto completion with tab key
require 'irb/completion'

# save irb history across sessions
require 'irb/ext/save-history'
IRB.conf[:SAVE_HISTORY] = 100
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-save-history"

### Get interactive_ruby gem functionality on the cheap
# Open vim within IRB
def vi
  system "vim ~/.scratchvim.rb"
end
# Execute contents of vim within IRB
def vix
  Object.class_eval `cat ~/.scratchvim.rb`
end
