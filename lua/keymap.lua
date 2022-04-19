local v = vim.api
local map = v.nvim_set_keymap
local defOp = {noremap = true}

--ESC
map("v", "<C-j>", "<Esc>", defOp)
map("i", "<C-j>", "<Esc>", defOp)

--Movement
map("i", "<C-l>", "<Esc>la", defOp)
map("i", "<C-h>", "<Esc>i", defOp)

--Line Drag
map("v", "<M-j>", ":m'>+<CR>gv", defOp)
map("v", "<M-k>", ":m-2<CR>gv", defOp)
map("n", "<M-j>", "ddp", defOp)
map("n", "<M-k>", "ddkP", defOp)
map("i", "<M-j>", "<Esc>ddp", defOp)
map("i", "<M-k>", "<Esc>ddkP", defOp)

--Scopes
function ScopePosibleOverJump(char)
	local line = v.nvim_get_current_line()
	local row, col = unpack(v.nvim_win_get_cursor(0))
	print(char .. "|" .. line:sub(col + 1, col + 1) )
	if char ~= line:sub(col + 1, col + 1) then
		--write
		local nline = line:sub(0, col) .. char .. line:sub(col + 1)
		v.nvim_set_current_line(nline)
	end
	v.nvim_win_set_cursor(0, {row, col + 1})
end

map("i", "[", "[]<Esc>i", defOp)
map("i", "(", "()<Esc>i", defOp)
map("i", "<", "<><Esc>i", defOp)
map("i", "{", "{}<Esc>i", defOp)
map("i", "{{","{<CR>}<Esc>O", defOp)

map("i", "]", [[<Cmd>lua ScopePosibleOverJump("]")<CR>]], defOp)
map("i", ")", [[<Cmd>lua ScopePosibleOverJump(")")<CR>]], defOp)
map("i", ">", [[<Cmd>lua ScopePosibleOverJump(">")<CR>]], defOp)
map("i", "}", [[<Cmd>lua ScopePosibleOverJump("}")<CR>]], defOp)
