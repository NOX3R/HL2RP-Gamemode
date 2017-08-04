F4_Elements = {}

function F4Element_CreateStruct(LuaName)
	local STR = {}
	STR.LuaName = LuaName
	
	STR.Wide = 1
	function STR:SetWide(x)
		self.Wide = x
	end
	
	STR.PrintName = ""
	function STR:SetPrintName(a)
		self.PrintName = a
	end
	
	function STR:RenderOnSelector()
	end
	
	function STR:OnCanvasCreated()
	end
	
	return table.Copy(STR)
end

function F4Element_Register(DB)
	F4_Elements[DB.LuaName] = DB
end

function F4Element_GetTable(luaname)
local TB = F4_Elements[luaname]
	if TB then
		return TB
	end
	
	return false
end

function F4Element_Include()
local path = "elements/"
	for _, file in pairs(file.Find(path .. "*.lua","LUA")) do
		if SERVER then
			AddCSLuaFile(path .. file)
		end
		include(path .. file)
		MsgN(path .. file)
	end
end
F4Element_Include()