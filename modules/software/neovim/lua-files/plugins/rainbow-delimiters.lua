local rainbow = require("rainbow-delimiters")
if rainbow then 
  vim.g.rainbow_delimiters = {
    strategy = {
      [""] = rainbow.strategy["global"],
    },
    query = {
      [""] = "rainbow-delimiters",
    },
  } 
end
