local dap = require('dap')
dap.adapters.python = {
  type = 'executable';
  command = 'path/to/virtualenvs/debugpy/bin/python';
  require('dap-python').setup('~/.virtualenvs/debugpy/bin/python');
  args = { '-m', 'debugpy.adapter' };
}

--shellsplit('-arg1 --arg2 "this is arg2"') -> {'arg1', '--arg2', 'this is arg2'}

local dap = require'dap'
dap.configurations.python = dap.configurations.python or {}
table.insert(dap.configurations.python, {
    type = 'python',
    request = 'launch',
    name = 'launch with options',
    program = '${file}';
    python = function() end,
    pythonPath = function()
        local path
        for _, server in pairs(vim.lsp.buf_get_clients()) do
            if server.name == 'pyright' or server.name == 'pylance' then
                path = vim.tbl_get(server, 'config', 'settings', 'python', 'pythonPath')
                break
            end
        end
        path = vim.fn.input('Python path: ', path or '', 'file')
        return path ~= '' and vim.fn.expand(path) or nil
    end,
    args = function()
        local args = {}
        local i = 1
        while true do
            local arg = vim.fn.input("Argument [" .. i .. "]: ")
            if arg == '' then
                break
            end
            args[i] = arg
            i = i + 1
        end
        return args
    end,
    justMyCode = function()
        local yn = vim.fn.input('justMyCode? [y/n]: ')
        if yn == 'y' then return true end
        return false
    end,
    stopOnEntry = function()
        local yn = vim.fn.input('stopOnEntry? [y/n]: ')
        if yn == 'y' then return true end
        return false
    end,
    console = 'integratedTerminal'
})
