/**
 * Recherche p�riodiquement les nouveaux objets pour leur ajouter les fonctionnalit�s d'artillerie et de logistique si besoin
 * Script � faire tourner dans un fil d'ex�cution d�di�
 * 
 * Copyright (C) 2010 madbull ~R3F~
 * 
 * This program is free software under the terms of the GNU General Public License version 3.
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

#include "R3F_ARTY_disable_enable.sqf"
#include "R3F_LOG_disable_enable.sqf"

// Attente fin briefing
sleep 0.1;

private ["_liste_objets_depl_heli_remorq_transp", "_liste_vehicules_connus", "_liste_vehicules", "_count_liste_vehicules", "_i", "_objet"];

#ifdef R3F_LOG_enable
// Union des tableaux de types d'objets servant dans un isKindOf
_liste_objets_depl_heli_remorq_transp = R3F_LOG_CFG_objets_deplacables + R3F_LOG_CFG_objets_heliportables + R3F_LOG_CFG_objets_remorquables + R3F_LOG_classes_objets_transportables;
#endif

// Contiendra la liste des v�hicules (et objets) d�j� initialis�s
//_liste_vehicules_connus = [];

while {true} do
{
	if !(isNull player) then
	{
		// R�cup�ration des tout les nouveaux v�hicules de la carte et des nouveaux objets d�rivant de "Static" (caisse de mun, drapeau, ...) proches du joueur
		_liste_vehicules = nearestObjects [player, ["LandVehicle", "Ship", "Air", "Thing", "Static"], 75];
		_count_liste_vehicules = count _liste_vehicules;
		
		if (_count_liste_vehicules > 0) then
		{
			_sleepDelay = 10 / _count_liste_vehicules;
			// On parcoure tout les v�hicules pr�sents dans le jeu en 18 secondes
			{
				_objet = _x;
				
				if !(_objet getVariable ["R3F_LOG_init_done", false]) then
				{
				#ifdef R3F_LOG_enable
					// If object can be moved / airlifted / towed / loaded in
				if ({_objet isKindOf _x} count _liste_objets_depl_heli_remorq_transp > 0) then
				{
					[_objet] spawn R3F_LOG_FNCT_objet_init;
				};
				
					// If vehicle can airlift
				if ({_objet isKindOf _x} count R3F_LOG_CFG_heliporteurs > 0) then
				{
					[_objet] spawn R3F_LOG_FNCT_heliporteur_init;
				};

					// If vehicle can transport contents
				if ({_objet isKindOf _x} count R3F_LOG_classes_transporteurs > 0) then
				{
					[_objet] spawn R3F_LOG_FNCT_transporteur_init;
				};
				
					// If vehicle can tow
				if ({_objet isKindOf _x} count R3F_LOG_CFG_remorqueurs > 0) then
				{
					[_objet] spawn R3F_LOG_FNCT_remorqueur_init;
				};
				
					_objet setVariable ["R3F_LOG_init_done", true]; 
				#endif
				
			};
				sleep _sleepDelay;
			} forEach _liste_vehicules;
			
			/*
			// Les objets ont �t� initialis�s, on les m�morise pour ne plus les r�-initialiser
			{
				_liste_vehicules_connus set [count _liste_vehicules_connus, _x];
			} forEach _liste_vehicules;*/
		}
		else
		{
			sleep 10;
		};
	}
	else
	{
		sleep 2;
	};
};