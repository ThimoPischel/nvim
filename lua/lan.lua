if vim.fn.has("unix") == 1 then 
  print("Linux Language server...")
  --lua
  local runtime_path = vim.split(package.path, ';')
  table.insert(runtime_path, "lua/?.lua")
  table.insert(runtime_path, "lua/?/init.lua")
  require'lspconfig'.sumneko_lua.setup {
    settings = {
      Lua = {
        runtime = {
          -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
          version = 'LuaJIT',
          -- Setup your lua path
          path = runtime_path,
        },
        diagnostics = {
          -- Get the language server to recognize the `vim` global
          globals = {'vim'}
        },
        workspace = {
          -- Make the server aware of Neovim runtime files
          library = vim.api.nvim_get_runtime_file("", true),
        }
      }
    }
  }
elseif vim.fn.has("windows") == 1 then
  print("Windows Language server...")
  --rust
  require'lspconfig'.rls.setup{}
else
  print("No system for the language server found.")
end;
