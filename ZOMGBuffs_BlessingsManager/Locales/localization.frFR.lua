local L = LibStub("AceLocale-2.2"):new("ZOMGBlessingsManager")

L:RegisterTranslations("frFR", function() return
--@debug@
{
	["TITLE"] =  "|cFFFF8080Z|cFFFFFF80O|cFF80FF80M|cFF8080FFG|cFFFFFFFF Gestionnaire de bénédiction|r",
	["TITLE_CONFIGURE"] = "|cFFFF8080Z|cFFFFFF80O|cFF80FF80M|cFF8080FFG|cFFFFFFFF Gestionnaire de bénédiction |cFF808080(configuration)|r",
	["SPLITTITLE"] = "Sous-classes",
	["Manager"] = "Gestionnaire",
	["Blessings Manager configuration"] = "Configuration du Gestionnaire de bénédiction",
	["Open"] = "Ouvrir",
	["Open Blessings Manager"] = "Ouvrir le Gestionnaire de bénédiction",
	["Send"] = "Envoyer",
	["Send options"] = "Options d'envoie",
	["Template"] = "Modèle",
	["Send Blessings Manager master template to another player"] = "Envoie le modèle référence du Gestionnaire de bénédiction à un autre joueur",
	["<player name>"] = "<nom du joueur>",
	["Sub-Class Assignments"] = "Assignation des sous-classes",
	["Send Blessings Manager sub-class assignments"] = "Envoie au Gestionnaire de bénédiction les assignations des sous-classes",
	["Blessings Manager master template received from %s. Stored in local templates as |cFFFFFF80%s|r"] = "Modèle référence du Gestionnaire de bénédiction reçu de %s. Stocker en modèle locale comme |cFFFFFF80%s|r",
	["Player sub-class assignments received from %s"] = "Assignation des joueurs en sous-classes reçu de %s",
	["Templates"] = "Modèles",
	["Template configuration"] = "Configuration du modèle",
	["Cleanup"] = "Nettoyage",
	["Cleanup options"] = "Options de nettoyage",
	["Non-Guildies"] = "Hors guilde",
	["Strip non-guildies from the stored sub-class definitions"] = "Retire les joueurs hors guilde de l'assignation aux sous classes",
	["Non-Raid Members"] = "Membres hors raid",
	["Strip non-existant raid members from the stored sub-class definitions"] = "Retire les joueurs non présent dans le raid de l'assignation aux sous classes",
	["Cleaned %d players from the stored sub-class list"] = "A retiré %d joueurs de la liste des sous clasess",
	["Default"] = "Défaut",
	["Finish"] = "Terminer",
	["Finish configuring template"] = "Termine la configuration du modèle",
	["Configure"] = "Configurer",
	["Configure the automatic template generation"] = "Configure la génération automatique de modèle",
	["Generate"] = "Générer",
	["Generate automatic templates from manager's main template. This will broadcast new templates to all paladins, so only use at start of raid to set initial configuration. Changes made later by individual paladins will be reflected in the blessings grid."] = "Genère automatiquement les modèles à partir du modèle référence du gestionnaire. Ceci diffusera les nouveau modèles à tous les paladins, à n'utiliser qu'en début de raid. Tout changement fait individuellement par les paladins sera visible dans la grille des bénédictions",
	["Broadcast"] = "Diffuser",
	["Broadcast these templates to all paladins (Simply a refresh)"] = "Diffuse ces modèles à tous les paladins (simple rafraîchissmeent)",
	["Click to scale window"] = "Cliquer pour changer l'echelle de la fenêtre",
	["Alt-Click to size window"] = "Alt-clique pour changer la taille de la fenêtre",
	["Exceptions"] = "Exceptions",
	["Unit exceptions"] = "Exceptions d'unité",
	["Single target exception for %s"] = "Exception de cible unique pour %s",
	["None"] = "Aucun",
	["Clear"] = "Vider",
	["Remove all exceptions for this cell"] = "Efface toutes les exceptions pour cette cellule",
	["Warning: Couldn't assign row %d exception of %s for %s to anyone"] = "Attention : Il est impossible d'assigner à quelqu'un la ligne %d d'exception de %s pour %s",
	["Clear All"] = "Vider tout",
	["Clear all single buff exceptions"] = "Efface tout les exceptions de buff simple",
	["Autosave"] = "Sauvegarde automatique",
	["%s %s, Please use these buff settings:"] = "%s %s, Merci d'utiliser cette configuartion de buffs :",
	["%s And these single buffs afterwards:"] = "%s Puis ces buffs unitaires :",
	["Help"] = "Aide",
	["What the hell am I looking at?"] = "Qu'est ce que je suis en train de faire...?",
	["Tank"] = "Tank",
	["Melee DPS"] = "DPS cac",
	["Caster DPS"] = "DPS distant",
	["Healer"] = "Soin",
	["Display"] = "Afficher",
	["Display configuration"] = "Affiche la configuration",
	["Highlights"] = "Surlignements",
	["Highlight the selected row and column in the manager"] = "Surligne les colonnes et lignes sélectionnées dans le gestionnaire",
	["Auto-Open Class Split"] = "Déploiement automatique des sous-classes",
	["Automatically open the class split frame when defining the sub-class buff assignments"] = "Déploie automatiquement la fenêtre de séparation de classe lors de la configuration des buffs pour les sous-classes",
	["Auto Assign"] = "Répartir auto.",
	["Automatically assign players to sub-classes based on talent spec"] = "Assigne automatiquement les joueurs aux sous-classes en se basant sur leurs talents",
	["Chat Interface"] = "Interface de discussion",
	["Chat interface configuration"] = "Configuration de l'interface de discussion",
	["Remote Buff Requests"] = "Requête distante de buff",
	["Allow remote buff requests via the !zomg whisper command"] = "Autorise les requêtes distante de buff par la commande en chuchotement !zomg",
	["Behaviour"] = "Comportement",
	["Other behaviour"] = "Comportement divers",
	["Whispers"] = "Chuchotements",
	["Send assignments to paladins without ZOMGBuffs or PallyPower via whispers?"] = "Envoyer les assignations de buffs aux paladins sans ZOMGBuffs ou PallyPower via les chuchotements ?",
	["Unlock"] = "Dévéruiller",
	["Unlock undetected mod users for editing"] = "Dévérouille les utilisateurs sans addons détecté pour édition",
	["%s Your Paladin buffs come from:"] = "%s votre buffs Paladin vient de :",
	["%s Could not interpret %s"] = "%s ne comprends pas %s",
	["%s Assigned %s to %s"] = "%s assigné de %s à %s",
	["%s You don't get %s from anyone"] = "%s vous ne recevez de personne %s",
	["Assigned %s to buff %s on %s (by request of %s)"] = "Assignation de %s pour buffer %s sur %s (sur la demande de %s)",
	["%s %s is not allowed to do that"] = "%s %s n'est pas autorisé à faire ceci",
	["%s Remote control of buff settings is not enabled"] = "%s le contrôle a distance de la gestion des buffs n'est pas activé",
	["CHATHELP"] = "Aide",
	["CHATHELPRESPONSE1"] = "Usage: '!zomg +buff -buff', where +buff is the buff you want (ie: +bom) and -buff is the buff you want replace with it (ie: -bow). Various synonyms will work for the + and - buff names, ie: BOW bow wisdom.",
	["CHATHELPRESPONSE2"] = "Who does the buffs is not important for you to know (but you can query this with just '!zomg')",
	["CHATHELPRESPONSE3"] = "Example: '!zomg -bow +bok' - Will request that you get Kings instead of Wisdom",
	["CHATHELPRESPONSE4"] = "Example: '!zomg -kings +light' - Will request that you get Light instead of Kings",
	["HELP_TITLE"] = "Blessing Manager Help",
	["HELP_TEXT"] =
		"The Blessings Manager has two modes. The default mode simple shows the current blessings configuration for each paladin in the raid. The configure mode allows you to setup the default blessings per class, regardless of paladins present. These defaults can then be auto assigned by the 'Generate' button when in normal mode.\r\r"..
		"The list of paladins shows their name along with some relevant information such as available blessings (as icons), talent spec, and ZOMGBuffs version\r\r"..
		"|cFFFF8080Red Icons|r indicate a conflicting buff. |cFF8080FFBlue Icons|r indicate exceptions for this cell.\r\r"..
		"|cFFFFFFFFNormal Mode|r\r"..
		"|cFFFFFF80Left Click|r an icon to cycle through the blessings for that paladin and that class.\r"..
		"|cFFFFFF80Right Click|r an icon to set an exception for a single player. That is to say, after the druids have been buffed with Greater Blessing of Wisdom for example, you may have a feral druid that requires Blessing of Might instead.\r\r"..
		"|cFFFFFFFFConfigure Mode|r\r"..
		"It is important to realise that the order of the blessings in this mode represents how many paladins you may have present in any given raid. Setup correctly you should rarely need to change this configuration. So, assuming you had one paladin in a raid, the auto assigned blessings would be taken from row 1. Two paladins would take from rows 1 and 2 and so on.\r\r"..
		"|cFFFFFF80Left Click|r an icon to cycle through the blessings for that line and that class.\r\r"..
		"Mousing over a class with sub-classes defined will expand that class to show the sub-classes. Set these classes up in the same way. Note that the sub-class split window will also open to allow you to move players into their correct sub-classes.\r\r"..
		"|cFFFFFFFFConfigure Button|r\r"..
		"This will toggle between the two modes (normal and configure).\r\r"..
		"|cFFFFFFFFGenerate Button|r\r"..
		"This will assign paladins present with blessings based on the configured global template, taking into account talents so that paladins with Improved Blessing of Might, for example, will be favored to buff this blessing.\r\r"..
		"|cFFFFFFFFBroadcast Button|r\r"..
		"This will simply re-broadcast the current blessing layout, should anyone need this after a WoW crash for example.\r\r",
}
--@end-debug@
--@localization(locale="frFR", format="lua_table", namespace="ZOMGBlessingsManager", handle-unlocalized="ignore")@
end)
