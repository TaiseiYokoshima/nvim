return {
  "windwp/nvim-autopairs",
  event = { "InsertEnter" },
  dependencies = {
    "hrsh7/nvim-cmp",
  },
  config = function()
    local autopairs = require("nvim-autopairs")
    autopairs.setup({
      check_ts = tree,
      ts_config = {
        lua = { "string" },
        typescript = { "template_string"},
        rust = {"single_quotes"},
        java = false,
      },
    })


    local Rule = require("nvim-autopairs.rule")

    autopairs.add_rule(Rule("<", ">", {"rust", "java", "csharp"}))

    autopairs.remove_rule("'") 
    autopairs.add_rule(Rule("'", "'", {"-rust"}))


    autopairs.remove_rule("`") 
    autopairs.add_rule(Rule("`", "`", {"-typescript", "-javascript"}))


  end
}
