
local Top10
local function ChessTop10( typ )
	if IsValid(Top10) then Top10:Remove() end
	
	typ = typ or "Chess"
	
	Top10 = vgui.Create( "DFrame" )
	Top10:SetSize( 450, 245 )
	Top10:SetPos( (ScrW()/2)-150, (ScrH()/2)-100 )
	Top10:SetTitle( "Top 10 meilleur joueur d\'Echec" )
	Top10:MakePopup()
	Top10.Column = "Elo"
	
	
	Top10.Rank = vgui.Create( "DLabel", Top10 )
	Top10.Rank:Dock( BOTTOM )
	Top10.Rank:SetTall( 20 )
	Top10.Rank:SetText("")
	
	Top10.List = vgui.Create( "DListView", Top10 )
	local List = Top10.List
	List:Dock( FILL )
	List:AddColumn( "Rang" )
	List:AddColumn( "Nom" )
	List:AddColumn( "SteamID" )
	List:AddColumn( "Elo" )
	
	List:AddLine( "", "Chargement..." )
	-- PrintTable( List.Columns )
	List:OnRequestResize( List.Columns[1], 10 )
	List:OnRequestResize( List.Columns[2], 150 )
	List:OnRequestResize( List.Columns[3], 100 )
	List:OnRequestResize( List.Columns[4], 10 )
	
	net.Start( "Chess Top10" ) net.WriteString( typ ) net.SendToServer()
end
local function DraughtsTop10()
	ChessTop10( "Draughts" )
end
concommand.Add( "chess_top", function( p,c,a ) ChessTop10() end)

local ChatCommands = {
	["!echec"]=ChessTop10,	["!echectop"]=ChessTop10,	["!topechec"]=ChessTop10,
	["/echec"]=ChessTop10,	["/echectop"]=ChessTop10,	["/topechec"]=ChessTop10,
	
	["!dames"]=DraughtsTop10,	["!damesstop"]=DraughtsTop10,	["!topdames"]=DraughtsTop10,
	["/dames"]=DraughtsTop10,	["/damesstop"]=DraughtsTop10,	["/topdames"]=DraughtsTop10,
	
	["!checkers"]=DraughtsTop10,	["!checkerstop"]=DraughtsTop10,	["!topcheckers"]=DraughtsTop10,
	["/checkers"]=DraughtsTop10,	["/checkerstop"]=DraughtsTop10,	["/topcheckers"]=DraughtsTop10,
}
hook.Add( "OnPlayerChat", "Chess Top10 PlayerChat", function( ply, str, tm, dead )
	if ChatCommands[str:lower()] then
		if ply==LocalPlayer() then
			ChatCommands[str:lower()]()
		end
		return true
	end
end)

net.Receive( "Chess Top10", function()
	if not (IsValid(Top10) and IsValid(Top10.List)) then return end
	
	Top10.List:Clear()
	
	local typ = net.ReadString() or "[Error]"
	
	Top10:SetTitle( "Top 10 "..typ.." Elo ratings" )
	
	local tbl = net.ReadTable()
	if not tbl then return end
	
	for i=1,#tbl do
		Top10.List:AddLine( tonumber(tbl[i].Rank), tbl[i].Username, tbl[i].SteamID, tonumber(tbl[i]["Elo" ]) )
	end
	
	Top10.Rank:SetText( "Tu es rang "..(net.ReadString() or "N/A") )
end)
