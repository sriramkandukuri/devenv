local has_lsp, lspconfig = pcall(require, "lspconfig")
if not has_lsp then
    return
end

local utils = require("devenv.utils")
local nmap = utils.nmap
local imap = utils.imap
local cmd = vim.cmd
local border = utils.border

local lspconfig_util = require "lspconfig.util"
local nvim_status = require "lsp-status"
local status = require "devenv.lsp.status"
local telescope_mapper = require "devenv.utils.telemapper"

local custom_init = function(client)
    client.config.flags = client.config.flags or {}
    client.config.flags.allow_incremental_sync = true
end

local system_name
if vim.fn.has("mac") == 1 then
  system_name = "macOS"
elseif vim.fn.has("unix") == 1 then
  system_name = "Linux"
elseif vim.fn.has('win32') == 1 then
  system_name = "Windows"
else
  print("Unsupported system for sumneko")
end

-- set the path to the sumneko installation; if you previously installed via the now deprecated :LspInstall, use
local sumneko_root_path = os.getenv( "HOME" )..'/devenv/build/lua_ls/lua-language-server'
local sumneko_binary = sumneko_root_path.."/bin/"..system_name.."/lua-language-server"

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

status.activate()

-- show diagnostic line with custom border and styling
_G.lsp_show_diagnostics = function()
  vim.lsp.diagnostic.show_line_diagnostics({border = border})
end

local lspsign = require("lsp_signature")
lspsign.setup({
    bind = true, -- This is mandatory, otherwise border config won't get registered.
    handler_opts = {
        border = "single"
    }
})

local custom_attach = function(client, bufnr)
    -- local filetype = vim.api.nvim_buf_get_option(0, "filetype")
    print("LSP started")

    nvim_status.on_attach(client)
    lspsign.on_attach(client)

    cmd [[command! LspDef lua vim.lsp.buf.definition()]]
    cmd [[command! LspFormatting lua vim.lsp.buf.formatting()]]
    cmd [[command! LspCodeAction lua vim.lsp.buf.code_action()]]
    cmd [[command! LspHover lua vim.lsp.buf.hover()]]
    cmd [[command! LspRename lua vim.lsp.buf.rename()]]
    cmd [[command! LspOrganize lua lsp_organize_imports()]]
    cmd [[command! OR lua lsp_organize_imports()]]
    cmd [[command! LspRefs lua vim.lsp.buf.references()]]
    cmd [[command! LspTypeDef lua vim.lsp.buf.type_definition()]]
    cmd [[command! LspImplementation lua vim.lsp.buf.implementation()]]
    cmd [[command! LspDiagPrev lua vim.lsp.diagnostic.goto_prev()]]
    cmd [[command! LspDiagNext lua vim.lsp.diagnostic.goto_next()]]
    cmd [[command! LspDiagLine lua lsp_show_diagnostics()]]
    cmd [[command! LspSignatureHelp lua vim.lsp.buf.signature_help()]]

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {border = border})
    -- vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.hover, {border = border})

    nmap("gd", ":LspDef<CR>", {bufnr = bufnr})
    nmap("gr", ":LspRename<CR>", {bufnr = bufnr})
    nmap("gR", ":LspRefs<CR>", {bufnr = bufnr})
    nmap("gy", ":LspTypeDef<CR>", {bufnr = bufnr})
    nmap("gk", ":LspHover<CR>", {bufnr = bufnr})
    nmap("gss", ":LspOrganize<CR>", {bufnr = bufnr})
    nmap("[a", ":LspDiagPrev<CR>", {bufnr = bufnr})
    nmap("]a", ":LspDiagNext<CR>", {bufnr = bufnr})
    nmap("ga", ":LspCodeAction<CR>", {bufnr = bufnr})
    nmap("gl", ":LspDiagLine<CR>", {bufnr = bufnr})
    imap("gs", "<cmd> LspSignatureHelp<CR>", {bufnr = bufnr})

    vim.bo.omnifunc = "v:lua.vim.lsp.omnifunc"

    -- Set autocommands conditional on server_capabilities
    if client.resolved_capabilities.document_highlight then
        vim.cmd [[
        augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
        augroup END
        ]]
    end

    if client.resolved_capabilities.code_lens then
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
            "--suggest-missing-includes",
            "--clang-tidy",
            "--header-insertion=iwyu",
        },
        -- Required for lsp-status
        init_options = {
            clangdFileStatus = true,
        },
        handlers = nvim_status.extensions.clangd.setup(),
    },
    html = false,
    jedi_language_server = true,
    pylsp = false,
    sumneko_lua = {
        cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
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

    lspconfig[server].setup(config)
end

for server, config in pairs(servers) do
    setup_server(server, config)
end
