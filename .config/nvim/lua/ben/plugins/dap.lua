return {
  'mfussenegger/nvim-dap',
  dependencies = {
    -- nice debugger ui
    'rcarriga/nvim-dap-ui',

    -- required dep for ui
    'nvim-neotest/nvim-nio',

    -- lang specific...

    -- show variable values as virtual text
    'theHamsta/nvim-dap-virtual-text',
  },
  keys = {
    {
      '<leader>Dc',
      function() require('dap').continue() end,
      desc = "Debug: start/continue"
    },
    {
      '<leader>Dsi',
      function()
        require('dap').step_into()
      end,
      desc = "Debug: step into"
    },
    {
      '<leader>Dso',
      function()
        require('dap').step_over()
      end,
      desc = "Debug: step over"
    },
    {
      '<leader>DsO',
      function()
        require('dap').step_out()
      end,
      desc = "Debug: step out"
    },
    {
      '<leader>Db',
      function()
        require('dap').toggle_breakpoint()
      end,
      desc = "Debug: Toggle Breakpoint"
    },
    {
      '<leader>DB',
      function()
        require('dap').set_breakpoint(vim.fn.input 'Breakpoint condition: ')
      end,
      desc = "Debug: Set Conditional Breakpoint"
    },
    {
      '<leader>Dt',
      function()
        require('dapui').toggle()
      end,
      desc = "Debug: Toggle UI"
    },
    {
      '<leader>Dl',
      function() require('dap').run_last() end,
      desc = "Debug: Run last configuration"
    }
  },

  config = function()
    local dap = require('dap')
    local dapui = require('dapui')

    local function find_mise_root()
      local mise_toml = vim.fs.find('mise.toml', {
        upward = true,
        path = vim.api.nvim_buf_get_name(0) ~= '' and vim.api.nvim_buf_get_name(0) or vim.fn.getcwd(),
      })[1]

      return mise_toml and vim.fs.dirname(mise_toml) or nil
    end

    local function guess_executable(root)
      local candidates = vim.fn.glob(root .. '/**/*', false, true)
      local executables = vim.tbl_filter(function(path)
        return vim.fn.filereadable(path) == 1
          and vim.fn.executable(path) == 1
          and not path:match('/%.git/')
          and not path:match('/%.zig%-cache/')
          and not path:match('/%.build/')
      end, candidates)

      table.sort(executables, function(a, b)
        return vim.fn.getftime(a) > vim.fn.getftime(b)
      end)

      return executables[1]
    end

    local function run_mise_build(root)
      vim.notify('mise run build', vim.log.levels.INFO)
      local result = vim.system({ 'mise', 'run', 'build' }, {
        cwd = root,
        text = true,
      }):wait()

      if result.code ~= 0 then
        vim.notify(result.stderr ~= '' and result.stderr or 'mise run build failed', vim.log.levels.ERROR)
        error('mise run build failed')
      end
    end

    local lldb_adapter = vim.fn.executable('lldb-dap') == 1
      and { type = 'executable', command = 'lldb-dap', name = 'lldb' }
      or { type = 'executable', command = 'xcrun', args = { 'lldb-dap' }, name = 'lldb' }

    dap.adapters.lldb = lldb_adapter

    dap.configurations.odin = {
      {
        name = 'Debug Odin project (mise)',
        type = 'lldb',
        request = 'launch',
        cwd = function()
          return find_mise_root() or vim.fn.getcwd()
        end,
        program = function()
          local root = find_mise_root()
          if not root then
            vim.notify('No mise.toml found', vim.log.levels.ERROR)
            return ''
          end

          run_mise_build(root)

          local default_path = guess_executable(root) or (root .. '/')
          return vim.fn.input('Path to executable: ', default_path, 'file')
        end,
        args = function()
          local input = vim.fn.input('Args: ')
          return vim.split(vim.trim(input), '%s+', { trimempty = true })
        end,
        stopOnEntry = false,
        console = 'integratedTerminal',
      },
    }

    dapui.setup({
      icons = { expanded = '▼', collapsed = '▶︎', current_frame = '*' },
      controls = {
        icons = {
          pause = '⏸︎',
          play = '▶︎',
          step_into = '⏎',
          step_over = '⏭︎',
          step_out = '⏮︎',
          step_back = 'b',
          run_last = '⏩︎',
          terminate = '⏹︎',
          disconnect = '⏏︎'
        }
      }
    })

    -- automatically open/close dap ui
    dap.listeners.after.event_initialized['dapui_config'] = dapui.open
    dap.listeners.before.event_terminated['dapui_config'] = dapui.close
    dap.listeners.before.event_exited['dapui_config'] = dapui.close

    -- virtual text to show variable values inline
    require('nvim-dap-virtual-text').setup({})
  end
}
