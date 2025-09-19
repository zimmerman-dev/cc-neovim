local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  -- Basic main function snippet
  s("main", {
    t("int main() {"),
    t({ "", "    " }),
    i(0),
    t({ "", "    return 0;", "}" }),
  }),

  -- A "for" loop snippet
  s("fori", {
    t("for (int i{0}; i < "),
    i(1, "n"),
    t("; ++i) {"),
    t({ "", "    " }),
    i(0),
    t({ "", "}" }),
  }),

  -- vector
  s("vec", {
    t("std::vector<"),
    i(1, "int"),
    t("> "),
    i(2, "vec"),
    t(";"),
  }),

  -- function
  s("fn", {
    i(1, "void"),
    t(" "),
    i(2, "funcName"),
    t("("),
    i(3),
    t(") {"),
    t({ "", "    " }),
    i(0),
    t({ "", "}" }),
  }),

  -- cout
  s("cout", {
    t("std::cout << "),
    i(1, "_"),
    t(" << std::endl;"),
  }),

  -- Switch
  s("switch", {
    t("switch ("), i(1, "value"), t(") {"),
    t({ "", "    case " }), i(2, "1"), t(": {"),
    t({ "", "        " }), i(3),
    t({ "", "        break;", "    }", "" }),
    t({ "    default: {", "        break;", "    }", "}" }),
  }),
}
