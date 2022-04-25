local v = vim.api
local map = v.nvim_set_keymap
local defOp = {noremap = true}

--Open Config
map("n", "<leader>conf", ":e $MYVIMRC<CR>", defOp)

--Telescope
map("n", "<leader>ff", [[<cmd>lua require('telescope.builtin').find_files()<cr>]], defOp)
map("n", "<leader>fg", [[<cmd>lua require('telescope.builtin').live_grep()<cr>]], defOp)
map("n", "<leader>bo", [[<cmd>lua require('telescope.builtin').buffers()<cr>]], defOp)
map("n", "<leader>fh", [[<cmd>lua require('telescope.builtin').help_tags()<cr>]], defOp)

--Buffer
map("n", "<leader>bn", ":bnext<CR>", defOp)
map("n", "<leader>bp", ":bprev<CR>", defOp)
map("n", "<leader>bc", ":bdelete<CR>", defOp)
map("n", "<leader>bwc", ":w<CR>:bdelete<CR>", defOp)

--ESC
map("n", "<C-j>", "<Esc>", defOp)
map("i", "<C-j>", "<Esc>", defOp)
map("v", "<C-j>", "<Esc>", defOp)
map("s", "<C-j>", "<Esc>", defOp)
map("x", "<C-j>", "<Esc>", defOp)
map("c", "<C-j>", "<Esc>", defOp)
map("o", "<C-j>", "<Esc>", defOp)
map("l", "<C-j>", "<Esc>", defOp)
map("t", "<C-j>", "<C-\\><C-n>", defOp)

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
map("v", "<M-h>", "<gv", defOp)
map("v", "<M-l>", ">gv", defOp)
map("n", "<M-h>", "<<", defOp)
map("n", "<M-l>", ">>", defOp)

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

map("i", "<M-[>", "[]<Esc>i", defOp)
map("i", "<M-]>","[<CR>]<Esc>O", defOp)
map("i", "<M-(>", "()<Esc>i", defOp)
map("i", "<M-<>", "<><Esc>i", defOp)
map("i", "<M-{>", "{}<Esc>i", defOp)
map("i", "<M-}>","{<CR>}<Esc>O", defOp)
map("i", "<M-'>", "''<Esc>i", defOp)
map("i", "<M-\">", "\"\"<Esc>i", defOp)

map("i", "]", [[<Cmd>lua ScopePosibleOverJump("]")<CR>]], defOp)
map("i", ")", [[<Cmd>lua ScopePosibleOverJump(")")<CR>]], defOp)
map("i", ">", [[<Cmd>lua ScopePosibleOverJump(">")<CR>]], defOp)
map("i", "}", [[<Cmd>lua ScopePosibleOverJump("}")<CR>]], defOp)
map("i", "'", [[<Cmd>lua ScopePosibleOverJump("'")<CR>]], defOp)
map("i", "\"", [[<Cmd>lua ScopePosibleOverJump("\"")<CR>]], defOp)

--Nvim Tree
map("n", "<leader>to", ":NvimTreeOpen<CR>", defOp)
map("n", "<leader>tc", ":NvimTreeClose<CR>", defOp)
map("n", "<leader>tr", ":NvimTreeRefresh<CR>", defOp)
map("n", "<leader>tt", ":NvimTreeToggle<CR>", defOp)

--completion
vim.api.nvim_command("inoremap <expr> <Tab>   pumvisible() ? \"\\<C-n>\" : \"\\<Tab>\"")
vim.api.nvim_command("inoremap <expr> <S-Tab> pumvisible() ? \"\\<C-p>\" : \"\\<S-Tab>\"")

--copy paste
map("n", "<leader>p", "\"+p", defOp)
map("n", "<leader>y", "\"+yy", defOp)
map("v", "<leader>y", "\"+y", defOp)
