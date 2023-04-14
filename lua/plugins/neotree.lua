return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    keys = {
      {
        "-",
        function()
          require("neo-tree.command").execute({ toggle = true, reveal = true, dir = vim.loop.cwd() })
        end,
        desc = "Explorer NeoTree",
      },
    },
    opts = {
      filesystem = {
        bind_to_cwd = false,
        follow_current_file = true,
        commands = {
          system_open = function(state)
            local node = state.tree:get_node()
            local path = node:get_id()
            vim.api.nvim_command(string.format("silent !xdg-open '%s'", path))
          end,
        },
        window = {
          mappings = {
            ["o"] = "system_open",
            ["h"] = function(state)
              local node = state.tree:get_node()
              if (node.type == "directory" or node:has_children()) and node:is_expanded() then
                state.commands.toggle_node(state)
              else
                require("neo-tree.ui.renderer").focus_node(state, node:get_parent_id())
              end
            end,
            ["l"] = function(state)
              local node = state.tree:get_node()
              if node.type == "directory" or node:has_children() then
                if not node:is_expanded() then
                  state.commands.toggle_node(state)
                else
                  require("neo-tree.ui.renderer").focus_node(state, node:get_child_ids()[1])
                end
              end
            end,
          },
        },
      },
      window = {
        position = "float",
      },
    },
  },
}
