require 'lspconfig'.lua_ls.setup{}

local ls = require "luasnip"
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

local extras = require("luasnip.extras")
local rep = extras.rep

ls.add_snippets("lua", {
  s("hello", {
    t('print("Hello world!")')
  })
})

ls.add_snippets("tex", {
    s("beg", {
        t("\\begin{"), i(1), t("}"),
        t({ "", "\t" }), i(0),
        t({ "", "\\end{" }), rep(1), t("}"),
    })
})

ls.add_snippets("tex", {
    s("it", {
        t("\\begin{itemize}"),
        t({ "", "\t\\item{" }), i(1), t("}"),
        t({ "", "\\end{itemize}" }),
    })
})

ls.add_snippets("tex", {
    s("lap", {
        t("\\mathcal{L} \\left\\{ "), i(1), t(" \\right\\}"),
    })
})

ls.add_snippets("tex", {
    s("ilap", {
        t("\\mathcal{L}^{-1} \\left\\{ "), i(1), t(" \\right\\}"),
    })
})

ls.add_snippets("tex", {
    s("fig", {
        t("\\begin{figure}[h]"),
        t({ "\t", "\t\\centering" }),
        t({ "\t", "\t\\includegraphics[width=0.8\\textwidth]{" }), i(1), t("}"),
        t({ "\t", "\t\\caption{" }), i(2), t("}"),
        t({ "\t", "\t\\label{" }), i(3), t("}"),
        t({ "", "\\end{figure}" }),
    })
})


--\begin{figure}[h]
  --\centering
  --\includegraphics[width=0.3\textwidth]{}
  --\caption{}
  --\label{fig:your_label}
--\end{figure}


-- luasnip.lua
vim.keymap.set({ "i", "s" }, "<A-n>", function()
    if ls.choice_active() then
        ls.change_choice(1)
    end
end)

vim.keymap.set({ "i", "s" }, "<A-k>", function()
    if ls.expand_or_jumpable() then
        ls.expand_or_jump()
    end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<A-j>", function()
    if ls.jumpable(-1) then
        ls.jump(-1)
    end
end, { silent = true })

