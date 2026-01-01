-- Generated APIDefinitions for namespace: C_ZoneAbility
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_ZoneAbility.GetZoneAbilityIcon"] = {
	key = "C_ZoneAbility.GetZoneAbilityIcon",
	name = "GetZoneAbilityIcon",
	category = "combat_midnight",
	subcategory = "c_zoneability",
	func = _G["C_ZoneAbility"] and _G["C_ZoneAbility"]["GetZoneAbilityIcon"],
	funcPath = "C_ZoneAbility.GetZoneAbilityIcon",
	params = { { name = "zoneAbilitySpellID", type = "number", default = nil } },
	returns = { { name = "zoneAbilityIconID", type = "number", canBeSecret = false } },
	midnightImpact = "RESTRICTED",
	protected = true,
	midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}
