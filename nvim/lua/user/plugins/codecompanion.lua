local helpers = require('codecompanion.adapters.acp.helpers')

require('codecompanion').setup({
  adapters = {
    acp = {
      bob = function()
        return {
          name = 'bob',
          formatted_name = 'IBM Bob',
          type = 'acp',

          roles = {
            llm = 'assistant',
            user = 'user',
          },

          commands = {
            default = {
              'bob',
              'acp',
            },
          },

          defaults = {
            mcpServers = {},
            timeout = 20000,
          },

          parameters = {
            protocolVersion = 1,

            clientCapabilities = {
              fs = {
                readTextFile = true,
                writeTextFile = true,
              },
            },

            clientInfo = {
              name = 'CodeCompanion.nvim',
              version = '1.0.0',
            },
          },

          handlers = {
            setup = function()
              return true
            end,

            auth = function()
              return true
            end,

            form_messages = function(self, messages, capabilities)
              return helpers.form_messages(
                self,
                messages,
                capabilities
              )
            end,

            on_exit = function() end,
          },
        }
      end,
    },
  },

  interactions = {
    chat = {
      adapter = 'bob',
    },
  },
})
