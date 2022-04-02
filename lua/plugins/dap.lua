local dap = require('dap')
dap.adapters.python = {
  type = 'executable';
  command = 'path/to/virtualenvs/debugpy/bin/python';
  require('dap-python').setup('~/.virtualenvs/debugpy/bin/python');
  args = { '-m', 'debugpy.adapter' };
}
