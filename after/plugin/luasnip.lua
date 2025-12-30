-- require 'lspconfig'.lua_ls.setup{} -- deprecated
vim.lsp.config('lua_ls', {})

local ls = require "luasnip"
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

local extras = require("luasnip.extras")
local rep = extras.rep


ls.add_snippets("tex", {
    s("beg", {
        t("\\begin{"), i(1), t("}"),
        t({ "", "	" }), i(0),
        t({ "", "\\end{" }), rep(1), t("}"),
    })
})

ls.add_snippets("tex", {
    s("it", {
        t("\\begin{itemize}"),
        t({ "", "	\\item{" }), i(1), t("}"),
        t({ "", "\\end{itemize}" }),
    })
})

ls.add_snippets("tex", {
    s("lap", {
        t("\\mathcal{L} \\left\\{ "), i(1), t(" \\right\\}"),
    })
})

ls.add_snippets("tex", {
    s("log", {
        t("$\\mathbf{"), i(1), t("}$"),
    })
})

ls.add_snippets("tex", {
    s("ilap", {
        t("\\mathcal{L}^{-1} \\left\\{ "), i(1), t(" \\right\\}"),
    })
})

ls.add_snippets("tex", {
    s("abs", {
        t("\\left| "), i(1), t(" \\right|"),
    })
})

ls.add_snippets("tex", {
    s("fig", {
        t("\\begin{figure}[h]"),
        t({ "	", "\t\\centering" }),
        t({ "	", "\t\\includegraphics[width=0.8\\textwidth]{" }), i(1), t("}"),
        t({ "	", "\t\\caption{" }), i(2), t("}"),
        t({ "	", "\t\\label{" }), i(3), t("}"),
        t({ "", "\\end{figure}" }),
    })
})

ls.add_snippets("tex", {
    s("minipage", {
        t("\\begin{figure}[h]"),  -- Inicia la figura
        t({ "\t\\centering" }),    -- Centrado
        t({ "\t\\begin{minipage}{0.3\\textwidth}" }),  -- Minipage para la imagen
        t({ "\t\t\\centering" }),  -- Centrado de la imagen
        t({ "\t\t\\includegraphics[width=\\textwidth]{" }), i(1), t("}"),  -- Imagen
        t({ "\t\\end{minipage}" }),  -- Cierra la minipage de la imagen
        t({ "\t\\hspace{0.5cm}" }),  -- Espacio entre imagen y texto
        t({ "\t\\begin{minipage}{0.48\\textwidth}" }),  -- Minipage para el texto
        i(2),  -- Texto por defecto
        t({ "\t\\end{minipage}" }),  -- Cierra la minipage del texto
        t({ "", "\\end{figure}" })  -- Cierra la figura
    })
})


ls.add_snippets("matlab", {
    s("func", {
        t("function "), i(1), t(" = "), i(2),
        i(3),
    t("end")
    })
})

ls.add_snippets("matlab", {
  s("newton", {
    t {
      "function raiz = newton_raphson(f, df, x0, e_a, max_iter)",
      "    x = x0;",
      "    for i = 1:max_iter",
      "        if abs(df(x)) < 1e-10",
      "                disp('ERROR: Derivative too small, division by zero possible.');",
      "                raiz = NaN;",
      "                return;",
      "        end",
      "        x_sig = x - f(x)/df(x);",
      "        if abs(x_sig - x) < e_a",
      "                raiz = x_sig;",
      "                return;",
      "        end",
      "        x = x_sig;",
      "    end",
      "    raiz = NaN;",
      "end",
    },
  }),
})

ls.add_snippets("matlab", {
    s("bairstow", {
        t("function roots = bairstow(coeffs, e_a, max_iter)\n"),
        t("    % coeffs: Coefficients of the polynomial (highest degree first)\n"),
        t("    % e_a: Absolute error tolerance for convergence\n"),
        t("    % max_iter: Maximum number of iterations\n\n"),
        t("    n = length(coeffs) - 1;  % Degree of the polynomial, contempla el de x^0\n"),
        t("    if n < 2\n"),
        t("        error('ERROR: El polinomio debe de ser al menos grado dos');\n"),
        t("        return;\n"),
        t("    end\n\n"),
        t("    % Initial estimates for the coefficients of the quadratic factors\n"),
        t("    r = 0;  % Initial guess for r (real part of the root)\n"),
        t("    s = 0;  % Initial guess for s (imaginary part of the root)\n\n"),
        t("    % Initialize the remainder (Q(x)) and its first and second derivatives\n"),
        t("    b = zeros(1, n + 1);  % b is the coefficient array for the recurrence relation\n"),
        t("    c = zeros(1, n + 1);  % c is the second recurrence relation\n\n"),
        t("    % Main Bairstow method loop\n"),
        t("    for iter = 1:max_iter\n"),
        t("        % Perform the synthetic division to update b and c\n"),
        t("        b(n + 1) = coeffs(n + 1);  % b[n] = a[n]\n"),
        t("        b(n) = coeffs(n) + r * b(n + 1); % b[n-1] = a[n-1] + r * b[n]\n"),
        t("        for j = n - 1:-1:1\n"),
        t("            b(j) = coeffs(j) + r * b(j + 1) + s * b(j + 2);  % Recurrence\n"),
        t("        end\n\n"),
        t("        % Update the second recurrence\n"),
        t("        c(n + 1) = b(n + 1);\n"),
        t("        c(n) = b(n) + r * c(n + 1);\n"),
        t("        for j = n - 1:-1:1\n"),
        t("            c(j) = b(j) + r * c(j + 1) + s * c(j + 2);\n"),
        t("        end\n\n"),
        t("        % Update the coefficients for the new quadratic factors\n"),
        t("        delta_r = 0;\n"),
        t("        delta_s = 0;\n\n"),
        t("        % Solve the system for r and s\n"),
        t("        denominator = c(1) * c(2) - c(2) * c(3);\n"),
        t("        if denominator == 0\n"),
        t("            disp('Error: The denominator is zero. The system cannot be solved.');\n"),
        t("            return;\n"),
        t("        end\n\n"),
        t("        % Calculate the deltas and update r and s\n"),
        t("        delta_r =  c(1) - c(2);\n"),
        t("        delta_s = c(2) - delta_r;\n\n"),
        t("        % Check for convergence based on error tolerance.\n"),
        t("        if abs(delta_r) < e_a && abs(delta_s) < e_a\n"),
        t("            break;  % Convergence achieved.\n"),
        t("        end\n"),
        t("    end\n\n"),
        t("    % Return the roots\n"),
        t("    roots = [r, s];\n"),
        t("end\n")
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

