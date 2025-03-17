return {
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---
      servers = {
        -- disable yaml formatting to not fight upstreams
        yamlls = {
          settings = {
            yaml = {
              format = {
                enable = false,
              },
            },
          },
        },
      },
    },
  },
}
