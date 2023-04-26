M = function()
    local actions = require('telescope.actions')
    local telescopeConfig = require("telescope.config")
    local vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) }
    table.insert(vimgrep_arguments, "--hidden")
    table.insert(vimgrep_arguments, "--glob")
    table.insert(vimgrep_arguments, "!**/.git/*")
    require('telescope').setup {
        defaults = {
            vimgrep_arguments = vimgrep_arguments,
            mappings = {
                i = {
                    ["<esc>"] = actions.close,
                    ["<C-x>"] = actions.select_vertical,
                    ["<Tab>"] = actions.select_vertical,
                    ["<CR>"] = actions.select_default,
                }
            }
        },
        pickers = {
            find_files = {
                -- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
                find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
            },
        },
        extensions = {
            project = {
                base_dirs = {
                    '~/Projects',
                    '~/Projects/go/src',
                }
            }
        }
    }
    require 'telescope'.load_extension('project')
end

return M
