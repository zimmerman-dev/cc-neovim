-- snippets/c/init.lua
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  -- Boilerplate main
  s("main", {
    t({ "#include <stdio.h>", "", "int main() {", "\t" }),
    i(1, "// your code here"),
    t({ "", "\treturn 0;", "}" }),
  }),

  -- printf
  s("pf", {
    t('printf("'),
    i(1, "%s\\n"),
    t('", '),
    i(2, "value"),
    t(");"),
  }),

  -- scanf
  s("sf", {
    t('scanf("'),
    i(1, "%d"),
    t('", &'),
    i(2, "var"),
    t(");"),
  }),

  -- for loop
  s("for", {
    t("for (int "),
    i(1, "i"),
    t(" = 0; "),
    i(2, "i < n"),
    t("; "),
    i(3, "i++"),
    t({ ") {", "\t" }),
    i(4, "// body"),
    t({ "", "}" }),
  }),
}

