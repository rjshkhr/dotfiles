---@diagnostic disable: lowercase-global

ignore = {
	"111", -- setting an undefined global variable
	"122", -- setting a read-only field of a global variable
}

-- Global objects defined by the C code
read_globals = {
	"vim",
}
