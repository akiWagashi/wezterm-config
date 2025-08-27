local platform = require('utils.platform')

local Launch = {
   options = {}
}

function Launch:init()
   if platform.is_win then
      self.options = {
         default_prog = { 'cmd' },
         launch_menu = {
            { label = 'Command Prompt', args = { 'cmd' } }
         }
      }
   elseif platform.is_mac then
      self.options = {
         default_prog = { "/opt/homebrew/bin/fish", "-l" },
         launch_menu = {
            { label = "Bash", args = { "bash", "-l" } },
            { label = "Fish", args = { "/opt/homebrew/bin/fish", "-l" } },
         }
      }
   else
      self.options = {
         default_prog = { "bash", "-l" },
         launch_menu = {
            { label = "Bash", args = { "bash", "-l" } },
            { label = "Fish", args = { "fish", "-l" } },
         }
      }
   end
   return self
end

function Launch:insert_menu(shell)
   table.insert(self.options.launch_menu, shell)
   return self
end

function Launch:set_default(prog)
   self.options.default_prog = prog
   return self
end

return Launch:init()
