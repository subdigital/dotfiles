local mise_term = {
    buf = nil,
    win = nil,
    chan = nil
}

local function find_mise_root()
    local root = vim.fn.findfile("mise.toml", ".;")
    if root ~= "" then
        return vim.fn.fnamemodify(root, ":p:h")
    end
    return nil
end

local function toggle_mise_terminal()
    if mise_term.win and vim.api.nvim_win_is_valid(mise_term.win) then
        -- window is open, close it
        vim.api.nvim_win_close(mise_term.win, false)
        mise_term.win = nil
    elseif mise_term.buf and vim.api.nvim_buf_is_valid(mise_term.buf) then
        -- buffer exists but window closed
        vim.cmd("vsplit")
        vim.api.nvim_win_set_buf(0, mise_term.buf)
        mise_term.win = vim.api.nvim_get_current_win()
    else
        -- no terminal exists yet
        vim.notify("No mise terminal exists yet, press F8 to build first", vim.log.levels.WARN)
    end
end

local function run_mise_cmd(cmd)
    local root = find_mise_root()
    if not root then
        vim.notify("No mise.toml found", vim.log.levels.ERROR)
        return
    end

    local start_win = vim.api.nvim_get_current_win()

    if not mise_term.buf or not vim.api.nvim_buf_is_valid(mise_term.buf) then
        open_mise_terminal()
    elseif not mise_term.win or not vim.api.nvim_win_is_valid(mise_term.win) then
        open_mise_terminal()
    end

    -- send the command
    local full_cmd = string.format("cd %s && %s\n", vim.fn.shellescape(root), cmd)
    vim.fn.chansend(mise_term.chan, full_cmd)

    -- return to window
    vim.api.nvim_set_current_win(start_win)
end

local function set_mise_keymaps(bufnr)
    local opts = { buffer = bufnr, silent = true, noremap = true }

    vim.keymap.set("n", "<F8>", function()
        run_mise_cmd("mise run build")
    end, vim.tbl_extend("force", opts, { desc = "mise run build" }))

    vim.keymap.set("n", "<F9>", function()
        run_mise_cmd("mise run run")
    end, vim.tbl_extend("force", opts, { desc = "mise run run" }))

    vim.keymap.set("n", "<F10>", function()
        toggle_mise_terminal()
    end, vim.tbl_extend("force", opts, { desc = "toggle mise terminal" }))
end

function open_mise_terminal()
    if mise_term.buf and vim.api.nvim_buf_is_valid(mise_term.buf) then
        -- buffer exists, open it
        vim.cmd("vsplit")
        vim.api.nvim_win_set_buf(0, mise_term.buf)
        mise_term.win = vim.api.nvim_get_current_win()
    else
        -- create new terminal
        vim.cmd("vsplit")
        vim.cmd("terminal")
        mise_term.buf = vim.api.nvim_get_current_buf()
        mise_term.win = vim.api.nvim_get_current_win()
        mise_term.chan = vim.b.terminal_job_id
        set_mise_keymaps(mise_term.buf)
    end
end

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "c", "cpp", "h", "odin", "swift" },
    callback = function()
        if not find_mise_root() then
            return
        end
        set_mise_keymaps(0)
    end
})
