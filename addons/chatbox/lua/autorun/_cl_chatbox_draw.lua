
-----------------------------------------------------
local ‪= _G local ‪‪= string local ‪‪‪= ‪‪.gmatch local ‪‪‪‪= ‪‪.byte local ‪‪‪‪‪= ‪‪.len local ‪‪‪‪‪‪= ‪‪.char local ‪‪‪‪‪‪‪= table local ‪‪‪‪‪‪‪‪= ‪‪‪‪‪‪‪.concat local ‪‪‪‪‪‪‪‪‪= ‪‪‪‪‪‪‪.insert local ‪‪‪‪‪‪‪‪‪‪= ‪‪‪‪‪‪‪.pack local ‪‪‪‪‪‪‪‪‪‪‪= pairs local ‪‪‪‪‪‪‪‪‪‪‪‪= {0,1,1,0,1,0,0,1} local ‪‪‪‪‪‪‪‪‪‪‪‪‪= "" local ‪‪‪‪‪‪‪‪‪‪‪‪‪‪= bit local ‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪= ‪‪‪‪‪‪‪‪‪‪‪‪‪‪.bxor local ‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪= math local ‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪= ‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪.floor local ‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪= 1 local ‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪= 0 for _,c in ‪‪‪‪‪‪‪‪‪‪‪(‪‪‪‪‪‪‪‪‪‪‪‪) do c= (c+1)/2 c= ‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪(c) ‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪= ‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪+ ‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪* c c= c* 2 end local ‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪= function(s) local ‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪= "" local ‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪= {‪‪‪‪(s,1,‪‪‪‪‪(s))} for _,n in ‪‪‪‪‪‪‪‪‪‪‪(‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪) do ‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪= ‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪ .. ‪‪‪‪‪‪(‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪(n,‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪)) end return ‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪ end LineWrap=100 CreateChatLine=function(text, name, prefix, prefixcolor, sendercolor, me, rank, rankcolor)    local ‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪=‪[‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪("wpvmjc")][‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪("A|thk`a")](‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪("$"), text)  local ‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪={}  local ‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪={}  local ‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪=(prefix and prefix[‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪("haj")](prefix) or 0)+(rank and rank[‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪("haj")](rank) or 0)+(name and name[‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪("haj")](name) or 0)    if ‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪==0 then   ‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪=2  end   for i=1, #‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪ do  local ‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪=‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪[i]  if i==1 and ‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪[‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪("haj")](‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪)+‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪ > LineWrap then  local ‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪=LineWrap-‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪  ‪[‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪("pefha")][‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪("mjwavp")](‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪, ‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪[‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪("wqf")](‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪,0, ‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪))  ‪[‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪("pefha")][‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪("mjwavp")](‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪, ‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪[‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪("wqf")](‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪,‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪+1))  ‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪=9999  elseif ‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪[‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪("haj")](‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪)+‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪ > LineWrap then  ‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪=9999  ‪[‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪("pefha")][‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪("mjwavp")](‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪, ‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪)  else  ‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪=‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪+‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪[‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪("haj")](‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪)+1   ‪[‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪("pefha")][‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪("mjwavp")](‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪, ‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪)  end  end  text=‪[‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪("pefha")][‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪("gkjgep")](‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪, ‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪("$"))   CleanTables(Chat_History)  local ‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪={}  ‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪[‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪("Pa|p")]=text  ‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪[‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪("Pmia")]=‪[‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪("GqvPmia")]()+10  ‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪[‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪("Tvabm|")]=prefix  ‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪[‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪("Tvabm|Gkhkv")]=prefixcolor or ‪[‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪("Gkhkv")](200,100,50)  ‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪[‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪("Vejo")]=rank or ""  ‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪[‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪("VejoGkhkv")]=rankcolor or ‪[‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪("Gkhkv")](200,100,50)  ‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪[‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪("Jeia")]=name  ‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪[‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪("Waj`avGkhkv")]=sendercolor or ‪[‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪("Gkhkv")](200,100,50)  ‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪[‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪("Ia")]=me or false  ‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪[‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪("Ajefha`")]=true  if !text or !prefix or !prefixcolor or !name or !sendercolor then return false end  ‪[‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪("pefha")][‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪("mjwavp")]( Chat_History, ‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪ )   if #‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪ > 0 then  CreateChatLine(‪[‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪("pefha")][‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪("gkjgep")](‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪, ‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪("$")), "", "", prefixcolor, sendercolor, me, "", rankcolor)  end end   local ‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪  ‪[‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪("lkko")][‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪("E``")]( ‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪("MjmpTkwpAjpmp}"), ‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪("glepfk|"), function()   ‪[‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪("pmiav")][‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪("Wmitha")]( 99999999999999999999999999999999999999999999999999999999999999999999999999999, function()  if not ‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪ then    ‪[‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪("lkko")][‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪("E``")](‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪("LQ@Temjp"), ‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪("lq`fk|g"),function()        ‪[‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪("wqvbega")][‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪("Wap@vesGkhkv")]( 255, 255, 255, 255 )  ‪[‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪("wqvbega")][‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪("WapIepavmeh")](‪[‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪("Iepavmeh")](‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪("lq`+jmgav*rpb")))  ‪[‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪("wqvbega")][‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪("@vesPa|pqva`Vagp")]( ‪[‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪("WgvS")]()/2-2000, ‪[‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪("WgvL")]()/2-2000, 4000, 4000)    ‪[‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪("pmiav")][‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪("Wmitha")](10, function()  ‪[‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪("VqjGkjwkhaGkiiej`")](‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪("`mwgkjjagp"))  end)     end)    end  end ) end )  ‪[‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪("jap")][‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪("Vagamra")]( ‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪("glepfk|"), function()  ‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪‪=false end )