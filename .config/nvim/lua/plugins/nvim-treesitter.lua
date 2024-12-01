return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
        local configs = require("nvim-treesitter.configs")
        configs.setup({
            ensure_installed = { 'bash', 'c', 'cpp', 'diff', 'html', 'lua', 'luadoc', 'yaml', 'typescript', 'javascript', 'ocaml'},
            auto_install = true,
            sync_install = false,
            ignore_install = { 'ruby' },
            modules = {},
            highlight = {
                enable = true,

                -- disable = function(lang, bufnr) -- Disable in large C++ buffers
                    --     return lang == "cpp" and vim.api.nvim_buf_line_count(bufnr) > 500000
                    -- end,
                    disable = function(_, buf)
                        local max_filesize = 100 * 1024 -- 100 KB
                        local ok, stats = pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(buf))
                        if ok and stats and stats.size > max_filesize then
                            return true
                        end
                    end,
                    -- list of language that will be disabled
                    -- disable = { "c", "rust" },

                    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
                    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
                    -- Using this option may slow down your editor, and you may see some duplicate highlights.
                    -- Instead of true it can also be a list of languages
                    additional_vim_regex_highlighting = false,
                },
                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = "gnn",
                        node_incremental = "grn",
                        scope_incremental = "grc",
                        node_decremental = "grm",
                    },
                },
            })
        end
    }
