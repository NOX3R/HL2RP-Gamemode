itemstore.Menu = nil

hook.Add( "ContextMenuCreated", "ItemStoreInventory", function( context )
	if ( IsValid( context ) ) then -- somehow people manage to delete the contextmenu, i don't know how
		if ( itemstore.config.ContextOpensInventory ) then
			itemstore.Menu = itemstore.containers.Open( 0, "Inventory", 0, 0 )
			itemstore.Menu:SetParent( context )
			itemstore.Menu:ShowCloseButton( false )
			itemstore.Menu:SetDraggable( false )
		end
		
		context:Receiver( "ItemStore", function( receiver, droppable, dropped )
			if ( dropped ) then
				RunConsoleCommand( "itemstore_drop", droppable[ 1 ]:GetContainerID(), droppable[ 1 ]:GetSlot() )
			end
		end )
	end
end )