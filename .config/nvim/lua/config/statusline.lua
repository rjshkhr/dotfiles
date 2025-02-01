local mode_colors = {
	n = "StatusLineModeNormal",
	i = "StatusLineModeInsert",
	v = "StatusLineModeVisual",
	[""] = "StatusLineModeVisual",
	V = "StatusLineModeVisual",
	c = "StatusLineModeCommand",
	R = "StatusLineModeReplace",
	t = "StatusLineModeTerminal",
}

local mode_names = {
	n = "NORMAL",
	i = "INSERT",
	v = "VISUAL",
	[""] = "V-BLOCK",
	V = "V-LINE",
	c = "COMMAND",
	R = "REPLACE",
	t = "TERMINAL",
}

local filetype_icons = {
	["typescript"] = "",
	["javascript"] = "",
	["javascriptreact"] = "",
	["typescriptreact"] = "",
	["svelte"] = "",
	["python"] = "",
	["java"] = "",
	["html"] = "",
	["css"] = "",
	["scss"] = "",
	["php"] = "",
	["kotlin"] = "",
	["markdown"] = "",
	["sh"] = "",
	["zsh"] = "",
	["vim"] = "",
	["rust"] = "",
	["c"] = "",
	["cpp"] = "",
	["cs"] = "",
	["go"] = "",
	["lua"] = "",
	["conf"] = "",
	["haskell"] = "",
	["ruby"] = "",
}

local function get_filetype_icon()
	local ft = vim.bo.filetype
	return filetype_icons[ft] or " "
end

local function get_mode()
	local mode = vim.api.nvim_get_mode().mode
	return "%#" .. (mode_colors[mode] or "StatusLineModeNormal") .. "#"
end

local function get_mode_name()
	local mode = vim.api.nvim_get_mode().mode
	return mode_names[mode] or mode
end

local function get_modified()
	if vim.bo.modified then
		return ""
	end
	return ""
end

vim.o.statusline = table.concat({
	"%{%v:lua.require'config.statusline'.get_mode()%}",
	" %{v:lua.require'config.statusline'.get_mode_name()} ",
	"%#StatusLinePath#",
	" %f ",
	"%#StatusLineModified#",
	"%{v:lua.require'config.statusline'.get_modified()}",
	"%#StatusLineFlags#",
	"%r%h%w",
	"%=",
	"%#StatusLineFileType#",
	"%{v:lua.require'config.statusline'.get_filetype_icon()}",
	" %{&filetype} ",
	"%#StatusLinePosition#",
	" %l:%c ",
})

return {
	get_mode = get_mode,
	get_mode_name = get_mode_name,
	get_modified = get_modified,
	get_filetype_icon = get_filetype_icon,
}
