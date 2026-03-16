Citizen.CreateThread(function()
	interiorID = GetInteriorAtCoords(2725.19900000,3487.38700000,57.70855000)
	if IsValidInterior(interiorID) then
		EnableInteriorProp(interiorID, "maiquel_coloredobject")
		SetInteriorPropColor(interiorID, "maiquel_coloredobject", ConfigK.ObjectsColor)
		if ConfigK.Reflective then
			EnableInteriorProp(interiorID, "maiquel_mtool_rfltv")
		else
			DisableInteriorProp(interiorID, "maiquel_mtool_rfltv")
		end
		if ConfigK.Mural then
			EnableInteriorProp(interiorID, "maiquel_mtool_gft")
		else
			DisableInteriorProp(interiorID, "maiquel_mtool_gft")
		end
		if ConfigK.CabinetsLight then
			EnableInteriorProp(interiorID, "maiquel_mtool_lon")
		else
			DisableInteriorProp(interiorID, "maiquel_mtool_lon")
		end
		if ConfigK.ReflectiveHall then
			EnableInteriorProp(interiorID, "maiquel_mtool_rfltvh")
		else
			DisableInteriorProp(interiorID, "maiquel_mtool_rfltvh")
		end
		if ConfigK.WallObjects then
			EnableInteriorProp(interiorID, "maiquel_wallobjects")
		else
			DisableInteriorProp(interiorID, "maiquel_wallobjects")
		end
		SetInteriorPropColor(interiorID, "maiquel_wallobjects", ConfigK.ObjectsColor)
		if ConfigK.Postlift then
			EnableInteriorProp(interiorID, "maiquel_postlift")
		else
			DisableInteriorProp(interiorID, "maiquel_postlift")
		end
		SetInteriorPropColor(interiorID, "maiquel_postlift", ConfigK.ObjectsColor)
		RefreshInterior(interiorID)
	end

	interiorID = GetInteriorAtCoords(2729.483, 3511.036, 62.438)
	if IsValidInterior(interiorID) then
		if ConfigK.HeliReflective then
			EnableInteriorProp(interiorID, "maiquel_heliarea_ref")
		else
			DisableInteriorProp(interiorID, "maiquel_heliarea_ref")
		end
		RefreshInterior(interiorID)
	end
end)