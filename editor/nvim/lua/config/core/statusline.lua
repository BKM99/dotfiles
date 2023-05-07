local function status_line()
	local mode = "%-5{%v:lua.string.upper(v:lua.vim.fn.mode())%}"
	-- local file_name = "%-.16t    "
	local file_name = "%f"
	local buf_nr = "    Bufnr:[%n]"
	local modified = " %-m"
	local file_type = "    %y"
	local right_align = "%="
	local line_no = "%10([%l/%L%)]"
	local column_nr = "  %c"

	return string.format(
		"%s%s%s%s%s%s%s%s",
		mode,
		file_name,
		modified,
		buf_nr,
		file_type,
		right_align,
		line_no,
		column_nr
	)
end

vim.opt.statusline = status_line()
