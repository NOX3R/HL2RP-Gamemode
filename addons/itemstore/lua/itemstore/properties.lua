properties.Add( "ItemStorePickup", {
	MenuLabel = "Pickup",
	MenuIcon = "icon16/arrow_in.png",
	Order = 100000,
	
	Filter = function( self, ent, pl )
		return pl:GetShootPos():Distance( ent:GetPos() ) < itemstore.config.PickupDistance and itemstore.items.CanPickup( ent:GetClass() )
	end,
	
	Action = function( self, ent )
		RunConsoleCommand( "itemstore_pickup", ent:EntIndex() )
	end
} )