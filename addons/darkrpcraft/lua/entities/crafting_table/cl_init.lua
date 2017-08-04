include("shared.lua")


function ENT:Initialize()
end

surface.CreateFont( "YouwotFont", {
 font = "HUDNumber5",
 size = 55,
 weight = 99900,
})

surface.CreateFont( "MatFont", {
 font = "DarkRPHUD2",
 size = 24,
 weight = 700,
})

surface.CreateFont( "LeFixedItFont", {
 font = "Trebuchet22",
 size = 18,
 weight = 0,
})

surface.CreateFont( "LeFixFont", {
 font = "HUDNumber5",
 size = 21,
 weight = 9000,
} )

local Frame

usermessage.Hook("MyUsermessage", ReadInfo)

function ENT:Draw()
	self:DrawModel()

	local Pos = self:GetPos()
	local Ang = self:GetAngles()
	
	local Pos1 = self:GetPos()
	local Ang1 = self:GetAngles() - Angle(-80,-20,0)
	local Ang2 = self:GetAngles() - Angle(-80,10,0)
	--local Ang2 = self:GetAngles() - Angle(-90,-20,0)
	Ang:RotateAroundAxis(Ang:Up(), 90)
	
	Ang1:RotateAroundAxis(Ang1:Up(), 90)

	cam.Start3D2D(Pos + (Ang:Forward() * 0) + (Ang:Up() * 16.8) + (Ang:Right() * - 20) , Ang, 0.15)
	draw.RoundedBox( 0, -370, -5, 740, 80, Color( 34, 34, 34, 220))
	draw.SimpleTextOutlined( "TABLE DE CRAFT", "YouwotFont", 0, 5, Color(255,255,255,255 ), 1, 0, 2, Color( 0, 0, 0 ) )
	cam.End3D2D()
	if self:GetNWFloat("Wood") > 0 then
		cam.Start3D2D(Pos1 + (Ang1:Forward() * -22) + (Ang1:Up() * -10) + (Ang1:Right() * -45) , Ang1, 0.15)
		draw.RoundedBox( 0, -100, 50, 80, 20, Color( 75, 139, 191, 255))
		draw.RoundedBox( 0, -100, 70, 80, 20, Color( 34, 34, 34, 240))
		draw.SimpleTextOutlined(self:GetNWFloat("Wood"), "Trebuchet24", -60, 67, Color(224,224,224,255 ), 1, 0, 0, Color( 0, 0, 0 ) )
		draw.SimpleTextOutlined("Bois", "Trebuchet24", -60, 47, Color(224,224,224,255 ), 1, 0, 0, Color( 0, 0, 0 ) )
		cam.End3D2D()
	end
	
	if self:GetNWFloat("Iron") > 0 then
		cam.Start3D2D(Pos1 + (Ang1:Forward() * 14) + (Ang1:Up() * 2) + (Ang1:Right() * -40) , Ang1 - Angle(0,20,0), 0.15)
		draw.RoundedBox( 0, -100, 50, 80, 20, Color( 75, 139, 191, 255))
		draw.RoundedBox( 0, -100, 70, 80, 20, Color( 34, 34, 34, 240))
		draw.SimpleTextOutlined(self:GetNWFloat("Iron"), "Trebuchet24", -60, 67, Color(224,224,224,255 ), 1, 0, 0, Color( 0, 0, 0 ) )
		draw.SimpleTextOutlined("BARRE DE FER", "Trebuchet24", -60, 47, Color(224,224,224,255 ), 1, 0, 0, Color( 0, 0, 0 ) )
		cam.End3D2D()
	end
	
	if self:GetNWFloat("Wrench") > 0 then
		cam.Start3D2D(Pos1 + (Ang1:Forward() * -4) + (Ang1:Up() * 8) + (Ang1:Right() * -38) , Ang1, 0.15)
		draw.RoundedBox( 0, -100, 50, 80, 20, Color( 75, 139, 191, 255))
		draw.RoundedBox( 0, -100, 70, 80, 20, Color( 34, 34, 34, 240))
		draw.SimpleTextOutlined(self:GetNWFloat("Wrench"), "Trebuchet24", -60, 67, Color(224,224,224,255 ), 1, 0, 0, Color( 0, 0, 0 ) )
		draw.SimpleTextOutlined("CLE", "Trebuchet24", -60, 47, Color(224,224,224,255 ), 1, 0, 0, Color( 0, 0, 0 ) )
		cam.End3D2D()
	end
	
	if self:GetNWFloat("Spring") > 0 then
		cam.Start3D2D(Pos1 + (Ang1:Forward() * 48) + (Ang1:Up() * 18) + (Ang1:Right() * -35) , Ang1 - Angle(0,40,0), 0.15)
		draw.RoundedBox( 0, -100, 50, 80, 20, Color( 75, 139, 191, 255))
		draw.RoundedBox( 0, -100, 70, 80, 20, Color( 34, 34, 34, 240))
		draw.SimpleTextOutlined(self:GetNWFloat("Spring"), "Trebuchet24", -60, 67, Color(224,224,224,255 ), 1, 0, 0, Color( 0, 0, 0 ) )
		draw.SimpleTextOutlined("RESSORT", "Trebuchet24", -60, 47, Color(224,224,224,255 ), 1, 0, 0, Color( 0, 0, 0 ) )
		cam.End3D2D()
	end
	
end


function ENT:Think()
end

usermessage.Hook( "craftingmenu", function( um )
	self = um:ReadEntity()
	local wood = um:ReadLong()
	local wrench = um:ReadLong()
	local ironbar = um:ReadLong()
	local spring = um:ReadLong()
	
		local sFrame = vgui.Create("DFrame")
		sFrame:SetSize(720,300)
		sFrame:SetPos(ScrW()/2 - 270, ScrH()/2 + 200)
		sFrame:MoveTo(ScrW()/2-270,ScrH()- 650, 0.4,0,5)	
		sFrame:SetVisible(true)
		sFrame:MakePopup()
		sFrame:ShowCloseButton(false)
		sFrame:SetTitle("")
		sFrame.Paint = function()
			draw.RoundedBox( 0, 20, 0, 680, ScrH(), Color( 34, 34, 34, 210))
			draw.RoundedBox( 0, 0, 0, 800, 85, Color( 75, 139, 191, 255))
			draw.RoundedBox( 0, 8, 25, 60, 50, Color( 224, 224, 224, 255))
			draw.RoundedBox( 0, 8, 10, 60, 8, Color( 224, 224, 224, 255))
			
			texture = surface.GetTextureID("vgui/white");
			
			surface.SetTexture(texture)
		    surface.SetDrawColor(75,139,191,255)
		    surface.DrawTexturedRectRotated(65,10,10,25,-130)
//
		    surface.DrawTexturedRectRotated(65,10,10,25,-130)
		    surface.DrawTexturedRectRotated(45,43,12,20,-135)
		    surface.DrawTexturedRectRotated(35,53,30,7,45)

	
			draw.SimpleTextOutlined("TABLE DE CRAFT", "HUDNumber5", 77, 18,Color(224,224,224), TEXT_ALIGN_LEFT,0,0,Color(0,0,0))
			draw.SimpleTextOutlined("Créer, protéger, luttez...", "Trebuchet24", 163, 55,Color(224,224,224), TEXT_ALIGN_LEFT,0,0,Color(0,0,0))
			draw.RoundedBox( 0, 450, 95, 350, 32, Color( 224, 224, 224))
			--draw.SimpleTextOutlined("JOBS", "Trebuchet22", 40, 88,Color(224,224,224), TEXT_ALIGN_LEFT,0,0,Color(224,224,224))
			
			// Informations
			/*
			draw.SimpleTextOutlined( "BOIS : ".. wood, "MatFont", 430, 105, Color( 255, 255, 255 ), TEXT_ALIGN_LEFT, 0, 2, Color( 0, 0, 0 ) )
			draw.SimpleTextOutlined( "CLE : ".. wrench, "MatFont", 270, 135, Color( 255, 255, 255 ), TEXT_ALIGN_LEFT, 0, 2, Color( 0, 0, 0 ) )
			draw.SimpleTextOutlined( "BARRE DE FER : ".. ironbar, "MatFont", 270, 105, Color( 255, 255, 255 ), TEXT_ALIGN_LEFT, 0, 2, Color( 0, 0, 0 ) )
			draw.SimpleTextOutlined( "RESSORT : ".. spring, "MatFont", 430, 135, Color( 255, 255, 255 ), TEXT_ALIGN_LEFT, 0, 2, Color( 0, 0, 0 ) )
	*/
	end
		local EXIT = vgui.Create("DButton",sFrame)
		EXIT:SetPos(620, 0)
		EXIT:SetSize(100,25)
		EXIT:SetText("")
		EXIT.Paint = function()
		--draw.RoundedBox( 0, 0, 2,ScrW(), 110, Color( 30, 30, 40, 255))
		draw.RoundedBox( 0, 0, 2, ScrW(), 110, Color( 75, 139, 191, 255))
		--draw.RoundedBox( 0, 1, 1,288, 23, Color( 0, 73, 153, 255))
		draw.SimpleTextOutlined("X", "Trebuchet24", 80, 1,Color(255,255,255), TEXT_ALIGN_CENTER,0,0,Color(0,0,0))
		end
		EXIT.DoClick = function()
		sFrame:Remove()
		end

BTCreate = vgui.Create( "DButton", sFrame )
BTCreate:SetSize(150, 32.5)
BTCreate:SetPos(0,95)
BTCreate:SetText("")
BTCreate.Paint = function()
	draw.RoundedBox( 0, 0, 0, ScrW(), ScrH(), Color( 34, 34, 34))
	draw.RoundedBox( 0, 147, 0, 3, ScrH(), Color( 224, 224, 224))
	draw.SimpleTextOutlined( "CREER", "Trebuchet24",75, 3, Color( 224, 224, 224, 255), 1, 0, 0, Color( 0, 0, 0 ) )
end
BTCreate.DoClick = function()
	RemoveEmCreateButton()
	
	BTCreate2 = vgui.Create( "DButton", sFrame )
	BTCreate2:SetSize(150, 32.5)
	BTCreate2:SetPos(0,95)
	BTCreate2:SetText("")
	BTCreate2.Paint = function()
		draw.RoundedBox( 0, 0, 0, ScrW(), ScrH(), Color( 75, 139, 191, 255))
		draw.RoundedBox( 0, 147, 0, 3, ScrH(), Color( 224, 224, 224))
		draw.SimpleTextOutlined( "CREER", "Trebuchet24",75, 3, Color( 224, 224, 224, 255), 1, 0, 0, Color( 0, 0, 0 ) )
	end
	if BTCreate2 then
		CraftFrame = vgui.Create("DFrame",sFrame)
		CraftFrame:SetSize(263,126)
		CraftFrame:SetPos(35,130)
		CraftFrame:ShowCloseButton(false)
		CraftFrame:SetTitle("")
		CraftFrame.Paint = function()
			draw.SimpleTextOutlined( "RESSOURCES", "Trebuchet22",0, 3, Color( 224, 224, 224, 255), TEXT_ALIGN_LEFT, 0, 0, Color( 0, 0, 0 ) )
			draw.RoundedBox( 0, 0, 25, ScrW(), ScrH(), Color( 34, 34, 34, 240))
			//WOOD
			draw.RoundedBox( 0, 8, 38, 25, 4, Color( 183, 118, 73, 255))
			draw.RoundedBox( 0, 8, 30, 25, 4, Color( 183, 118, 73, 255))
			draw.RoundedBox( 0, 8, 34, 25, 4, Color( 163, 98, 53, 255))
			draw.RoundedBox( 0, 8, 42, 25, 4, Color( 163, 98, 53, 255))
			draw.SimpleTextOutlined( "BOIS", "Trebuchet22",40, 26, Color( 255, 255, 255 ), TEXT_ALIGN_LEFT, 0, 0, Color( 0, 0, 0 ) )
			draw.SimpleTextOutlined( self:GetNWFloat("Wood"), "Trebuchet22",245, 26, Color( 255, 255, 255 ), TEXT_ALIGN_RIGHT, 0, 0, Color( 0, 0, 0 ) )
			//IRON
			draw.RoundedBox( 0, 8, 55, 25, 16, Color( 255, 255, 255, 255))
			draw.RoundedBox( 0, 8, 55, 25, 4, Color( 174, 174, 174, 255))
			draw.RoundedBox( 0, 8, 59, 25, 12, Color( 134, 134, 134, 255))
			draw.SimpleTextOutlined( "FER", "Trebuchet22",40, 51, Color( 255, 255, 255 ), TEXT_ALIGN_LEFT, 0, 0, Color( 0, 0, 0 ) )
			draw.SimpleTextOutlined(self:GetNWFloat("Iron"), "Trebuchet22",245, 51, Color( 255, 255, 255 ), TEXT_ALIGN_RIGHT, 0, 0, Color( 0, 0, 0 ) )
			//WRENCH
			draw.RoundedBox( 0, 20, 80, 12.5, 6, Color( 174, 174, 174, 255))
			draw.RoundedBox( 0, 20, 90, 12.5, 6, Color( 174, 174, 174, 255))
			draw.RoundedBox( 0, 8, 85, 18, 6, Color( 134, 134, 134, 255))
			draw.SimpleTextOutlined( "CLE", "Trebuchet22",40, 76, Color( 255, 255, 255 ), TEXT_ALIGN_LEFT, 0, 0, Color( 0, 0, 0 ) )
			draw.SimpleTextOutlined(self:GetNWFloat("Wrench"), "Trebuchet22",245, 76, Color( 255, 255, 255 ), TEXT_ALIGN_RIGHT, 0, 0, Color( 0, 0, 0 ) )
			//SPRING
			--draw.RoundedBox( 0, 8, 105, 25, 16, Color( 255, 255, 255, 255))
			draw.RoundedBox( 0, 27, 113, 6.25, 8, Color( 174, 174, 174, 255))
			draw.RoundedBox( 0, 27-12.5, 113, 6.25, 8, Color( 174, 174, 174, 255))
			draw.RoundedBox( 0, 27-6.25, 105, 6.25, 8, Color( 114, 114, 114, 255))
			draw.RoundedBox( 0, 27-18.75, 105, 6.25, 8, Color( 114, 114, 114, 255))
			draw.SimpleTextOutlined( "RESSORT", "Trebuchet22",40, 101, Color( 255, 255, 255 ), TEXT_ALIGN_LEFT, 0, 0, Color( 0, 0, 0 ) )
			draw.SimpleTextOutlined(self:GetNWFloat("Spring"), "Trebuchet22",245, 101, Color( 255, 255, 255 ), TEXT_ALIGN_RIGHT, 0, 0, Color( 0, 0, 0 ) )
		end
			List = vgui.Create( "DComboBox", sFrame)
			List:SetPos(310,155)
			List:SetSize( 230, 32 )
			List:SetFont("Trebuchet22")
			List:SetColor(Color(224,224,224))
			List:SetValue("CRAFTER OBJETS..")
			List.Paint = function() 
				draw.RoundedBox( 0, 0, 0, ScrW(), ScrH(), Color( 34, 34, 34, 240))
				draw.RoundedBox( 0, 206, 0, 25, ScrH(), Color( 224, 224, 224))
			end
			
			for k, v in pairs( Crafting_Recipes ) do
				if v.TheName then
					List:AddChoice(v.TheName)
			end
			List.OnSelect = function( panel, index, value, data )
				net.Start("TheID")
					net.WriteString(value) 
				net.SendToServer()
				chat.AddText( Color(0,100,255), "[TABLE CRAFT]", Color(255,255,255), " To craft a "..value.." : " ..Crafting_Recipes[value].HowTo )
				end
			end	
				RealCraft = vgui.Create( "DButton", sFrame )
				RealCraft:SetSize(130, 32)
				RealCraft:SetPos(552.5,155)
				RealCraft:SetText("")
				RealCraft.Paint = function()
					draw.RoundedBox( 0, 0, 0, ScrW(), ScrH(), Color( 224, 224, 224, 255))
					--draw.RoundedBox( 0, 147, 0, 3, ScrH(), Color( 224, 224, 224))
					draw.SimpleTextOutlined( "CONSTRUIRE", "Trebuchet24",130/2, 3, Color( 34, 34, 34, 255), 1, 0, 0, Color( 0, 0, 0 ) )
				end
				RealCraft.DoClick = function()
					local RealCraftCL = vgui.Create( "DButton", sFrame )
					RealCraftCL:SetSize(130, 32)
					RealCraftCL:SetPos(552.5,155)
					RealCraftCL:SetText("")
					RealCraftCL.Paint = function()
						draw.RoundedBox( 0, 0, 0, ScrW(), ScrH(), Color( 180, 75, 75, 255))
						--draw.RoundedBox( 0, 147, 0, 3, ScrH(), Color( 224, 224, 224))
						draw.SimpleTextOutlined( "CONSTRUIRE", "Trebuchet24",130/2, 3, Color( 34, 34, 34, 255), 1, 0, 0, Color( 0, 0, 0 ) )
					end
					timer.Simple(0.1,function()
					RealCraftCL:Remove()
					end)
					timer.Simple(0.2,function()
					sFrame:Remove()
					net.Start("StartCrafting")
						net.WriteEntity(self)
					net.SendToServer()
					end)
				end
end
end
	
	local BTDestroy = vgui.Create( "DButton", sFrame )
	BTDestroy:SetSize(150, 32.5)
	BTDestroy:SetPos(150,95)
	BTDestroy:SetText("")
	BTDestroy.Paint = function()
	draw.RoundedBox( 0, 0, 0, ScrW(), ScrH(), Color( 34, 34, 34))
	draw.RoundedBox( 0, 147, 0, 3, ScrH(), Color( 224, 224, 224))
	draw.SimpleTextOutlined( "DETRUIRE", "Trebuchet24",75, 3, Color( 224, 224, 224, 255), 1, 0, 0, Color( 0, 0, 0 ) )

	end
	BTDestroy.DoClick = function()
	RemoveEmDestroyButton()
			BTDestroy2 = vgui.Create( "DButton", sFrame )
			BTDestroy2:SetSize(150, 32.5)
			BTDestroy2:SetPos(150,95)
			BTDestroy2:SetText("")
			BTDestroy2.Paint = function()
				draw.RoundedBox( 0, 0, 0, ScrW(), ScrH(),  Color( 75, 139, 191, 255))
				draw.RoundedBox( 0, 147, 0, 3, ScrH(), Color( 224, 224, 224))
				draw.SimpleTextOutlined( "DETRUIRE","Trebuchet24",75, 3, Color( 224, 224, 224, 255), 1, 0, 0, Color( 0, 0, 0 ) )
			end
			
			DestroyFrame = vgui.Create("DFrame",sFrame)
			DestroyFrame:SetSize(263,126)
			DestroyFrame:SetPos(35,130)
			DestroyFrame:ShowCloseButton(false)
			DestroyFrame:SetTitle("")
			DestroyFrame.Paint = function()
				draw.SimpleTextOutlined( "RESSOURCES", "Trebuchet22",0, 3, Color( 224, 224, 224, 255), TEXT_ALIGN_LEFT, 0, 0, Color( 0, 0, 0 ) )
				draw.RoundedBox( 0, 0, 25, ScrW(), ScrH(), Color( 34, 34, 34, 240))
				//WOOD
				draw.RoundedBox( 0, 8, 38, 25, 4, Color( 183, 118, 73, 255))
				draw.RoundedBox( 0, 8, 30, 25, 4, Color( 183, 118, 73, 255))
				draw.RoundedBox( 0, 8, 34, 25, 4, Color( 163, 98, 53, 255))
				draw.RoundedBox( 0, 8, 42, 25, 4, Color( 163, 98, 53, 255))
				draw.SimpleTextOutlined( "BOIS", "Trebuchet22",40, 26, Color( 255, 255, 255 ), TEXT_ALIGN_LEFT, 0, 0, Color( 0, 0, 0 ) )
				draw.SimpleTextOutlined(self:GetNWFloat("Wood"), "Trebuchet22",245, 26, Color( 255, 255, 255 ), TEXT_ALIGN_RIGHT, 0, 0, Color( 0, 0, 0 ) )
				//IRON
				draw.RoundedBox( 0, 8, 55, 25, 16, Color( 255, 255, 255, 255))
				draw.RoundedBox( 0, 8, 55, 25, 4, Color( 174, 174, 174, 255))
				draw.RoundedBox( 0, 8, 59, 25, 12, Color( 134, 134, 134, 255))
				draw.SimpleTextOutlined( "FER", "Trebuchet22",40, 51, Color( 255, 255, 255 ), TEXT_ALIGN_LEFT, 0, 0, Color( 0, 0, 0 ) )
				draw.SimpleTextOutlined(self:GetNWFloat("Iron"), "Trebuchet22",245, 51, Color( 255, 255, 255 ), TEXT_ALIGN_RIGHT, 0, 0, Color( 0, 0, 0 ) )
				//WRENCH
				draw.RoundedBox( 0, 20, 80, 12.5, 6, Color( 174, 174, 174, 255))
				draw.RoundedBox( 0, 20, 90, 12.5, 6, Color( 174, 174, 174, 255))
				draw.RoundedBox( 0, 8, 85, 18, 6, Color( 134, 134, 134, 255))
				draw.SimpleTextOutlined( "CLE", "Trebuchet22",40, 76, Color( 255, 255, 255 ), TEXT_ALIGN_LEFT, 0, 0, Color( 0, 0, 0 ) )
				draw.SimpleTextOutlined(self:GetNWFloat("Wrench"), "Trebuchet22",245, 76, Color( 255, 255, 255 ), TEXT_ALIGN_RIGHT, 0, 0, Color( 0, 0, 0 ) )
				//SPRING
				--draw.RoundedBox( 0, 8, 105, 25, 16, Color( 255, 255, 255, 255))
				draw.RoundedBox( 0, 27, 113, 6.25, 8, Color( 174, 174, 174, 255))
				draw.RoundedBox( 0, 27-12.5, 113, 6.25, 8, Color( 174, 174, 174, 255))
				draw.RoundedBox( 0, 27-6.25, 105, 6.25, 8, Color( 114, 114, 114, 255))
				draw.RoundedBox( 0, 27-18.75, 105, 6.25, 8, Color( 114, 114, 114, 255))
				draw.SimpleTextOutlined( "RESSORT", "Trebuchet22",40, 101, Color( 255, 255, 255 ), TEXT_ALIGN_LEFT, 0, 0, Color( 0, 0, 0 ) )
				draw.SimpleTextOutlined(self:GetNWFloat("Spring"), "Trebuchet22",245, 101, Color( 255, 255, 255 ), TEXT_ALIGN_RIGHT, 0, 0, Color( 0, 0, 0 ) )
			end
				DestroyMatW = vgui.Create( "DButton", sFrame )
				DestroyMatW:SetSize(30, 20)
				DestroyMatW:SetPos(310,155)
				DestroyMatW:SetText("")
				DestroyMatW.Paint = function()
					draw.RoundedBox( 0, 0, 0, ScrW(), ScrH(),  Color( 224, 224, 224, 255))
					draw.SimpleTextOutlined( "-1", "Trebuchet24",13, -1, Color( 34, 34, 34, 255), 1, 0, 0, Color( 0, 0, 0 ) )
				end
				DestroyMatW.DoClick = function()
					
					local ColorButtonW = vgui.Create( "DButton", sFrame )
					ColorButtonW:SetSize(30, 20)
					ColorButtonW:SetPos(310,155)
					ColorButtonW:SetText("")
					ColorButtonW.Paint = function()
						draw.RoundedBox( 0, 0, 0, ScrW(), ScrH(),  Color( 180, 75, 75, 255))
						draw.SimpleTextOutlined( "-1", "Trebuchet24",13, -1, Color( 34, 34, 34, 255), 1, 0, 0, Color( 0, 0, 0 ) )
					end
					timer.Simple(0.1,function()
					ColorButtonW:Remove()
					end)
		
					net.Start("Minus1Wood")
					net.WriteEntity(self)
					net.SendToServer()
				end
				
				DestroyMatI = vgui.Create( "DButton", sFrame )
				DestroyMatI:SetSize(30, 20)
				DestroyMatI:SetPos(310,182)
				DestroyMatI:SetText("")
				DestroyMatI.Paint = function()
					draw.RoundedBox( 0, 0, 0, ScrW(), ScrH(),  Color( 224, 224, 224, 255))
					draw.SimpleTextOutlined( "-1", "Trebuchet24",13, -1, Color( 34, 34, 34, 255), 1, 0, 0, Color( 0, 0, 0 ) )
				end
				DestroyMatI.DoClick = function()
					local ColorButtonI = vgui.Create( "DButton", sFrame )
					ColorButtonI:SetSize(30, 20)
					ColorButtonI:SetPos(310,182)
					ColorButtonI:SetText("")
					ColorButtonI.Paint = function()
						draw.RoundedBox( 0, 0, 0, ScrW(), ScrH(),  Color( 180, 75, 75, 255))
						draw.SimpleTextOutlined( "-1", "Trebuchet24",13, -1, Color( 34, 34, 34, 255), 1, 0, 0, Color( 0, 0, 0 ) )
					end
					timer.Simple(0.1,function()
					ColorButtonI:Remove()
					end)
					net.Start("Minus1Iron")
					net.WriteEntity(self)
					net.SendToServer()
				end
				
				DestroyMatWR = vgui.Create( "DButton", sFrame )
				DestroyMatWR:SetSize(30, 20)
				DestroyMatWR:SetPos(310,182+27)
				DestroyMatWR:SetText("")
				DestroyMatWR.Paint = function()
					draw.RoundedBox( 0, 0, 0, ScrW(), ScrH(),  Color( 224, 224, 224, 255))
					draw.SimpleTextOutlined( "-1", "Trebuchet24",13, -1, Color( 34, 34, 34, 255), 1, 0, 0, Color( 0, 0, 0 ) )
				end
				DestroyMatWR.DoClick = function()
					local ColorButtonWR = vgui.Create( "DButton", sFrame )
					ColorButtonWR:SetSize(30, 20)
					ColorButtonWR:SetPos(310,182+27)
					ColorButtonWR:SetText("")
					ColorButtonWR.Paint = function()
						draw.RoundedBox( 0, 0, 0, ScrW(), ScrH(),  Color( 180, 75, 75, 255))
						draw.SimpleTextOutlined( "-1", "Trebuchet24",13, -1, Color( 34, 34, 34, 255), 1, 0, 0, Color( 0, 0, 0 ) )
					end
					timer.Simple(0.1,function()
					ColorButtonWR:Remove()
					end)
					net.Start("Minus1Wrench")
					net.WriteEntity(self)
					net.SendToServer()
				end
				
				DestroyMatS = vgui.Create( "DButton", sFrame )
				DestroyMatS:SetSize(30, 20)
				DestroyMatS:SetPos(310,182+54)
				DestroyMatS:SetText("")
				DestroyMatS.Paint = function()
					draw.RoundedBox( 0, 0, 0, ScrW(), ScrH(),  Color( 224, 224, 224, 255))
					draw.SimpleTextOutlined( "-1", "Trebuchet24",13, -1, Color( 34, 34, 34, 255), 1, 0, 0, Color( 0, 0, 0 ) )
				end
				DestroyMatS.DoClick = function()
					local ColorButtonS = vgui.Create( "DButton", sFrame )
					ColorButtonS:SetSize(30, 20)
					ColorButtonS:SetPos(310,182+54)
					ColorButtonS:SetText("")
					ColorButtonS.Paint = function()
						draw.RoundedBox( 0, 0, 0, ScrW(), ScrH(),  Color( 180, 75, 75, 255))
						draw.SimpleTextOutlined( "-1", "Trebuchet24",13, -1, Color( 34, 34, 34, 255), 1, 0, 0, Color( 0, 0, 0 ) )
					end
					timer.Simple(0.1,function()
					ColorButtonS:Remove()
					end)
					net.Start("Minus1Spring")
					net.WriteEntity(self)
					net.SendToServer()
				end
				
			KillTable = vgui.Create( "DButton", sFrame )
			KillTable:SetSize(150, 32.5)
			KillTable:SetPos(350,155)
			KillTable:SetText("")
			KillTable.Paint = function()
				draw.RoundedBox( 0, 0, 0, ScrW(), ScrH(), Color( 224, 224, 224))
				draw.SimpleTextOutlined( "DETRUIRE TABLE", "Trebuchet24",75, 3, Color( 34, 34, 34, 255), 1, 0, 0, Color( 0, 0, 0 ) )
			end
			KillTable.DoClick = function()
			local KillTableCL = vgui.Create( "DButton", sFrame )
			KillTableCL:SetSize(150, 32.5)
			KillTableCL:SetPos(350,155)
			KillTableCL:SetText("")
			KillTableCL.Paint = function()
				draw.RoundedBox( 0, 0, 0, ScrW(), ScrH(), Color( 180, 75, 75))
				draw.SimpleTextOutlined( "DETRUIRE TABLE", "Trebuchet24",75, 3, Color( 34, 34, 34, 255), 1, 0, 0, Color( 0, 0, 0 ) )
			end
			timer.Simple(0.1,function()
				KillTableCL:Remove()
			end)
			timer.Simple(0.2,function()
			sFrame:Remove()
			net.Start("DestroyTable")
			net.WriteEntity(self)
			net.SendToServer()
			end)
			end
			
			KillMats = vgui.Create( "DButton", sFrame )
			KillMats:SetSize(150, 32.5)
			KillMats:SetPos(350,160 + 32.5)
			KillMats:SetText("")
			KillMats.Paint = function()
				draw.RoundedBox( 0, 0, 0, ScrW(), ScrH(), Color( 224, 224, 224))
				draw.SimpleTextOutlined( "DETRUIRE RES", "Trebuchet24",75, 5, Color( 34, 34, 34, 255), 1, 0, 0, Color( 0, 0, 0 ) )
			end
			KillMats.DoClick = function()
			local KillMatsCL = vgui.Create( "DButton", sFrame )
			KillMatsCL:SetSize(150, 32.5)
			KillMatsCL:SetPos(350,160 + 32.5)
			KillMatsCL:SetText("")
			KillMatsCL.Paint = function()
				draw.RoundedBox( 0, 0, 0, ScrW(), ScrH(), Color( 180, 75, 75))
				draw.SimpleTextOutlined( "DETRUIRE RES", "Trebuchet24",75, 5, Color( 34, 34, 34, 255), 1, 0, 0, Color( 0, 0, 0 ) )
			end
			timer.Simple(0.1,function()
				KillMatsCL:Remove()
			end)
			timer.Simple(0.2,function()
				net.Start("KillMats")
				net.WriteEntity(self)
				net.SendToServer()
			end)
			end
	end
	
	local BTOther = vgui.Create( "DButton", sFrame )
	BTOther:SetSize(150, 32.5)
	BTOther:SetPos(150+150,95)
	BTOther:SetText("")
	BTOther.Paint = function()
	draw.RoundedBox( 0, 0, 0, ScrW(), ScrH(), Color( 34, 34, 34))
	draw.RoundedBox( 0, 147, 0, 3, ScrH(), Color( 224, 224, 224))
	draw.SimpleTextOutlined( "AUTRE", "Trebuchet24",75, 3, Color( 224, 224, 224, 255), 1, 0, 0, Color( 0, 0, 0 ) )
	end

	BTOther.DoClick = function()
	RemoveEmOtherButton()
		BTOther2 = vgui.Create( "DButton", sFrame )
		BTOther2:SetSize(150, 32.5)
		BTOther2:SetPos(150+150,95)
		BTOther2:SetText("")
		BTOther2.Paint = function()
		draw.RoundedBox( 0, 0, 0, ScrW(), ScrH(), Color( 75, 139, 191, 255))
		draw.RoundedBox( 0, 147, 0, 3, ScrH(), Color( 224, 224, 224))
		draw.SimpleTextOutlined( "AUTRE", "Trebuchet24",75, 3, Color( 224, 224, 224, 255), 1, 0, 0, Color( 0, 0, 0 ) )
		end
		OtherFrame = vgui.Create("DFrame",sFrame)
		OtherFrame:SetSize(650,150)
		OtherFrame:SetPos(35,130)
		OtherFrame:ShowCloseButton(false)
		OtherFrame:SetTitle("")
		OtherFrame.Paint = function() 
			draw.RoundedBox( 0, 0, 10, ScrW(), ScrH(), Color( 34, 34, 34, 240))
			draw.SimpleTextOutlined( "GUIDE DE CRAFT", "Trebuchet24",10, 15, Color( 224, 224, 224, 255), TEXT_ALIGN_LEFT, 0, 0, Color( 0, 0, 0 ) )
		end
		Description = vgui.Create("DLabel", sFrame)
		Description:SetPos(60,160)
		Description:SetSize(600, 120)
		Description:SetFont("Trebuchet22")
		Description:SetColor(Color(224,224,224))
		Description:SetWrap(true)
		Description:SetText("Start by going under the tab 'CREATE' press the drop down menu. Some options of crafting possibilities will show up, now select one, once you did that the materials needed will be displayed in the chat. Now you will find the materials, and place them onto the table. Then hit the 'CONSTRUCT' Button!")
	end
end)

function RemoveEmDestroyButton()
	if BTCreate2 then
		BTCreate2:Remove()
		CraftFrame:Remove()
		RealCraft:Remove()
		List:Remove()
	end
	if BTOther2 then
		BTOther2:Remove()
		OtherFrame:Remove()
		Description:Remove()
	end
end

function RemoveEmOtherButton()
	if BTCreate2 then
		BTCreate2:Remove()
		CraftFrame:Remove()
		RealCraft:Remove()
		List:Remove()
	end
	if BTDestroy2 then
		BTDestroy2:Remove()
		DestroyFrame:Remove()
		DestroyMatW:Remove()
		DestroyMatI:Remove()
		DestroyMatWR:Remove()
		DestroyMatS:Remove()
		KillTable:Remove()
		KillMats:Remove()
	end
end

function RemoveEmCreateButton()
	if BTDestroy2 then
		BTDestroy2:Remove()
		DestroyFrame:Remove()
		DestroyMatW:Remove()
		DestroyMatI:Remove()
		DestroyMatWR:Remove()
		DestroyMatS:Remove()
		KillTable:Remove()
		KillMats:Remove()
	end
	
	if BTOther2 then
		BTOther2:Remove()
		OtherFrame:Remove()
		Description:Remove()
	end
end

