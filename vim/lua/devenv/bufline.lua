local colors                         = require('devenv.colors').colors()
local hil                            = require('devenv.colors.hil')
require('bufferline').setup {
    highlights = {
        -- BufferLine
        indicator_selected   = { guifg = colors.cyan, gui = "bold"},
        fill                = { guibg = colors.gre1 },
        -- group_separator = {},
        -- group_label = {},
        -- tab = {guibg = colors.bg, gui = "bold,italic"},
        tab_selected = { guifg = colors.green, gui = "bold"},
        tab_close = {guibg = colors.bg, guifg = colors.darker_red},
        background = {guibg = colors.darker_black, guifg = colors.grey1},
        close_button = {guibg = colors.darker_black, guifg = colors.bright_red},
        close_button_visible = {guibg = colors.black, guifg = colors.bright_red},
        close_button_selected = {guibg = colors.bg, guifg = colors.darker_red},
        -- buffer = {guibg = colors.darker_black, guifg = colors.grey1},
        buffer = {highlight = "PMenu"},
        buffer_visible = {guibg = colors.darker_black, guifg = colors.grey1},
        buffer_selected = {guibg = colors.bg, gui = "bold,italic"},
        -- diagnostic = {},
        -- diagnostic_visible = {},
        -- diagnostic_selected = {},
        -- info = {},
        -- info_visible = {},
        -- info_selected = {},
        -- info_diagnostic = {},
        -- info_diagnostic_visible = {},
        -- info_diagnostic_selected = {},
        -- warning = {},
        -- warning_visible = {},
        -- warning_selected = {},
        -- warning_diagnostic = {},
        -- warning_diagnostic_visible = {},
        -- warning_diagnostic_selected = {},
        -- error = {},
        -- error_visible = {},
        -- error_selected = {},
        -- error_diagnostic = {},
        -- error_diagnostic_visible = {},
        -- error_diagnostic_selected = {},
        -- modified = {},
        -- modified_visible = {},
        -- modified_selected = {},
        -- duplicate_selected = {},
        -- duplicate_visible = {},
        -- duplicate = {},
        -- separator_selected = { guifg = colors.cyan, guibg = colors.cyan },
        -- separator_visible = { guifg = colors.cyan, guibg = colors.cyan },
        -- separator = { guifg = colors.cyan, guibg = colors.cyan },
        -- pick_selected = {},
        -- pick_visible = {},
        -- pick = {},
    },
    options = {
        numbers = function(opts)
            return string.format('%s ', opts.id)
        end,
        close_command = "bdelete! %d",       -- can be a string | function, see "Mouse actions"
        right_mouse_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
        left_mouse_command = "buffer %d",    -- can be a string | function, see "Mouse actions"
        middle_mouse_command = nil,          -- can be a string | function, see "Mouse actions"
        -- NOTE: this plugin is designed with this icon in mind,
        -- and so changing this is NOT recommended, this is intended
        -- as an escape hatch for people who cannot bear it for whatever reason
        indicator_icon = '▎',
        buffer_close_icon = '',
        modified_icon = '●',
        close_icon = '',
        left_trunc_marker = '',
        right_trunc_marker = '',
        --- name_formatter can be used to change the buffer's label in the bufferline.
        --- Please note some names can/will break the
        --- bufferline so use this at your discretion knowing that it has
        --- some limitations that will *NOT* be fixed.
        name_formatter = function(buf)  -- buf contains a "name", "path" and "bufnr"
            -- remove extension from markdown files for example
            if buf.name:match('%.md') then
                return vim.fn.fnamemodify(buf.name, ':t:r')
            end
        end,
        max_name_length = 18,
        max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
        tab_size = 18,
        diagnostics = "nvim_lsp",
        diagnostics_update_in_insert = false,
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
            return "("..count..")"
        end,
        -- NOTE: this will be called a lot so don't do any heavy processing here
        custom_filter = function(buf_number)
            -- filter out filetypes you don't want to see
            if vim.bo[buf_number].filetype ~= "<i-dont-want-to-see-this>" then
                return true
            end
            -- filter out by buffer name
            if vim.fn.bufname(buf_number) ~= "<buffer-name-I-dont-want>" then
                return true
            end
            -- filter out based on arbitrary rules
            -- e.g. filter out vim wiki buffer from tabline in your work repo
            if vim.fn.getcwd() == "<work-repo>" and vim.bo[buf_number].filetype ~= "wiki" then
                return true
            end
        end,
        offsets = {{filetype = "NvimTree", text = "File Explorer" , text_align = "center"}},
        show_buffer_icons = true, -- disable filetype icons for buffers
        show_buffer_close_icons = true ,
        show_close_icon = true,
        show_tab_indicators = true ,
        persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
        -- can also be a table containing 2 custom separators
        -- [focused and unfocused]. eg: { '|', '|' }
        separator_style = {'',''},
        enforce_regular_tabs = false ,
        always_show_bufferline = true,
    }
}
