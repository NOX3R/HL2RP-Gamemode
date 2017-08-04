local PANEL = {}

AccessorFunc( PANEL, "Item", "Item" )
AccessorFunc( PANEL, "ContainerID", "ContainerID" )
AccessorFunc( PANEL, "Slot", "Slot" )

function PANEL:Init()
	self.BaseClass.Init( self )

	self.Amount = vgui.Create( "DLabel", self )
	self.Amount:SetFont( "Default" )
	self.Amount:SetText( "" )
	self.Amount:SetContentAlignment( 9 )
	self.Amount:Dock( FILL )

	self.ExtraInfo = vgui.Create( "DLabel", self )
	self.ExtraInfo:SetFont( "Default" )
	self.ExtraInfo:SetText( "" )
	self.ExtraInfo:SetContentAlignment( 1 )
	self.ExtraInfo:Dock( FILL )

	self:Receiver( "ItemStore", function( receiver, droppable, dropped )
		if ( dropped ) then
			local dest = receiver:GetContainerID()
			local destslot = receiver:GetSlot()
			local destitem = receiver.Item
			local source = droppable[ 1 ]:GetContainerID()
			local sourceslot = droppable[ 1 ]:GetSlot()
			local sourceitem = droppable[ 1 ].Item

			if ( destitem and sourceitem and destitem ~= sourceitem and destitem:Run( "CanMerge", sourceitem ) and sourceitem:Run( "CanMerge", destitem ) ) then
				local menu = DermaMenu()
				menu:AddOption( "Swap", function() RunConsoleCommand( "itemstore_swap", source, sourceslot, dest, destslot ) end ):SetIcon( "icon16/arrow_switch.png" )
				menu:AddOption( "Merge", function() RunConsoleCommand( "itemstore_merge", source, sourceslot, dest, destslot ) end ):SetIcon( "icon16/arrow_join.png" )
				menu:Open()
			else
				RunConsoleCommand( "itemstore_swap", source, sourceslot, dest, destslot )
			end
		end
	end )

	self:Droppable( "ItemStore" )
end

function PANEL:Paint( w, h )
	surface.SetDrawColor( self.Hovered and itemstore.config.Colours.HoveredSlot or itemstore.config.Colours.Slot )
	surface.DrawRect( 0, 0, w, h )

	surface.SetDrawColor( Color( 0, 0, 0, 150 ) )
	surface.DrawOutlinedRect( 0, 0, w, h )

	self.BaseClass.Paint( self, w, h )
end

function PANEL:PerformLayout()
	local item = self:GetItem()

	if ( item ) then
		local name = item:GetName()
		if ( not name ) then
			print( "ITEMSTORE ERROR: " .. item.UniqueName .. " returned nil for name" )
			name = "Invalid Name"
		end

		local desc = item:GetDescription()
		if ( not desc ) then
			print( "ITEMSTORE ERROR: " .. item.UniqueName .. " returned nil for description" )
			desc = "Invalid Description"
		end

		self:SetTooltip( name .. "\n" .. desc )
		self:SetModel( item:GetModel() )

		min, max = self.Entity:GetRenderBounds()

		self:SetCamPos( Vector( 0.5, 0.5, 0.5 ) * min:Distance( max ) )
		self:SetLookAt( ( min + max ) / 2 )

		item:Run( "ModifyEntity", self:GetEntity() )
		self:SetColor( self.Entity:GetColor() )

		local extrainfo = item:GetData( "ExtraInfo" )
		if ( extrainfo ) then
			self.ExtraInfo:SetText( extrainfo )
		end

		local amount = item:GetData( "Amount" )
		if ( amount ) then
			self.Amount:SetText( amount > 1 and amount or "" )
		end
	else
		self:SetTooltip( nil )
		self.Entity = nil

		self.Amount:SetText( "" )
		self.ExtraInfo:SetText( "" )
	end
end

function PANEL:DoClick()
	local item = self:GetItem()

	if ( item ) then
		local menu = DermaMenu()

		if ( item.Use ) then
			menu:AddOption( "Use", function() RunConsoleCommand( "itemstore_use", self:GetContainerID(), self:GetSlot() ) end ):SetIcon( "icon16/wrench.png" )
			menu:AddSpacer()
		end

		menu:AddOption( "Drop", function() RunConsoleCommand( "itemstore_drop", self:GetContainerID(), self:GetSlot() ) end ):SetIcon( "icon16/arrow_out.png" )
		menu:AddOption( "Destroy", function() Derma_Query( "Are you sure you want to destroy this item?", "Confirmation", "Yes", function() RunConsoleCommand( "itemstore_destroy", self:GetContainerID(), self:GetSlot() ) end, "Cancel" ) end ):SetIcon( "icon16/delete.png" )

		if ( item:Run( "CanSplit", 1 ) ) then
			menu:AddSpacer()

			local submenu, entry = menu:AddSubMenu( "Split" )
			entry:SetIcon( "icon16/arrow_divide.png" )

			for _, amount in ipairs( { 1, 2, 5, 10, 50, 100, 250, 1000 } ) do
				if ( item:Run( "CanSplit", amount ) ) then
					submenu:AddOption( amount, function()
						RunConsoleCommand( "itemstore_split", self:GetContainerID(), self:GetSlot(), amount )
					end )
				end
			end

			submenu:AddSpacer()

			local half = math.floor( ( item:GetData( "Amount" ) or 1 ) / 2 )
			if ( item:Run( "CanSplit", half ) ) then
				submenu:AddOption( "Half (" .. half .. ")", function()
					RunConsoleCommand( "itemstore_split", self:GetContainerID(), self:GetSlot(), half )
				end )
			end
		end

		item:Run( "PopulateMenu", menu )

		menu:Open()
	end
end

vgui.Register( "ItemStoreSlot", PANEL, "DModelPanel" )
