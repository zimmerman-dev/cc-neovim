local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  -- Basic main function snippet
  s("main", {
    t({ "#include <iostream>", "", "int main() {", "    " }),
    i(0),
    t({ "", "    return 0;", "}" }),
  }),


	-- A "for" loop snippet
  s("fori", {
    t("for (int "), i(1, "i"), t(" = 0; "),
    i(2, "i"), t(" < "), i(3, "n"), t("; "), i(4, "i"), t({ "++) {", "  " }),
    i(0),
    t({ "", "}" }),
  }),
}

