if vim.fn.has("unix") == 1 then
  require("lan/linux")
elseif vim.fn.has("win32") == 1 then
  require("lan/win32")
else
  print("No system for the language server found.")
end;
