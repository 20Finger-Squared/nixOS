{ pkgs }:
{
  plugin = pkgs.vimPlugins.nvim-tinygit;
  type = "lua";
  config = # lua
    ''
      local tiny = require("tinygit")

      -- Keymaps
      vim.keymap.set("n", "<leader>gs", tiny.interactiveStaging)
      vim.keymap.set("n", "<leader>gc", tiny.smartCommit)
      vim.keymap.set("n", "<leader>gp", tiny.push)

      -- Helper function for border
      local function getBorder()
        return vim.o.winborder or "rounded"
      end

      -- Setup tinygit
      require("tinygit").setup {
        stage = {
          -- requires `telescope.nvim`
          contextSize = 1, -- larger values "merge" hunks. 0 is not supported.
          stagedIndicator = "󰐖",
          keymaps = { -- insert & normal mode
            stagingToggle = "<Space>", -- stage/unstage hunk
            gotoHunk = "<CR>",
            resetHunk = "<C-r>",
          },
          moveToNextHunkOnStagingToggle = false,
          -- accepts the common telescope picker config
          telescopeOpts = {
            layout_strategy = "horizontal",
            layout_config = {
              horizontal = {
                preview_width = 0.65,
                height = { 0.7, min = 20 },
              },
            },
          },
        },
        commit = {
          keepAbortedMsgSecs = 300,
          border = getBorder(), -- `vim.o.winborder` on nvim 0.11, otherwise "rounded"
          spellcheck = true, -- vim's builtin spellcheck
          wrap = "hard", ---@type "hard"|"soft"|"none"
          -- Show staged changes in a preview window during commit
          preview = {
            enabled = true,
            position = "right", -- "right", "bottom", or "top"
            width = 0.6, -- for right position (0-1)
            height = 0.6, -- for bottom/top position (0-1)
          },
          keymaps = {
            normal = { abort = "q", confirm = "<CR>", togglePreview = "<C-p>" },
            insert = { confirm = "<C-CR>", togglePreview = "<C-p>" },
          },
          subject = {
            -- automatically apply formatting to the subject line
            autoFormat = function(subject) ---@type nil|fun(subject: string): string
              subject = subject:gsub("%.$", "") -- remove trailing dot
              return subject
            end,
            -- disallow commits that do not use an allowed type
            enforceType = true,
            types = {
              "fix", "feat", "chore", "docs", "refactor", "build", "test",
              "perf", "style", "revert", "ci", "break",
            },
          },
          body = {
            enforce = true,
          },
        },
        push = {
          preventPushingFixupCommits = true,
          confirmationSound = true, -- currently macOS only, PRs welcome
          -- If pushed commits contain references to issues, open them in the browser
          -- (not used when force-pushing).
          openReferencedIssues = false,
        },
        github = {
          icons = {
            openIssue = "🟢",
            closedIssue = "🟣",
            notPlannedIssue = "⚪",
            openPR = "🟩",
            mergedPR = "🟪",
            draftPR = "⬜",
            closedPR = "🟥",
          },
        },
        history = {
          diffPopup = {
            width = 0.8, -- between 0-1
            height = 0.8,
            border = getBorder(), -- `vim.o.winborder` on nvim 0.11, otherwise "rounded"
          },
          autoUnshallowIfNeeded = false,
        },
        appearance = {
          mainIcon = "󰊢",
          backdrop = {
            enabled = true,
            blend = 40, -- 0-100
          },
        },
        statusline = {
          blame = {
            ignoreAuthors = {}, -- hide component if from these authors (useful for bots)
            hideAuthorNames = {}, -- show component, but hide names (useful for your own name)
            maxMsgLen = 40,
            icon = "ﰖ",
          },
          branchState = {
            icons = {
              ahead = "󰶣",
              behind = "󰶡",
              diverge = "󰃻",
            },
          },
        },
      }
    '';
}
