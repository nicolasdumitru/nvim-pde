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

    -- set shorter name for keymap function
    local kmap = vim.keymap.set
    -- F5 processes the document once, and refreshes the view
    kmap({ 'n', 'v', 'i' }, '<F5>', function() require("knap").process_once() end)
    -- F6 closes the viewer application, and allows settings to be reset
    kmap({ 'n', 'v', 'i' }, '<F6>', function() require("knap").close_viewer() end)
    -- F7 toggles the auto-processing on and off
    kmap({ 'n', 'v', 'i' }, '<F7>', function() require("knap").toggle_autopreviewing() end)
    -- F8 invokes a SyncTeX forward search, or similar, where appropriate
    kmap({ 'n', 'v', 'i' }, '<F8>', function() require("knap").forward_jump() end)
end

return {
    "frabjous/knap",
    ft = {"tex", "texmf", "texinfo", "initex", "plaintex", "bib", "bst"},
    config = configuration()
}
