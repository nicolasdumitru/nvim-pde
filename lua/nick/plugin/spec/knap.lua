local function configuration()
    vim.g.knap_settings = {
        -- Using buffer as stdin rather than saving
        textopdf = "pdflatex -jobname \"$(basename -s .pdf %outputfile%)\" -halt-on-error",
        textopdfbufferasstdin = true,
        -- Viewer configuration (Okular)
        textopdfviewerlaunch = "okular --unique %outputfile%",
        textopdfviewerrefresh = "none",
        textopdfforwardjump = "okular --unique %outputfile%'#src:%line% '%srcfile%"
    }

    local kmap = vim.keymap.set -- set shorter name for keymap function
    kmap({ 'n', 'v', 'i' }, '<F5>', function() require("knap").process_once() end,
        { desc = "KNAP: process the document once, and refresh the view" })
    kmap({ 'n', 'v', 'i' }, '<F6>', function() require("knap").close_viewer() end,
        { desc = "KNAP: close the viewer application (allows settings to be reset)" })
    kmap({ 'n', 'v', 'i' }, '<F7>', function() require("knap").toggle_autopreviewing() end,
        { desc = "KNAP: toggle the auto-processing on and off" })
    kmap({ 'n', 'v', 'i' }, '<F8>', function() require("knap").forward_jump() end,
        { desc = "KNAP: invoke a SyncTeX forward search, or similar, where appropriate" })
end

return {
    "frabjous/knap",
    ft = { "tex", "texmf", "texinfo", "initex", "plaintex", "bib", "bst" },
    config = configuration()
}
