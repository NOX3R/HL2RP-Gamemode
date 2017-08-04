
-----------------------------------------------------
local function OnContextMenuOpen()
	if not LocalPlayer():IsAdmin() then
		return false
	end
end
hook.Add( "ContextMenuOpen", "OnContextMenuOpen", OnContextMenuOpen )