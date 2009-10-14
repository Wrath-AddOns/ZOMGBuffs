local L = LibStub("AceLocale-2.2"):new("ZOMGBuffTehRaid")

L:RegisterTranslations("frFR", function() return
--@debug@
{
	["Group Buff Configuration"]					= "Configuration des buffs de groupe",
	["Anchor"]										= "Ancrage",
	["Invert"]										= "Inversion",
	["Invert the need/got alpha values"]			= "Intervertie les valeurs de transaprence de besoins/a",
	["%s needs %s"]									= "%s a besoin de %s",
	["Group %d needs %s"]							= "Le groupe %d a besoin de %s",
	["Templates"]									= "Modèles",
	["Template configuration"]						= "Configuration du modèle",
	["Group Spells"]								= "Sorts de groupe",
	["Group spell configuration"]					= "Configuration des sorts de groupe",
	["Groups"]										= "Groupes",
	["Select the groups to buff"]					= "Sélectionner les groupes a buffer",
	["Group %d"]									= "Groupe %d",
	["Enable buffing of this group"]				= "Activer les prise en charge de ce groupe",
	["Group Template: "]							= "Modèle de groupe :",
	["(modified)"]									= "(modifié)",
	["none"]										= "aucun",
	["Enabled"]										= "Actif",
	["Disabled"]									= "Inactif",
	["Behaviour"]									= "Comportement",
	["Group buffing behaviour"]						= "Comportement pour les buffs de groupe",
	["Expiry Prelude"]								= "Prévention de l'expiration",
	["Default rebuff prelude for all group buffs"]	= "Rebuff préventif par défaut pour les buffs de groupe",
	["Rebuff prelude for %s (0=Module default)"]	= "Rebuff préventif pour %s (0=valeur par défaut)",
	["Mark"]										= "Marque",
	["Minimum Group"]								= "Minimum pour un groupe",
	["How many players of a group must need a buff before the group version is cast"] = "Nombre de joueur minimum d'un groupe nécessitant un buff avant de lancer un buff de groupe",
	["%s on %s%s"]									= "%s sur %s%s",
	["%s on %s"]									= "%s on %s",
	["Auto-Assign"]									= "Assignation automatique",
	["Auto assign sensible group assignment based the order of your name alphabilically compared to others of your class. All going well, and all using ZOMGBuffs and everyone should end up with different assignments without need for discussion"] = "Assignation automatique de manière sensée, basé sur le classement alphabétique des membres de votre classe.Si tout va bien et que tout le monde utilise ZOMGBuffs, chacun devrait recevoir un assignement différent et unique sans besoin de discussion",
	["You are now responsible for Groups %s"]		= "Vous êtes maintenant responsable des buffs du groupe %s",
	[" and "]										= " et ",
	["Warning: %s has auto-assigned themselves to buff groups %s, but you have the Auto Group Assignment option disabled"] = "Attention : %s ont été auto-assigné pour buffer les groupes %s, cependant vous n'avez pas activez l'option d'auto-assignement",
}
--@end-debug@
--@localization(locale="frFR", format="lua_table", namespace="ZOMGBuffTehRaid", handle-unlocalized="ignore")@
end)
