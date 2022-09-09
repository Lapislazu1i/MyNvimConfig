-- cmake source mapping
vim.api.nvim_set_keymap('n', "<leader><leader>b", ":!cmake -B build -G Ninja -DCMAKE_EXPORT_COMPILE_COMMANDS=ON<CR>", {noremap = true})
-- cmake build mapping
vim.api.nvim_set_keymap('n', "<leader><leader>s", ":!cmake . -B build -DCMAKE_C_COMPILER=clang -DCMAKE_CXX_COMPILER=clang++ -DCMAKE_BUILD_TYPE=Debug -G Ninja -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -DCMAKE_DEPENDS_USE_COMPILER=FALSE <CR>", {noremap = true})
-- cmake test mapping
vim.api.nvim_set_keymap('n', "<leader><leader>t", ":!cmake --build build -j2 --target test<CR>", {noremap = true})

