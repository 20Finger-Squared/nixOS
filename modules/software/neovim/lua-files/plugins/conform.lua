require("conform").setup({
  formatters_by_ft = {
    lua = { "stylua" },
    -- Conform will run multiple formatters sequentially
    python = { "isort", "black" },
    -- You can customize some of the format options for the filetype (:help conform.format)
    rust = { "rustfmt", lsp_format = "fallback" },
    -- Conform will run the first available formatter
    javascript = { "prettierd", "prettier", stop_after_first = true },

    c = { "clang_format"},
  },
  formatters = {
      clang_format = {
          command = "clang-format",
          args = {
            '--style={BasedOnStyle: GNU, Language: C, UseTab: ForIndentation, TabWidth: 8, IndentWidth: 8, ColumnLimit: 80, PointerAlignment: Right, AlignAfterOpenBracket: Align, BreakBeforeBraces: Linux, AlwaysBreakAfterReturnType: AllDefinitions, AllowShortFunctionsOnASingleLine: None, AllowShortIfStatementsOnASingleLine: Never, AllowShortLoopsOnASingleLine: false, IndentCaseLabels: false, SpaceBeforeParens: ControlStatements, AlignTrailingComments: true,}',
          }
      },
  },
  format_on_save = {
      lsp_format = "fallback",
  };
})
