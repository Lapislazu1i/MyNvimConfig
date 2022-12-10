-- https://github.com/mfussenegger/nvim-dap

-- WARN: dap 手动下载调试器
-- https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation

local dap = require("dap")

-- 设置断点样式
vim.fn.sign_define("DapBreakpoint", {text = "⊚", texthl = "TodoFgFIX", linehl = "", numhl = ""})

-- 加载调试器配置
local dap_config = {
    python = require("user.dap.python"),
    -- go = require("user.dap.go")
    cpp = require("user.dap.cpp"),
    c = require("user.dap.c"),
    rust = require("user.dap.rust"),
}

-- 设置调试器
for dap_name, dap_options in pairs(dap_config) do
    dap.adapters[dap_name] = dap_options.adapters
    dap.configurations[dap_name] = dap_options.configurations
end

-- 打断点
vim.keymap.set("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<CR>")
-- 开启调试或到下一个断点处
vim.keymap.set("n", "<F5>", "<cmd>lua require'dap'.continue()<CR>")
-- 单步进入执行（会进入函数内部，有回溯阶段）
vim.keymap.set("n", "<F3>", "<cmd>lua require'dap'.step_into()<CR>")
-- 单步跳过执行（不进入函数内部，无回溯阶段）
vim.keymap.set("n", "<F4>", "<cmd>lua require'dap'.step_over()<CR>")
-- 步出当前函数
vim.keymap.set("n", "<leader><F3>", "<cmd>lua require'dap'.step_out()<CR>")
-- 重启调试
vim.keymap.set("n", "<leader>dr", "<cmd>lua require'dap'.run_last()<CR>")
-- 退出调试（关闭调试，关闭 repl，关闭 ui，清除内联文本）
vim.keymap.set(
    "n",
    "<leader>dc",
    "<cmd>lua require'dap'.close()<CR><cmd>lua require'dap.repl'.close()<CR><cmd>lua require'dapui'.close()<CR><cmd>DapVirtualTextForceRefresh<CR>"
)


-- add
require ("user.dap.dap-virtual-text")
require ("user.dap.dap-ui")
