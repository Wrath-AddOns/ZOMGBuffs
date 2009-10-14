local L = LibStub("AceLocale-2.2"):new("ZOMGSelfBuffs")

L:RegisterTranslations("frFR", function() return
--@debug@
{
	["Self Buff Configuration"] = "Configuration des buffs personnel",
	["Self"] = "personnel",
	["Templates"] = "Modèles",
	["Template configuration"] = "Configuration du modèle",
	["Class Spells"] = "Sorts de classe",
	["Class spell configuration"] = "Configuration des sorts de classe",
	["Items"] = "Objets",
	["Item configuration"] = "Configurations des objets",
	["Main Hand"] = "Main principale",
	["Use this item or spell on the main hand weapon"] = "Utiliser cet objet ou sort sur l'arme en main principale",
	["Off Hand"] = "Main secondaire",
	["Use this item or spell on the off hand weapon"] = "Utiliser cet objet ou sort sur l'arme en main secondaire",
	["You need |cFFFFFF80%s|r"] = "Vous avez besoin de |cFFFFFF80%s|r",
	["You need %s"] = "Vous avez besoin de %s",
	["You need |c0080FF80%s|r on |c00FFFF80%s|r"] = "Vous avez besoin de |c0080FF80%s|r sur |c00FFFF80%s|r",
	["You need %s on |c00FFFF80%s|r"] = "Vous avez besoin de %s sur |c00FFFF80%s|r",
	["You need %s on %s"] = "Vous avez besoin de %s sur %s",
	["Tracking"] = "Pistage",
	["Tracking configuration"] = "Configuration du pistage",
	["Behaviour"] = "Comportement",
	["Self buffing behaviour"] = "Comportement des buffs personnels",
	["Auto buffs"] = "Buffs automatique",
	["Use auto-intelligent buffs such as Crusader Aura when mounted"] = "Utiliser les buffs automatique de manière sensé comme l'aura du croisé quand vous êtes sur une monture",
	["Self Buffs Template: "] = "Modèle de buff personnel :",
	["(modified)"] = "(modifié)",
	["none"] = "aucun",
	["Main Hand"] = "Main principale",
	["Off Hand"] = "Main secondaire",
	["Seals"] = "Sceau",				-- Generic Paladin 'Seal of ' description
	["Expiry Prelude"] = "Prévention de l'expiration",
	["Rebuff prelude for %s (0=Module default)"] = "Rebuff préventif pour %s (0=valeur par défaut)",
	["Default"] = "Défaut",
	["Default rebuff prelude for all self buffs"] = "Rebuff préventif par défaut pour tous les buffs personnels",
	["Warning: |cFF%s%s|r already applied by another %s"] = "Attention : |cFF%s%s|r déjà appliqué par un autre %s",
	["Combat Warnings"] = "Alertes en combat",
	["Warn about expiring buffs in combat. Note that auto buffing cannot be done in combat, this is simply a reminder"] = "Avertissement des buffs expirants en combat. Notez que les buffs ne peuvent pas être lancés automatquement en combat, il s'agit simplement d'un pense bête",
	["%s, %s%d|r %s remain"] = "%s, %s%d|r %s restant",
}
--@end-debug@
--@localization(locale="frFR", format="lua_table", namespace="ZOMGSelfBuffs", handle-unlocalized="ignore")@
end)
