return {
	'nvim-treesitter/nvim-treesitter',
	build = ':TSUpdate',
    opts = {
        ensure_installed = { 'bash', 'c', 'cpp', 'diff', 'html', 'lua', 'luadoc'},
        sync_install = false,
        auto_install = false,
        highlight = {
            -- `false` will disable the whole extension
            enable = true,

            -- disable = function(lang, bufnr) -- Disable in large C++ buffers
            --     return lang == "cpp" and vim.api.nvim_buf_line_count(bufnr) > 500000
            -- end,
            disable = function(lang, buf)
                local max_filesize = 100 * 1024 -- 100 KB
                local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
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
        -- TODO Check what these two does
        -- incremental_selection = { enable = true },
        -- textobjects = { enable = true },
    }
}
