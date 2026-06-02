return {
    cmd = "rust-analyzer",
    filetypes = { "rust" },
    root_markers = { "Cargo.toml", "Cargo.lock" },
    settings = {
        ["rust-analyzer"] = {
            inlayHints = { locationLinks = false },
            lens = {
                enable = true,
            },
            checkOnSave = {
                enable = true,
                command = "clippy",
            },
            diagnostics = {
                experimental = true,
            }
        }
    }
}
