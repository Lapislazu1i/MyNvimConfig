-- cmake source mapping
vim.api.nvim_set_keymap('n', "<leader><leader>b", ":!cmake --build build<CR>", {noremap = true})
-- cmake build mapping
vim.api.nvim_set_keymap('n', "<leader><leader>s", ":!cmake . -B build -DCMAKE_EXPORT_COMPILE_COMMANDS=ON  <CR>", {noremap = true})
-- cmake test mapping
vim.api.nvim_set_keymap('n', "<leader><leader>t", ":!cmake --build build -j2 --target test<CR>", {noremap = true})

