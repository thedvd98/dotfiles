return {
    "pappasam/nvim-repl",
    init = function()
        vim.g["repl_filetype_commands"] = {
            bash = "bash",
            javascript = "node",
            python = "python3",
            ocaml = "ocaml",
            sh = "sh",
            vim = "nvim --clean -ERM",
        }
    end,
    keys = {
        { "<Leader>rc", "<Plug>(ReplSendCell)", mode = "n", desc = "Send Repl Cell" },
        { "<Leader>rr", "<Plug>(ReplSendLine)", mode = "n", desc = "Send Repl Line" },
        { "<Leader>r", "<Plug>(ReplSendVisual)", mode = "x", desc = "Send Repl Visual Selection" }
    },
}
