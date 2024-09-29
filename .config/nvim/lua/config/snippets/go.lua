local ls = require("luasnip")
local snippet = ls.snippet
local insert = ls.insert_node
local rep = require("luasnip.extras").rep
local fmt = require("luasnip.extras.fmt").fmt

local snippets = {
  snippet(
    "hfn",
    fmt(
      [[
            func (s *Server) {name}({args}) http.HandlerFunc {{
                return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request){{
                    {finally}
                }})
            }}
        ]],
      {
        name = insert(1, "Name"),
        args = insert(2),
        finally = insert(0),
      }
    )
  ),
}

ls.add_snippets("go", snippets)
