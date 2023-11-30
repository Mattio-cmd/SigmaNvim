require 'lspconfig'.lua_ls.setup{}

local ls = require "luasnip"
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

local extras = require("luasnip.extras")
local rep = extras.rep
local fmt = require("luasnip.extras.fmt").fmt
local c = ls.choice_node
local f = ls.function_node
local d = ls.dynamic_node
local sn = ls.snippet_node

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

ls.add_snippets("lua", {
    s("hello", {
        t('print("hello '),
        i(1),
        t(' world")')
    }),

    s("if", {
        t('if '),
        i(1, "true"),
        t(' then '),
        i(2),
        t(' end')
    })
})

ls.add_snippets("tex", {
    s("beg", {
        t("\\begin{"), i(1), t("}"),
        t({ "", "\t" }), i(0),
        t({ "", "\\end{" }), rep(1), t("}"),
    })
})

ls.add_snippets("cs", {
    s("logc",
        fmt([[Debug.Log($"<color={}>{}</color>");]],
        {
            c(1, {
                t("red"),
                t("green"),
                t("blue"),
                t("cyan"),
                t("magenta")
            }),
            i(2),
        })),
})

ls.add_snippets("typescriptreact", {

    -- 1st version
    s("co", {
        t("position(["),
        f(function()
            local register_data = vim.fn.getreg() .. "";
            if string.match(register_data, "[%d-]+,%s*[%d-]+") then
                return register_data
            else
                print("register does not contain the pattern")
            end
        end),
        t("])"),
    }),

    s("co", {
        d(function()
            local register_data = vim.fn.getreg() .. "";
            if string.match(register_data, "[%d-]+,%s*[%d-]+") then
                return M.sn(nil, {
                    M.t("position([" .. register_data .. "])"),
                })
            else
                print("register does not contain the pattern")
                return M.sn(nil, { })
            end
        end),
        i(1)
    })
})



ls.add_snippets("tex", {
  -- Global Functions
  s("math", {
    t("vim.fn.match('vimtex#syntax#in_mathzone()', '1') == '1'")
  }),

  s("comment", {
    t("vim.fn.match('vimtex#syntax#in_comment()', '1') == '1'")
  }),

  s("env", {
    t("vim.fn['vimtex#env#is_inside']('", i(1), "')")
  }),

  -- Vimtex Template
  s("vimtex_template", {
    t("\\documentclass[a4paper]{article}", "<CR><CR>"),
    t("\\usepackage[utf8]{inputenc}", "<CR>"),
    t("\\usepackage[T1]{fontenc}", "<CR>"),
    t("\\usepackage{textcomp}", "<CR>"),
    t("\\usepackage[dutch]{babel}", "<CR>"),
    t("\\usepackage{amsmath, amssymb}", "<CR>"),
    t("", "<CR>"),
    t("% figure support", "<CR>"),
    t("\\usepackage{import}", "<CR>"),
    t("\\usepackage{xifthen}", "<CR>"),
    t("\\pdfminorversion=7", "<CR>"),
    t("\\usepackage{pdfpages}", "<CR>"),
    t("\\usepackage{transparent}", "<CR>"),
    t("\\newcommand{\\incfig}[1]{%", "<CR>"),
    t("  \\def\\svgwidth{\\columnwidth}", "<CR>"),
    t("  \\import{./figures/}{#1.pdf_tex}", "<CR>"),
    t("}", "<CR>"),
    t("", "<CR>"),
    t("\\pdfsuppresswarningpagegroup=1", "<CR>"),
    t("", "<CR>"),
    t("\\begin{document}", "<CR>"),
    t("  $0", "<CR>"),
    t("\\end{document}", "<CR>")
  }),

  -- Vimtex Snippets
  s("vimtex_begin_end", {
    t("\\begin{", i(1), "}", "<CR>"),
    i(2),
    t("\\end{", i(1), "}", "<CR>")
  }),

  s("vimtex_ldots", {
    t("\\ldots")
  }),

  s("vimtex_table", {
    t("\\begin{table}[", i(1, "htpb"), "]", "<CR>"),
    t("  \\centering", "<CR>"),
    t("  \\caption{", i(2, "caption"), "}", "<CR>"),
    t("  \\label{tab:", i(3, "label"), "}", "<CR>"),
    t("  \\begin{tabular}{", i(5, "c"), "}", "<CR>"),
    t("    $0", i(5, "${5/((?<=.)c|l|r)|./(?1: & )/g}"), "<CR>"),
    t("  \\end{tabular}", "<CR>"),
    t("\\end{table}", "<CR>")
  }),

  s("vimtex_figure", {
    t("\\begin{figure}[", i(1, "htpb"), "]", "<CR>"),
    t("  \\centering", "<CR>"),
    t("  \\includegraphics[width=0.8\\textwidth]{", i(3), "}", "<CR>"),
    t("  \\caption{", i(4, "$3"), "}", "<CR>"),
    t("  \\label{fig:", i(5, "${3/\\W+/-/g}"), "}", "<CR>"),
    t("\\end{figure}", "<CR>")
  }),

  s("vimtex_enumerate", {
    t("\\begin{enumerate}", "<CR>"),
    t("  \\item $0", "<CR>"),
    t("\\end{enumerate}", "<CR>")
  }),

  s("vimtex_itemize", {
    t("\\begin{itemize}", "<CR>"),
    t("  \\item $0", "<CR>"),
    t("\\end{itemize}", "<CR>")
  }),

  s("vimtex_description", {
    t("\\begin{description}", "<CR>"),
    t("  \\item[", i(1), "] $0", "<CR>"),
    t("\\end{description}", "<CR>")
  }),

  s("vimtex_package", {
    t("\\usepackage[", i(1, "options"), "]{", i(2, "package"), "}$0", "<CR>")
  }),

  s("vimtex_implies", {
    t("\\implies")
  }),

  s("vimtex_impliedby", {
    t("\\impliedby")
  }),

  -- More snippets can be added based on your needs
})
