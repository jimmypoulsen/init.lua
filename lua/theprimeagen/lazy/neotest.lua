return {
    {
        "nvim-neotest/neotest",
        dependencies = {
            "nvim-neotest/nvim-nio",
            "nvim-lua/plenary.nvim",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-treesitter/nvim-treesitter",
            "marilari88/neotest-vitest",
            "nvim-neotest/neotest-plenary",
            "olimorris/neotest-rspec",
        },
        config = function()
            local neotest = require("neotest")
            neotest.setup({
                adapters = {
                    require("neotest-vitest"),
                    require("neotest-rspec"),
                    require("neotest-plenary").setup({
                        -- this is my standard location for minimal vim rc
                        -- in all my projects
                        min_init = "./scripts/tests/minimal.vim",
                    }),
                }
            })

            vim.keymap.set("n", "<leader>tc", function()
                neotest.run.run()
            end)

            vim.keymap.set("n", "<leader>tC", function()
                neotest.run.run(vim.fn.expand("%"))
            end)

            vim.keymap.set("n", "<leader>ts", function()
                neotest.summary.toggle()
            end)

            vim.keymap.set("n", "<leader>tv", function()
              neotest.output_panel.toggle()
            end)
        end,
    },
}

