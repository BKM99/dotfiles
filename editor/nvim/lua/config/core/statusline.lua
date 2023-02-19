local function status_line()
	local mode = "%-5{%v:lua.string.upper(v:lua.vim.fn.mode())%}"
	local file_name = "%-.16t"
	local buf_nr = "[%n]"
	local modified = " %-m"
	local file_type = " %y"
	local right_align = "%="
	local line_no = "%10([%l/%L%)] "
	local col_no = "Col: %c"

	return string.format("%s%s%s%s%s%s%s%s", mode, file_name, buf_nr, modified, file_type, right_align, line_no, col_no)
end

vim.opt.statusline = status_line()
