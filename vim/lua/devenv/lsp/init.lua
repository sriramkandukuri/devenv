local utils = require("devenv.utils")
local border = utils.border
local nmap = utils.nmap
local imap = utils.imap
local xmap = utils.xmap
local cmd = vim.cmd

local nvim_status = require "lsp-status"
local status = require "devenv.lsp.status"

local custom_init = function(client)
    client.config.flags = client.config.flags or {}
    client.config.flags.allow_incremental_sync = true
end

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

status.activate()

local lspsign = require("lsp_signature")
lspsign.setup({
    bind = true, -- This is mandatory, otherwise border config won't get registered.
    handler_opts = {
        border = "single"
    }
})

vim.g.diagnostics_active = false
function _G.toggle_diagnostics()
    print("toggling diags")
    if vim.g.diagnostics_active then
        vim.g.diagnostics_active = false
        vim.diagnostic.disable()
    else
        vim.g.diagnostics_active = true
        vim.diagnostic.enable()
    end
end

local custom_attach = function(client, bufnr)
    -- local filetype = vim.api.nvim_buf_get_option(0, "filetype")
    -- print("LSP started")

    nvim_status.on_attach(client)
    lspsign.on_attach(client)

    cmd [[command! LspDef lua vim.lsp.buf.definition()]]
    cmd [[command! LspFormatting lua vim.lsp.buf.formatting()]]
    -- cmd [[command! LspCodeAction lua vim.lsp.buf.code_action()]]
    -- cmd [[command! LspHover lua vim.lsp.buf.hover()]]
    -- cmd [[command! LspRename lua vim.lsp.buf.rename()]]
    cmd [[command! LspOrganize lua lsp_organize_imports()]]
    cmd [[command! LspRefs lua vim.lsp.buf.references()]]
    cmd [[command! LspTypeDef lua vim.lsp.buf.type_definition()]]
    cmd [[command! LspImplementation lua vim.lsp.buf.implementation()]]
    -- cmd [[command! LspDiagPrev lua require("devenv.lsp.diags").gprv()]]
    -- cmd [[command! LspDiagNext lua require("devenv.lsp.diags").gnxt()]]
    -- cmd [[command! LspDiagLine lua require("devenv.lsp.diags").show()]]
    cmd [[command! LspSignatureHelp lua vim.lsp.buf.signature_help()]]

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {border = border})
    -- vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.hover, {border = border})

--VH |gd|go to definition|
    nmap("gd", ":LspDef<CR>", {bufnr = bufnr})
--VH |gr|rename symbol|
    nmap("gr", "<cmd>Lspsaga rename<cr>", {bufnr = bufnr})
--VH |gy|go to type definition|
    nmap("gy", ":LspTypeDef<CR>", {bufnr = bufnr})
--VH |gk|hover to get the signature help of the word under cursor|
    nmap("gk", "<cmd>Lspsaga hover_doc<cr>", {bufnr = bufnr})
--VH |gss|organize|
    nmap("gss", ":LspOrganize<CR>", {bufnr = bufnr})
--VH |\[a|previous diagnostic|
    nmap("[a", "<cmd>Lspsaga diagnostic_jump_prev<cr>", {bufnr = bufnr})
--VH |\]a|next diagnostic|
    nmap("]a", "<cmd>Lspsaga diagnostic_jump_next<cr>", {bufnr = bufnr})
--VH |ga|show code actions|
    nmap("ga", "<cmd>Lspsaga code_action<cr>", {bufnr = bufnr})
    xmap("ga", "<cmd>Lspsaga code_action<cr>", {bufnr = bufnr})
--VH |gl|show line diagnostics as popup|
    nmap("gl", "<cmd>Lspsaga show_line_diagnostics<cr>", {bufnr = bufnr})
--VH |Space `d|toggle diagnostics|
    nmap("<leader>`d", ':call v:lua.toggle_diagnostics()<CR>')
--VH |Ctrl+l|show signature help in insert mdoe|
    imap("<c-l>", "<cmd> LspSignatureHelp<CR>", {bufnr = bufnr})
--VH |Ctrl+u|smart scroll up using lsp|
    nmap("<C-u>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<cr>", {bufnr = bufnr})
--VH |Ctrl+d|smart scroll down using lsp|
    nmap("<C-d>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<cr>", {bufnr = bufnr})

    vim.bo.omnifunc = "v:lua.vim.lsp.omnifunc"

    -- Set autocommands conditional on server_capabilities
    if client.server_capabilities.documentHighlightProvider then
        vim.cmd [[
        augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
        augroup END
        ]]
    end

    if client.server_capabilities.code_lens then
        vim.cmd [[
        augroup lsp_document_codelens
        au! * <buffer>
        autocmd BufWritePost,CursorHold <buffer> lua vim.lsp.codelens.refresh()
        augroup END
        ]]
    end
end

local updated_capabilities = vim.lsp.protocol.make_client_capabilities()
updated_capabilities = vim.tbl_deep_extend("keep", updated_capabilities, nvim_status.capabilities)
updated_capabilities.textDocument.codeLens = { dynamicRegistration = false }
updated_capabilities = require("cmp_nvim_lsp").update_capabilities(updated_capabilities)
local lcutil = require("lspconfig.util")

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = {
    pyright = false,
    graphql = false,
    vimls = true,
    yamlls = false,
    bashls = true,
    cmake = true,
    clangd = {
        cmd = {
            "clangd",
            "--background-index",
            "-j=12",
            "--query-driver=/usr/bin/**/clang-*,/bin/clang,/bin/clang++,/usr/bin/gcc,/usr/bin/g++",
            "--clang-tidy",
            "--clang-tidy-checks=*",
            "--all-scopes-completion",
            "--cross-file-rename",
            "--completion-style=detailed",
            "--header-insertion-decorators",
            "--header-insertion=iwyu",
            "--pch-storage=memory",
        },
        -- Required for lsp-status
        init_options = {
            clangdFileStatus = true,
        },
        handlers = nvim_status.extensions.clangd.setup(),
    },
    html = false,
    jedi_language_server = false,
    pylsp =  {
        cmd = {"pylsp"},
        root_dir = function(fname)
            local root_files = {
                'pyproject.toml',
                'setup.py',
                'setup.cfg',
                'requirements.txt',
                'Pipfile',
            }
            return lcutil.root_pattern(unpack(root_files))(fname) or lcutil.find_git_ancestor(fname)
        end,
        settings = {
            pylsp = {
                configurationSources = {"pylint"},
                plugins = {
                    pylint = { enabled = true },
                    flake8 = { enabled = false },
                    pycodestyle = { enabled = false },
                    pyflakes = { enabled = false },
                }
            }
        }
    },
    sumneko_lua = {
        settings = {
            Lua = {
                runtime = {
                    -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                    version = 'LuaJIT',
                    -- Setup your lua path
                    path = runtime_path,
                },
                diagnostics = {
                    -- Get the language server to recognize the `vim` global
                    globals = {'vim'},
                },
                workspace = {
                    -- Make the server aware of Neovim runtime files
                    library = vim.api.nvim_get_runtime_file("", true),
                },
                -- Do not send telemetry data containing a randomized but unique identifier
                telemetry = {
                    enable = false,
                },
            },
        },
    },
    jsonls = true,
}
local lspinst_servers = require('nvim-lsp-installer.servers')
local setup_server = function(server, config)
    if not config then
        return
    end

    if type(config) ~= "table" then
        config = {}
    end

    config = vim.tbl_deep_extend("force", {
        on_init = custom_init,
        on_attach = custom_attach,
        capabilities = updated_capabilities,
        flags = {
            debounce_text_changes = 50,
        },
    }, config)
    local server_available, requested_server = lspinst_servers.get_server(server)
    if server_available then
        if not requested_server:is_installed() then
            -- Queue the server to be installed
            requested_server:install()
        end
        requested_server:on_ready(function ()
            requested_server:setup(config)
        end)
    end
end

for server, config in pairs(servers) do
    setup_server(server, config)
end
vim.diagnostic.disable()
require("devenv.lsp.saga")
