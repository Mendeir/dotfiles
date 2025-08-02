return {
    {
        "akinsho/toggleterm.nvim",
        version = "*",
        config = function()
            require("toggleterm").setup({
                -- Global settings
                size = function(term)
                    if term.direction == "vertical" then
                        return math.floor(vim.o.columns * 0.3)
                    end
                    return 20
                end,
                direction = "vertical",
                open_mapping = [[<c-\>]],
                insert_mappings = true,
                terminal_mappings = true,
                persist_size = true,
                close_on_exit = true,

                highlights = {
                    Normal = {
                        link = "Normal", -- This will use your regular buffer colors
                    },
                    NormalFloat = {
                        link = "Normal",
                    },
                    FloatBorder = {
                        link = "FloatBorder",
                    },
                },
            })

            local Terminal = require("toggleterm.terminal").Terminal

            -- Define terminals
            local term1 = Terminal:new({
                count = 1,
                direction = "vertical",
                on_create = function(t)
                    vim.api.nvim_buf_set_keymap(t.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
                end,
            })

            local term2 = Terminal:new({
                count = 2,
                direction = "vertical",
                on_create = function(t)
                    vim.api.nvim_buf_set_keymap(t.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
                end,
            })

            local term3 = Terminal:new({
                count = 3,
                direction = "vertical",
                on_create = function(t)
                    vim.api.nvim_buf_set_keymap(t.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
                end,
            })

            -- Create toggle functions in the global scope
            _G.term1_toggle = function()
                term1:toggle()
            end

            _G.term2_toggle = function()
                term2:toggle()
            end

            _G.term3_toggle = function()
                term3:toggle()
            end

            -- Set up keymaps
            local opts = { noremap = true, silent = true }

            -- Terminal toggles
            vim.keymap.set("n", "<leader>t1", "<cmd>lua term1_toggle()<CR>", opts)
            vim.keymap.set("n", "<leader>t2", "<cmd>lua term2_toggle()<CR>", opts)
            vim.keymap.set("n", "<leader>t3", "<cmd>lua term3_toggle()<CR>", opts)

            -- Terminal navigation
            vim.keymap.set("t", "<C-h>", [[<C-\><C-n><C-W>h]], opts)
            vim.keymap.set("t", "<C-j>", [[<C-\><C-n><C-W>j]], opts)
            vim.keymap.set("t", "<C-k>", [[<C-\><C-n><C-W>k]], opts)
            vim.keymap.set("t", "<C-l>", [[<C-\><C-n><C-W>l]], opts)

            -- Exit terminal mode
            vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], opts)
        end,
    },
}
