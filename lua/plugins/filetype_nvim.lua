local filetype_ok, _ = pcall(require, "filetype")
if not filetype_ok then
	return
end

vim.g.did_load_filetypes = 1
