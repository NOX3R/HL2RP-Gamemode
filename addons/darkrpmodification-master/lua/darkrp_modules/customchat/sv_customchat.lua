function majChat(ply, text, teamonly)
	if (string.sub(text, 1, 2) == "//" or string.sub(text, 1, 2) == "[[") then
		local taille = string.len(text);

		text = string.gsub(text, text[3], string.upper(text[3]),1);
	end;

	if (text[1]!="/") then
		local taille = string.len(text);
		
		if ply:isCP() then
			text = "<:: "..string.gsub(text, text[1], string.upper(text[1]),1).." ::>";
		else
			text = string.gsub(text, text[1], string.upper(text[1]),1)..".";
		end
	end;

	return text
end
hook.Add("PlayerSay", "Chat", majChat)