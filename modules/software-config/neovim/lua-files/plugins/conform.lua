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
            '--style={BasedOnStyle: LLVM, IndentWidth: 8, UseTab: ForIndentation, TabWidth: 8, BreakBeforeBraces: Custom, BraceWrapping: {AfterFunction: true, AfterControlStatement: Never}, IndentCaseLabels: false, PointerAlignment: Right, ColumnLimit: 79, AllowShortIfStatementsOnASingleLine: false, AllowShortLoopsOnASingleLine: false, AllowShortFunctionsOnASingleLine: None, AllowShortBlocksOnASingleLine: Never, AlwaysBreakAfterReturnType: TopLevel, SpaceBeforeParens: ControlStatements}',
          }
      },
  },
  format_on_save = {
      lsp_format = "fallback",
  };
})
