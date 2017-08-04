
local function InitChessLeaderboard()
	if sql.TableExists("ChessLeaderboard") then
		sql.Begin()
			local query = sql.Query( [[ALTER TABLE ChessLeaderboard ADD DraughtsElo int;]])
		sql.Commit()
		
		if query==false then
			if sql.LastError()~="duplicate column name: DraughtsElo" then --Yeah, sql.Query doesn't like IF
				Error( "Chess: SQL Column insertion failed - Query error. "..sql.LastError().."\n" )
			end
		else
			print( "Chess: Added Draughts column to Elo table" )
		end
		return
	end
	sql.Begin()
		local query = sql.Query( [[CREATE TABLE ChessLeaderboard (SteamID varchar(255), Username varchar(255), Elo int, DraughtsElo int);]] )
	sql.Commit()
	
	if query==false then ErrorNoHalt( "Chess: SQL Table Creation failed." ) else print("Chess: Created Elo table") end
end
InitChessLeaderboard()

function Chess_UpdateElo( ply )
	if not IsValid(ply) then return end
	
	local SelStr = [[SELECT * FROM ChessLeaderboard WHERE SteamID==]].. sql.SQLStr(ply:SteamID()) ..[[;]]
	sql.Begin()
		local Select = sql.Query( SelStr )
	sql.Commit()
	
	local UpdateStr
	if Select==false then
		Error( "Chess: Save failed for player "..ply:Nick().." - Query error. "..sql.LastError().."\n" )
	elseif Select==nil then
		UpdateStr = [[INSERT INTO ChessLeaderboard (SteamID, Username, Elo, DraughtsElo) VALUES (]]..sql.SQLStr(ply:SteamID())..[[,]]..sql.SQLStr(ply:Nick())..[[,]]..sql.SQLStr(ply:GetChessElo())..[[,]]..sql.SQLStr(ply:GetDraughtsElo())..[[);]]
	else
		UpdateStr = [[UPDATE ChessLeaderboard SET Username=]]..sql.SQLStr(ply:GetName())..[[,Elo=]]..sql.SQLStr(ply:GetChessElo())..[[,DraughtsElo=]]..sql.SQLStr(ply:GetDraughtsElo())..[[ WHERE SteamID==]]..sql.SQLStr(ply:SteamID())..[[;]]
	end
	
	sql.Begin()
		local Update = sql.Query( UpdateStr )
	sql.Commit()
	
	if Update==false then
		Error( "Chess: Update failed for player "..ply:Nick().." - Query error. "..sql.LastError().."\n" )
	end
end

function Chess_GetRank( ply, typ )
	local query = string.gsub([[SELECT (
				SELECT  COUNT(*)+1
				FROM    ChessLeaderboard ordered
				WHERE   (ordered.{ELO}) > (uo.{ELO})
				) AS Rank, (SELECT COUNT(*) FROM ChessLeaderboard) AS Count
			FROM ChessLeaderboard uo WHERE SteamID==]]..sql.SQLStr(ply:SteamID())..[[;]], "{ELO}", (typ=="Draughts" and [[DraughtsElo]] or [[Elo]]) )
	sql.Begin()
		local rank = sql.Query( query )
	sql.Commit()
	
	if not (rank and rank[1] and rank[1].Rank and rank[1].Count) then return false end
	
	return rank and rank[1] and rank[1].Rank, rank and rank[1] and rank[1].Count
end

util.AddNetworkString( "Chess Top10" )
local ValidType = {["Chess"] = true, ["Draughts"] = true}
net.Receive( "Chess Top10", function( len, ply )
	if not IsValid(ply) then return end
	
	local typ = net.ReadString()
	if not (typ and ValidType[typ]) then typ = "Chess" end
	
	local query = string.gsub([[SELECT Username, SteamID, {ELO} as Elo, (
				SELECT  COUNT(*)+1
				FROM    ChessLeaderboard ordered
				WHERE   (ordered.{ELO}) > (uo.{ELO})
				) AS Rank
			FROM ChessLeaderboard uo ORDER BY {ELO} DESC LIMIT 10;]], "{ELO}", (typ=="Draughts" and [[DraughtsElo]] or [[Elo]]) )
	sql.Begin()
		local Top10 = sql.Query( query )
	sql.Commit()
	
	if Top10==false then
		Error( "Chess: Top10 retreival failed - Query error. "..sql.LastError().."\n" )
	elseif Top10==nil then
		Error( "Chess: Top10 retreival failed - No data." )
	else
		local rank,total = Chess_GetRank(ply, typ)
		local str = (rank and total and rank.." of "..total) or rank or "N/A"
		net.Start( "Chess Top10" )
			net.WriteString( typ )
			net.WriteTable( Top10 )
			
			net.WriteString( str )
		net.Send( ply )
	end
end)

-- function TestElo()
	-- local typ = ""
	
	-- local query = string.gsub([[SELECT *,(
				-- SELECT  COUNT(*)+1
				-- FROM    ChessLeaderboard ordered
				-- WHERE   (ordered.{ELO}) > (uo.{ELO})
				-- ) AS Rank, (SELECT COUNT(*) FROM ChessLeaderboard) AS Count
			-- FROM ChessLeaderboard uo ORDER BY {ELO} DESC;]], "{ELO}", (typ=="Draughts" and [[DraughtsElo]] or [[Elo]]) )
	-- sql.Begin()
		-- local Top10 = sql.Query( query )
	-- sql.Commit()
	
	-- if Top10 then
		-- print( Top10 )
		-- PrintTable( Top10 )
		
		-- print( Top10[1].Rank, type(Top10[1].Rank) )
	-- else
		-- print( sql.LastError() )
	-- end
-- end
