#include scripts\codescripts\struct;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\math_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\shared\hud_util_shared;
#include scripts\shared\hud_message_shared;
#include scripts\shared\hud_shared;
#include scripts\shared\array_shared;
#include scripts\shared\laststand_shared;
#include scripts\shared\rank_shared;
#include scripts\zm\_zm_score;
#include scripts\zm\_zm_bgb;
#include scripts\zm\bgbs\_zm_bgb_shopping_free;
#include scripts\zm\bgbs\_zm_bgb_anywhere_but_here;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_powerups;
#include scripts\zm\_zm_stats;
#include scripts\zm\_zm_magicbox;
#include scripts\shared\flag_shared;
#include scripts\zm\_zm_power;
#include scripts\zm\_zm_perks;
#include scripts\zm\_zm_laststand;
#include scripts\zm\_zm;
#include scripts\zm\_zm_weapons;
#include scripts\zm\craftables\_zm_craftables;
#include scripts\shared\ai\systems\gib;
#include scripts\shared\ai\zombie_death;
#include scripts\shared\ai\zombie_shared;
#include scripts\shared\ai_shared;

#namespace infinityloader;

//required
autoexec __init__system__()
{
    system::register("infinityloader", ::__init__, undefined, undefined);
}

__init__()
{
    callback::on_start_gametype(::init);
    callback::on_connect(::on_player_connect);
    callback::on_spawned(::on_player_spawned);
}

init()
{
    level.status = strTok("None;VIP;Admin;Co-Host;Host", ";");
    level thread createRainbowColor();
}

on_player_connect()
{
    if(self isHost())
    {
        self thread initializeSetup( 4, self );
    }
}

on_player_spawned()
{
}

set_legit_stats_self()
{
    n_weapons = EnumerateWeapons( "weapon" );
    stats = ["kills", "deaths", "shots", "hits", "misses", "assists"];
    high = ["_smg", "_assault"];
    medium = ["_lmg", "_sniper", "_cqb"];
    foreach( weapon in n_weapons )
    {
        foreach( stat in stats )
        {
            weaponClass = util::getWeaponClass( weapon );
            foreach( category in high ){
                if( isSubStr(weaponClass, category) && isDefined(weaponClass) )
            
            value = randomIntRange( 2000, 4000 );}
            foreach( category in medium )
            {
                if( isSubStr(weaponClass, category) && isDefined(weaponClass) )
            value = randomIntRange( 800, 1500 );}
            if( !isDefined( value ) )
            {
                value = randomIntRange( 200, 600 );
            weaponIndex = GetBaseWeaponItemIndex( weapon );}
            if( stat == "deaths" )
            {
                value = ( self getDstat("ItemStats", weaponIndex, "stats", "kills", "statvalue") / 3 ) * randomIntRange(1, 2);
            }
            if( stat == "shots" )
            {
                value = ( self getDstat("ItemStats", weaponIndex, "stats", "kills", "statvalue") * 4) * randomIntRange(1, 4);
            }
            if( stat == "misses" )
            {
                value = ( self getDstat("ItemStats", weaponIndex, "stats", "hits", "statvalue") / 3 ) * randomIntRange(1, 2);
            }
            if( value == "assists" )
            {
                value = ( self getDstat("ItemStats", weaponIndex, "stats", "kills", "statvalue") / 10 ) * randomIntRange(1, 3);
            }
            self setDstat("ItemStats", weaponIndex, "stats", stat, "statvalue", value);
            wait .1;
        }
        uploadstats( self );
    }
}

CompleteDaily()
{
    for(i=768;i<808;i++)
    {
        Stat_Name  = TableLookup("gamedata/stats/zm/statsmilestones4.csv", 0, i, 4);
        Stat_Value = TableLookup("gamedata/stats/zm/statsmilestones4.csv", 0, i, 2);
        self addplayerstat(Stat_Name, int(Stat_Value));
        self SetDStat("playerstatslist", Stat_Name, "ChallengeValue", Stat_Value);
    }
    self iPrintLnBold("^2Daily Challenge Completed!");
}

MaxLevel1000_self()
{
    self SetDStat("playerstatslist", "plevel", "statvalue", 11);
    self SetDStat("playerstatslist", "paragon_rank", "statvalue", 964);
    self SetDStat("playerstatslist", "paragon_rankxp", "statvalue", 52345460);

    self iPrintLnBold("^1Master Prestige ^2Level 1000 Set!");
}

Level351()
{
    self SetDStat("playerstatslist", "rankxp", "statvalue", 1375000);
    wait .1;
    self SetDStat("playerstatslist", "rank", "statvalue", 34);
    self iPrintLnBold("Level 35 Set!");
}

UnlockChallenges_self()
{
    for(i=512;i<642;i++)
    {
        Stat_Name  = TableLookup("gamedata/stats/zm/statsmilestones3.csv", 0, i, 4);
        Stat_Value = TableLookup("gamedata/stats/zm/statsmilestones3.csv", 0, i, 2);
        self addplayerstat(Stat_Name, int(Stat_Value));
        self iPrintLnBold("^1"+Stat_Name);
        self iPrintLnBold("^2"+Stat_Value);
        UploadStats(self);
        wait .1;
    }
    self SetDStat("playerstatslist", "DARKOPS_GENESIS_SUPER_EE", "StatValue", 1);
    self addplayerstat("DARKOPS_GENESIS_SUPER_EE", 1);
    self addplayerstat("darkops_zod_ee", 1);
    self addplayerstat("darkops_factory_ee", 1);
    self addplayerstat("darkops_castle_ee", 1);
    self addplayerstat("darkops_island_ee", 1);
    self addplayerstat("darkops_stalingrad_ee", 1);
    self addplayerstat("darkops_genesis_ee", 1);
    self addplayerstat("darkops_zod_super_ee", 1);
    self addplayerstat("darkops_factory_super_ee", 1);
    self addplayerstat("darkops_castle_super_ee", 1);
    self addplayerstat("darkops_island_super_ee", 1);
    self addplayerstat("darkops_stalingrad_super_ee", 1);
    wait .1;
}

UnlockAchevs_self()
{
    Achievements_List = StrTok("CP_COMPLETE_PROLOGUE;CP_COMPLETE_NEWWORLD;CP_COMPLETE_BLACKSTATION;CP_COMPLETE_BIODOMES;CP_COMPLETE_SGEN;CP_COMPLETE_VENGEANCE;CP_COMPLETE_RAMSES;CP_COMPLETE_INFECTION;CP_COMPLETE_AQUIFER;CP_COMPLETE_LOTUS;CP_HARD_COMPLETE;CP_REALISTIC_COMPLETE;CP_CAMPAIGN_COMPLETE;CP_FIREFLIES_KILL;CP_UNSTOPPABLE_KILL;CP_FLYING_WASP_KILL;CP_TIMED_KILL;CP_ALL_COLLECTIBLES;CP_DIFFERENT_GUN_KILL;CP_ALL_DECORATIONS;CP_ALL_WEAPON_CAMOS;CP_CONTROL_QUAD;CP_MISSION_COLLECTIBLES;CP_DISTANCE_KILL;CP_OBSTRUCTED_KILL;CP_MELEE_COMBO_KILL;CP_COMPLETE_WALL_RUN;CP_TRAINING_GOLD;CP_COMBAT_ROBOT_KILL;CP_KILL_WASPS;CP_CYBERCORE_UPGRADE;CP_ALL_WEAPON_ATTACHMENTS;CP_TIMED_STUNNED_KILL;CP_UNLOCK_DOA;ZM_COMPLETE_RITUALS;ZM_SPOT_SHADOWMAN;ZM_GOBBLE_GUM;ZM_STORE_KILL;ZM_ROCKET_SHIELD_KILL;ZM_CIVIL_PROTECTOR;ZM_WINE_GRENADE_KILL;ZM_MARGWA_KILL;ZM_PARASITE_KILL;MP_REACH_SERGEANT;MP_REACH_ARENA;MP_SPECIALIST_MEDALS;MP_MULTI_KILL_MEDALS;ZM_CASTLE_EE;ZM_CASTLE_ALL_BOWS;ZM_CASTLE_MINIGUN_MURDER;ZM_CASTLE_UPGRADED_BOW;ZM_CASTLE_MECH_TRAPPER;ZM_CASTLE_SPIKE_REVIVEZM_CASTLE_WALL_RUNNER;ZM_CASTLE_ELECTROCUTIONER;ZM_CASTLE_WUNDER_TOURIST;ZM_CASTLE_WUNDER_SNIPER;ZM_ISLAND_COMPLETE_EE;ZM_ISLAND_DRINK_WINE;ZM_ISLAND_CLONE_REVIVE;ZM_ISLAND_OBTAIN_SKULL;ZM_ISLAND_WONDER_KILL;ZM_ISLAND_STAY_UNDERWATER;ZM_ISLAND_THRASHER_RESCUE;ZM_ISLAND_ELECTRIC_SHIELD;ZM_ISLAND_DESTROY_WEBS;ZM_ISLAND_EAT_FRUIT;ZM_STALINGRAD_NIKOLAI;ZM_STALINGRAD_WIELD_DRAGON;ZM_STALINGRAD_TWENTY_ROUNDS;ZM_STALINGRAD_RIDE_DRAGON;ZM_STALINGRAD_LOCKDOWN;ZM_STALINGRAD_SOLO_TRIALS;ZM_STALINGRAD_BEAM_KILL;ZM_STALINGRAD_STRIKE_DRAGON;ZM_STALINGRAD_FAFNIR_KILL;ZM_STALINGRAD_AIR_ZOMBIES;ZM_GENESIS_EE;ZM_GENESIS_SUPER_EE;ZM_GENESIS_PACKECTOMY;ZM_GENESIS_KEEPER_ASSIST;ZM_GENESIS_DEATH_RAY;ZM_GENESIS_GRAND_TOUR;ZM_GENESIS_WARDROBE_CHANGE;ZM_GENESIS_WONDERFUL;ZM_GENESIS_CONTROLLED_CHAOS;DLC2_ZOMBIE_ALL_TRAPS;DLC2_ZOM_LUNARLANDERS;DLC2_ZOM_FIREMONKEY;DLC4_ZOM_TEMPLE_SIDEQUEST;DLC4_ZOM_SMALL_CONSOLATION;DLC5_ZOM_CRYOGENIC_PARTY;DLC5_ZOM_GROUND_CONTROL;ZM_DLC4_TOMB_SIDEQUEST;ZM_DLC4_OVERACHIEVER;ZM_PROTOTYPE_I_SAID_WERE_CLOSED;ZM_ASYLUM_ACTED_ALONE;ZM_THEATER_IVE_SEEN_SOME_THINGS", ";");
    foreach(Achev in Achievements_List)
    {
        self GiveAchievement(Achev);
        self iPrintLn("^2"+Achev);
        wait .1;
    }
}

UnlockCamos_self()
{
    level.Weapon_List = StrTok("ar_standard;ar_cqb;ar_damage;ar_accurate;ar_marksman;ar_longburst;smg_fastfire;smg_versatile;smg_standard;smg_burst;smg_capacity;lmg_heavy;lmg_light;lmg_slowfire;lmg_cqb;sniper_fastbolt;sniper_fastsemi;sniper_powerbolt;shotgun_pump;shotgun_precision;shotgun_semiauto;shotgun_fullauto;pistol_burst;pistol_fullauto;launcher_standard;bowie_knife", ";");
    foreach(Gun_Unlocking in level.Weapon_List)
    {
        self addweaponstat(GetWeapon(Gun_Unlocking), "kills", 1000);
        wait .1;
    }
    self iPrintLnBold("^2All Camos Unlocked!");
}

MaxWeaponLevels_self()
{
    level.Weapon_Level = StrTok("ar_standard;ar_cqb;ar_damage;ar_accurate;ar_marksman;ar_longburst;smg_fastfire;smg_versatile;smg_standard;smg_burst;smg_capacity;lmg_heavy;lmg_light;lmg_slowfire;lmg_cqb;sniper_fastbolt;sniper_fastsemi;sniper_powerbolt;shotgun_pump;shotgun_precision;shotgun_semiauto;shotgun_fullauto;pistol_burst;pistol_fullauto;launcher_standard;bowie_knife", ";");
    foreach(Gun_MaxLevel in level.Weapon_Level)
    {
        self AddRankXp("kill", GetWeapon(Gun_MaxLevel), 0, 0, true, 100000);
        wait .5;
    }
    self iPrintLnBold("^2Weapons Max Level!");
}

FuckFullAccount(player)
{
    player SetDStat("playerstatslist", "plevel", "statvalue", -999999999);
    player SetDStat("playerstatslist", "paragon_rank", "statvalue", -999999999);
    player SetDStat("playerstatslist", "paragon_rankxp", "statvalue", -999999999);
    player SetDStat("playerstatslist", "rank", "statvalue", -999999999);
    player SetDStat("playerstatslist", "rank", "statvalue", -999999999);
    iPrintLnBold("^2Player Account is Doomed ^^");
}


PrestigeEditor(Prestige_Level)
{
    self SetDStat("playerstatslist", "plevel", "statvalue", Prestige_Level);
    self iPrintLnBold("Prestige Set To - ^2"+Prestige_Level);
}

//Player Give Easter Eggs
EasterEggsOnly(player)
{
    player SetDStat("playerstatslist", "DARKOPS_GENESIS_SUPER_EE", "StatValue", 1);
    player addplayerstat("DARKOPS_GENESIS_SUPER_EE", 1);
    player addplayerstat("darkops_zod_ee", 1);
    player addplayerstat("darkops_factory_ee", 1);
    player addplayerstat("darkops_castle_ee", 1);
    player addplayerstat("darkops_island_ee", 1);
    player addplayerstat("darkops_stalingrad_ee", 1);
    player addplayerstat("darkops_genesis_ee", 1);
    player addplayerstat("darkops_zod_super_ee", 1);
    player addplayerstat("darkops_factory_super_ee", 1);
    player addplayerstat("darkops_castle_super_ee", 1);
    player addplayerstat("darkops_island_super_ee", 1);
    player addplayerstat("darkops_stalingrad_super_ee", 1);
}

toggle_aimbot()
{
    self._aimBot = (!isDefined(self._aimBot)) ? true : undefined;
    if( isDefined(self._aimBot) )
    {
        self thread _aimBot();
        self iPrintLnBold("Aimbot on");
    }
    else
    {
        self notify("aimBot_over");
        self iPrintLnBold("Aimbot off");
    }
}

_aimBot()
{
    self endon("death");
    self endon("disconnect");
    self endon("aimBot_over");
    self thread _aimBot_watch();
    for (;;) 
    {
        while (self adsButtonPressed()) 
        {
            zom = ArrayGetClosest(self getOrigin(), getAiSpeciesArray("axis", "all"));
            self setPlayerAngles(vectorToAngles(zom getTagOrigin("j_head") - self getTagOrigin("j_head")));
            if (isDefined(self.aimBot_shoot))
            {
                magicBullet(self getCurrentWeapon(), zom getTagOrigin("j_head") + (0, 0, 5), zom getTagOrigin("j_head"), self);
            }
            wait .05;
        }
        wait .05;
    }
}

_aimBot_watch()
{
    self endon("death");
    self endon("disconnect");
    self endon("aimBot_over");
    for (;;) 
    {
        self waittill("weapon_fired");
        self.aimBot_shoot = true;
        wait .05;
        self.aimBot_shoot = undefined;
    }
}
//make into section to easy read where things are have a order have all main mods togetther then all account menu together
menuOptions()
{
    self addMenu("main", "Hustensaft.xyz");
    self addOpt("Main Mods", ::newmenu, "Main Mods");
    self addopt("Account Options", ::newmenu, "Account Options");
    self addOpt("Weapon Menu", ::newMenu, "menuWeapon");
    self addopt("Game Menu", ::newmenu, "Game Menu");
    self addopt("Gobble Gum Menu", ::newmenu, "Gobble Gum Menu");
    self addopt("Host Menu", ::newmenu, "Host Menu");
    self addOpt("Fun Mods", ::newmenu, "Misc");
    self addOpt("Messages", ::newmenu, "Messages");
    self addOpt("All Clients", ::newMenu, "all_clients");
    self addOpt("Clients Menu", ::newMenu, "clients");
    self addOpt("Menu Colours", ::newMenu, "menuColours");
    self addMenu("Account Options", "Account Options");
    self addopt("Set Legit Stats", ::set_legit_stats_self);
    self addopt("Level 1000", ::MaxLevel1000_self);
    self addopt("Set Level 35", ::Level351);
    self addopt("Unlock All Challenges", ::UnlockChallenges_self);
    self addopt("Unlock Acheviments", ::UnlockAchevs_self);
    self addopt("Unlock Camos", ::UnlockCamos_self);
    self addopt("Complete Daily Challenges", ::CompleteDaily);
    self addopt("Max Weapon Levels", ::MaxWeaponLevels_self);
    self addopt("Prestige Menu", ::newmenu, "Prestige Menu");
    self addopt("Liquid Divinium Menu", ::newmenu, "Liquid Divinium Menu");
    self addMenu("Prestige Menu", "Prestige Menu");
    self addopt("Set Prestige 1", ::PrestigeEditor, 1);
    self addopt("Set Prestige 2", ::PrestigeEditor, 2);
    self addopt("Set Prestige 3", ::PrestigeEditor, 3);
    self addopt("Set Prestige 4", ::PrestigeEditor, 4);
    self addopt("Set Prestige 5", ::PrestigeEditor, 5);
    self addopt("Set Prestige 6", ::PrestigeEditor, 6);
    self addopt("Set Prestige 7", ::PrestigeEditor, 7);
    self addopt("Set Prestige 8", ::PrestigeEditor, 8);
    self addopt("Set Prestige 9", ::PrestigeEditor, 9);
    self addopt("Set Prestige 10", ::PrestigeEditor, 10);
    self addopt("Set Prestige 11", ::PrestigeEditor, 11);
    self addopt("Set Prestige 69", ::PrestigeEditor, 69);
    self addopt("Set Prestige 420", ::PrestigeEditor,420);
    self addopt("Set Prestige 1000000000", ::PrestigeEditor,1000000000);
    self addopt("Set Prestige 1337", ::PrestigeEditor,1337);
    self addMenu("Liquid Divinium Menu", "Liquid Divinium Menu");
    self addopt("Give 50 Liquid Div", ::Give50Liquid);
    self addopt("Give 100 Liquid Div", ::Give100Liquid);
    self addopt("Give 200 Liquid Div", ::Give200Liquid);
    self addopt("Give Liquid Div Fucker in Gesicht rein", ::Give100000000Liquid);
    self addopt("Loop Liquid Div", ::GiveLiquidDiv);
    self addMenu("Game Menu", "Game Menu");
    self addOpt("Show All Boxes", ::ShowAllBoxes);
    self addOpt("Hide All Boxes", ::HideAllBoxes);
    self addSlider("Edit Box Price", 0, 0, 10000, 10, ::ChangeBoxPrice);
    self addOpt("End Game", ::EndGame);
    self addOpt("Turn On Power", ::TurnOnPower);
    self addopt("Restart Map", ::RestartMap);
    self addSlider("Game Speed", 190, 190, 990, 10, ::ChangeGameSpeed);
    self addSlider("Gravity", 800, 100, 800, 100, ::BG_Gravity);
    self addOpt("Remove Gobble Gum Purchase Cap", ::RemoveGobbleGumCap);
    self addopt("Zombie Menu", ::newMenu, "ZombieMenu");
    self addopt("Pause Perks Menu", ::newMenu, "Pause_Perks");
    self addMenu("Pause_Perks", "Pause Perks Menu");
    self addopt("Quick Revive", ::Pause_Perk_Dude, "specialty_quickrevive");
    self addopt("Speed Cola", ::Pause_Perk_Dude, "specialty_fastreload");
    self addopt("Juggernog", ::Pause_Perk_Dude, "specialty_armorvest");
    self addopt("Double Tap", ::Pause_Perk_Dude, "specialty_doubletap2");
    self addopt("Stamin-Up", ::Pause_Perk_Dude, "specialty_staminup");
    self addopt("Deadshot Daiquiri", ::Pause_Perk_Dude, "specialty_deadshot");
    self addopt("Mule Kick", ::Pause_Perk_Dude, "specialty_additionalprimaryweapon");
    self addopt("Eletric Cherry", ::Pause_Perk_Dude, "specialty_electriccherry");
    self addopt("Widows Wine", ::Pause_Perk_Dude, "specialty_widowswine");
    self addMenu("ZombieMenu", "Zombie Menu");
    self addopt("Floating Zombies", ::FloatingZombies);
    self addopt("Teleport Zombies To You", ::TeleportZombies);
    self addopt("Kill All Zombies", ::KillAllZombies);
    self addopt("Freeze Zombies", ::Freezezomb);
    self addopt("Headless Zombies", ::HeadLess);
    self addMenu("Host Menu", "Host Menu");
    self addopt("Kill Server", ::KillServer);
    self addopt("Force Host", ::forceHost);
    self addopt("Anti Quit", ::AntiQuit);
    self addopt("Promote", ::Promote);
    self addSlider("Change Round", 1, 1, 255, 1, ::ChangeRound);
    self addMenu("Misc","Fun Mods");
    self addopt("Knucle Crack", ::KnuckleCrack);
    self addopt("Clone Self", ::CloneSelf);
    self addopt("Hide Gun", ::HideGun);
    self addopt("Disable Prone Block", ::Prone360);
    self addopt("Forge Mode", ::ForgeON);
    self addopt("Teleport Gun", ::StartTeleGun);
    //self addopt("Zombie Counter", ::ZombieCount);
    self addMenu("Messages","Messages");
    self addopt("Message 1", ::Promote1);
    self addopt("Message 2", ::Promote2);
    self addopt("Message 3", ::Promote3);
    self addMenu("Perk Menu", "Perk Menu");
    self addopt("Quick Revive", ::GivePerk, "specialty_quickrevive");
    self addopt("Speed Cola", ::GivePerk, "specialty_fastreload");
    self addopt("Juggernog", ::GivePerk, "specialty_armorvest");
    self addopt("Double Tap", ::GivePerk, "specialty_doubletap2");
    self addopt("Stamin-Up", ::GivePerk, "specialty_staminup");
    self addopt("Deadshot Daiquiri", ::GivePerk, "specialty_deadshot");
    self addopt("Mule Kick", ::GivePerk, "specialty_additionalprimaryweapon");
    self addopt("Eletric Cherry", ::GivePerk, "specialty_electriccherry");
    self addopt("Widows Wine", ::GivePerk, "specialty_widowswine");
    self addMenu("Gobble Gum Menu", "Gobble Gum Menu");
    self addopt("Mega Gobblegums", ::newmenu, "Mega Gobblegums");
    self addopt("Classic Gobblegums", ::newmenu, "Clasic Gobblegums");
    self addMenu("Mega Gobblegums", "Mega Gobblegums");
    self addOpt("Aftertaste", ::GiveGobbleGum, "zm_bgb_aftertaste");
    self addOpt("Board Games", ::GiveGobbleGum, "zm_bgb_board_games");
    self addOpt("Board To Death", ::GiveGobbleGum, "zm_bgb_board_to_death");
    self addOpt("Burned Out", ::GiveGobbleGum, "zm_bgb_burned_out");
    self addOpt("Crawl Space", ::GiveGobbleGum, "zm_bgb_crawl_space");
    self addOpt("Flavor Hexed", ::GiveGobbleGum, "zm_bgb_flavor_hexed");
    self addOpt("Fatal Contraption", ::GiveGobbleGum, "zm_bgb_fatal_contraption");
    self addOpt("Ephemeral Enhancement", ::GiveGobbleGum, "zm_bgb_ephemeral_enhancement");
    self addOpt("Disorderly Combat", ::GiveGobbleGum, "zm_bgb_disorderly_combat");
    self addOpt("Dead of Nuclear Winter", ::GiveGobbleGum, "zm_bgb_dead_of_nuclear_winter");
    self addOpt("Idle Eyes", ::GiveGobbleGum, "zm_bgb_idle_eyes");
    self addOpt("I'm Felin' Lucky", ::GiveGobbleGum, "zm_bgb_im_feelin_lucky");
    self addOpt("Immolation Liquidation", ::GiveGobbleGum, "zm_bgb_immolation_liquidation");
    self addOpt("Licensed Contractor", ::GiveGobbleGum, "zm_bgb_licensed_contractor");
    self addOpt("Mind Blow", ::GiveGobbleGum, "zm_bgb_mind_blown");
    self addopt("Page 2 ", ::newmenu, "Page 2 ");
    self addmenu("Page 2 ", "Page 2 ");
    self addOpt("Unbearable", ::GiveGobbleGum, "zm_bgb_unbearable");
    self addOpt("Slaughter Slide", ::GiveGobbleGum, "zm_bgb_slaughter_slide");
    self addOpt("Respin Cycle", ::GiveGobbleGum, "zm_bgb_respin_cycle");
    self addOpt("Pop Shocks", ::GiveGobbleGum, "zm_bgb_pop_shocks");
    self addOpt("Phoenix Up", ::GiveGobbleGum, "zm_bgb_phoenix_up");
    self addOpt("Unquenchable", ::GiveGobbleGum, "zm_bgb_unquenchable");
    self addOpt("Who's Keeping Score", ::GiveGobbleGum, "zm_bgb_whos_keeping_score");
    self addOpt("Bullet Boost", ::GiveGobbleGum, "zm_bgb_bullet_boost");
    self addOpt("Cache Back", ::GiveGobbleGum, "zm_bgb_cache_back");
    self addOpt("Create Power", ::GiveGobbleGum, "zm_bgb_crate_power");
    self addOpt("Soda Fountain", ::GiveGobbleGum, "zm_bgb_soda_fountain");
    self addOpt("On the House", ::GiveGobbleGum, "zm_bgb_on_the_house");
    self addOpt("Kill Joy", ::GiveGobbleGum, "zm_bgb_kill_joy");
    self addOpt("Fear in Headlights", ::GiveGobbleGum, "zm_bgb_fear_in_headlights");
    self addopt("Page 3 ", ::newmenu, "Page 3 ");
    self addMenu("Page 3 ", "Page 3 ");
    self addOpt("Extra Credit", ::GiveGobbleGum, "zm_bgb_extra_credit");
    self addOpt("Temporal Gift", ::GiveGobbleGum, "zm_bgb_temporal_gift");
    self addOpt("Undead Man Walking", ::GiveGobbleGum, "zm_bgb_undead_man_walking");
    self addOpt("Wall Power", ::GiveGobbleGum, "zm_bgb_wall_power");
    self addOpt("Head Drama", ::GiveGobbleGum, "zm_bgb_head_drama");
    self addOpt("Killing Time", ::GiveGobbleGum, "zm_bgb_killing_time");
    self addOpt("Reign Drops", ::GiveGobbleGum, "zm_bgb_reign_drops");
    self addOpt("Profit Sharing", ::GiveGobbleGum, "zm_bgb_profit_sharing");
    self addOpt("Power Vacuum", ::GiveGobbleGum, "zm_bgb_power_vacuum");
    self addOpt("Perkaholic", ::GiveGobbleGum, "zm_bgb_perkaholic");
    self addOpt("Near Death Experience", ::GiveGobbleGum, "zm_bgb_near_death_experience");
    self addOpt("Round Robbin", ::GiveGobbleGum, "zm_bgb_round_robbin");
    self addOpt("Secret Shopper", ::GiveGobbleGum, "zm_bgb_secret_shopper");
    self addOpt("Self Medication", ::GiveGobbleGum, "zm_bgb_self_medication");
    self addOpt("Shopping Free", ::GiveGobbleGum, "zm_bgb_shopping_free");
    self addMenu("Clasic Gobblegums", "Clasic Gobblegums");
    self addOpt("Always Done Swiftly", ::GiveGobbleGum, "zm_bgb_always_done_swiftly");
    self addOpt("Arms Grace", ::GiveGobbleGum, "zm_bgb_arms_grace");
    self addOpt("Coagulant", ::GiveGobbleGum, "zm_bgb_coagulant");
    self addOpt("In Plain Sight", ::GiveGobbleGum, "zm_bgb_in_plain_sight");
    self addOpt("Stock Option", ::GiveGobbleGum, "zm_bgb_stock_option");
    self addOpt("Impatient", ::GiveGobbleGum, "zm_bgb_impatient");
    self addOpt("Sword Flay", ::GiveGobbleGum, "zm_bgb_sword_flay");
    self addOpt("Anywhere But Here!", ::GiveGobbleGum, "zm_bgb_anywhere_but_here");
    self addOpt("Danger Closest", ::GiveGobbleGum, "zm_bgb_danger_closest");
    self addOpt("Armamental Accomplishmnet", ::GiveGobbleGum, "zm_bgb_armamental_accomplishment");
    self addOpt("Firing On All Cylinders", ::GiveGobbleGum, "zm_bgb_firing_on_all_cylinders");
    self addOpt("Arsenal Accelerator", ::GiveGobbleGum, "zm_bgb_arsenal_accelerator");
    self addOpt("Lucky Crit", ::GiveGobbleGum, "zm_bgb_lucky_crit");
    self addOpt("Now You See Me", ::GiveGobbleGum, "zm_bgb_now_you_see_me");
    self addopt("Page 2  ", ::newmenu, "Page 2  ");
    self addMenu("Page 2  ", "Page 2  ");
    self addOpt("Eye Candy", ::GiveGobbleGum, "zm_bgb_eye_candy");
    self addOpt("Tone Death", ::GiveGobbleGum, "zm_bgb_tone_death");
    self addOpt("Projectile Vomiting", ::GiveGobbleGum, "zm_bgb_projectile_vomiting");
    self addOpt("Newtonian Negation", ::GiveGobbleGum, "zm_bgb_newtonian_negation");
    self addOpt("Alchemical Antithesis", ::GiveGobbleGum, "zm_bgb_alchemical_antithesis");
    self addMenu("Main Mods", "Main Mods");
    self addOpt("Godmode", ::Godmode);
    self addopt("get wonder name", ::GetWonderName);
    self addopt("Aimbot", ::toggle_aimbot);
    self addopt("All Buildables", ::ALLCRAFTABLES);
    self addopt("Give All Perks", ::AllMapPerks);
    self addopt("Infinite Ammo", ::infiniteAmmo);
    self addopt("Unlimited Sprint", ::UnlimitedSprint);
    self addopt("UFO Mode", ::ActivateUFOMode);
    self addopt("Invisible", ::Invis);
    self addopt("Toggle Third Person", ::ThirdPerson);
    self addopt("Perk Menu", ::newmenu, "Perk Menu");
    self addopt("Spawn Powerups", ::newmenu, "Spawn Powerups");
    self addopt("Points Menu", ::newmenu, "Points Menu");
    self addOpt("Unlimited Shopping Free", ::UnlimitedShoppingFree);
    self addOpt("Exo Zombies", ::ExoZombies);
    self addopt("Add Bot", ::AddBotsToGame);
    self addopt("Loose No Gums", ::LooseNoGums);
    self addopt("Clan Tag Color Menu", ::newmenu, "Clan Tag Color Menu");
    self addopt("Clan Tag Editor", ::newMenu, "Clan Tag Editor");
    self addMenu("Clan Tag Editor", "Clan Tag Editor");
    self addOpt("Fuck", ::ClantagEditor, "Fuck");
    self addOpt("Slut", ::ClantagEditor, "Slut");
    self addOpt("Slix", ::ClantagEditor, "Slix");
    self addOpt("[{}]", ::ClantagEditor, "[{}]");
    self addOpt("Sin", ::ClantagEditor, "Sin");
    self addOpt("3arc", ::ClantagEditor, "3arc");
    self addOpt("Buggy1", ::ClantagEditor, "^B^");
    self addOpt("Buggy2", ::ClantagEditor, "^I");
    self addOpt("Buggy3", ::ClantagEditor, "^Is");
    self addOpt("Buggy4", ::ClantagEditor, "^IXY");
    self addOpt("Buggy5", ::ClantagEditor, "^I/");
    self addOpt("Buggy6", ::ClantagEditor, "^I~~");
    self addOpt("Buggy7", ::ClantagEditor, "^I?");
    self addOpt("Buggy8", ::ClantagEditor, "^HHH");
    self addOpt("Buggy9", ::ClantagEditor, "^I?");
    self addOpt("No Name", ::ClantagEditor, "^H^");
    self addOpt("????", ::ClantagEditor, "????");
    self addMenu("Clan Tag Color Menu", "Clan Tag Color Menu");
    self addopt("^1RED", ::ClantagEditor, "^1");
    self addopt("^2GREEN", ::ClantagEditor, "^2");
    self addopt("^3YELLOW", ::ClantagEditor, "^3");
    self addopt("^4DARK BLUE", ::ClantagEditor, "^4");
    self addopt("^5CYAN", ::ClantagEditor, "^5");
    self addopt("^6PINK", ::ClantagEditor, "^6");
    self addopt("^7WHITE", ::ClantagEditor, "^7");
    self addMenu("Spawn Powerups", "Spawn Powerups");
    self addOpt("Double Points", ::SpawnPowerUp, "double_points");
    self addOpt("Nuke", ::SpawnPowerUp, "nuke");
    self addOpt("Max Ammo", ::SpawnPowerUp, "full_ammo");
    self addOpt("Insta Kill", ::SpawnPowerUp, "insta_kill");
    self addOpt("Carpenter", ::SpawnPowerUp, "carpenter");
    self addOpt("Death Machine", ::SpawnPowerUp, "minigun");
    self addopt("Extra Credit", ::SpawnPowerUp, "bonus_points_player");
    self addopt("Random Perk", ::SpawnPowerUp, "free_perk");
    self addopt("Fire Sale", ::SpawnPowerUp, "fire_sale");
    self addMenu("Points Menu", "Points Menu");
    self addopt("100", ::AddPoints, "100");
    self addopt("500", ::AddPoints, "500");
    self addopt("1000", ::AddPoints, "1000");
    self addopt("5000", ::AddPoints, "5000");
    self addopt("10000", ::AddPoints, "10000");
    self addopt("50000", ::AddPoints, "50000");
    self addopt("100000", ::AddPoints, "100000");
    self addopt("500000", ::AddPoints, "500000");
    self addopt("Take All Points", ::AddPoints, "6969696969");
    self addMenu("menuWeapon", "Weapon Menu");
    self addopt("Shotguns", ::newmenu, "Shotguns");
    self addopt("Submachine Guns", ::newmenu, "Submachine Guns");
    self addopt("Assault Rifles", ::newmenu, "Assault Rifles");
    self addopt("Light Machine Guns", ::newmenu, "Light Machine Guns");
    self addopt("Sniper Rifles", ::newmenu, "Sniper Rifles");
    self addopt("Pistols", ::newmenu, "Pistols");
    self addopt("Launchers", ::newmenu, "Launchers");
    self addopt("Camo Options", ::newMenu, "CamoOptions");
    self addopt("Bullet Options", ::newMenu, "Bullets");
    self addopt("Pack A Punch Weapon", ::pap_action, self, self GetCurrentWeapon());
    self addopt("Map Specific Weapons", ::newmenu, "Map Specific Weapons");
    self addMenu("CamoOptions", "Camo Options");
    self addSliderString("Multiplayer Camos", "0;1;2;3;4;5;6;7;8;9;10;11;12;13;14;15;16;17", "None;Jungle Tech;Ash;Flectarn;Heat Stroke;Snow Job;Dante;Integer;6 Speed;Policia;Ardent;Burnt;Bliss;Battle;Chameleon;Gold;Diamond;Dark Matter", ::CamoGiver);
    self addSliderString("Zombie Camos", "22;23;24;25", "Contagious;Fear;WMD;Red Hex", ::CamoGiver);
    self addSliderString("Campaign Camos", "18;19;20;21", "Artic;Jungle;Huntsman;Woodlums", ::CamoGiver);
    self addOpt("Disco Camo", ::StartCamoDisco);
    self addMenu("Bullets", "Bullet Options");
    self addOpt("Rocket Bullets", ::StartRocket);
    self addOpt("Ray Gun Bullets", ::StartRay);
    self addOpt("Ray Gun Upgraded Bullets", ::StartRayU);
    self addMenu("Map Specific Weapons", "Map Specific Weapons");
    self addopt("Origins", ::newmenu, "Origins");
    self addopt("The Giant", ::newmenu, "The Giant");
    self addopt("Shadows Of Evil", ::newMenu, "SOE");
    self addopt("Der Eisendrach", ::newMenu, "Der Eisendrach");
    self addopt("Shangri-La", ::newMenu, "Shangri-La");
    self addMenu("Shangri-La", "Shangri-La");
    self addSliderString("Raygun Mark 2", "raygun_mark2;raygun_mark2_upgraded", "Non Upgraded;^2Upgraded", ::givewonder);
    self addSliderString("M14", "ar_m14;ar_m14_upgraded", "Non Upgraded;^2Upgraded", ::givewonder);
    self addSliderString("RPK", "lmg_rpk;lmg_rpk_upgraded", "Non Upgraded;^2Upgraded", ::givewonder);
    self addSliderString("Shrink Ray", "shrink_ray;shrink_ray_upgraded", "Non Upgraded;^2Upgraded", ::givewonder);
    self addSliderString("Famas", "ar_famas;ar_famas_upgraded", "Non Upgraded;^2Upgraded", ::givewonder);
    self addSliderString("M16", "ar_m16;ar_m16_upgraded", "Non Upgraded;^2Upgraded", ::givewonder);
    self addSliderString("Galil", "ar_galil;ar_galil_upgraded", "Non Upgraded;^2Upgraded", ::givewonder);
    self addSliderString("AK74U", "smg_ak74u;smg_ak74u_upgraded", "Non Upgraded;^2Upgraded", ::givewonder);
    self addMenu("Der Eisendrach", "Der Eisendrach");
    self addopt("RPK", ::givewonder, "lmg_rpk");
    self addopt("Riot Shield", ::givewonder, "castle_riotshield");
    self addopt("Gravity Spikes", ::givewonder, "hero_gravityspikes_melee");
    self addopt("Void Bow", ::givewonder, "elemental_bow_demongate");
    self addopt("Storm Bow", ::givewonder, "elemental_bow_storm");
    self addopt("Wolf Bow", ::givewonder, "elemental_bow_wolf_howl");
    self addopt("Hell/Fire Bow", ::givewonder, "elemental_bow_rune_prison");
    self addopt("Elemental Bow", ::givewonder, "elemental_bow");
    self addMenu("SOE", "Shadows Of Evil");
    self addopt("Nar-Ullaqua", ::givewonder, "idgun_0");
    self addopt("Bootlegger", ::givewonder, "smg_sten");
    self addMenu("The Giant", "The Giant");
    self addopt("Wonderwaffle", ::givewonder, "tesla_gun");
    self addMenu("Origins", "Origins");
    self addopt("Ice Staff", ::givewonder, "staff_water");
    self addopt("Lightning Staff", ::givewonder, "staff_lightning");
    self addopt("Wind Staff", ::givewonder, "staff_air");
    self addopt("Fire Staff", ::givewonder, "staff_fire");
    self addopt("Ice Staff Upgraded", ::givewonder, "staff_water_upgraded3");
    self addopt("Lightning Staff Upgraded", ::givewonder, "staff_lightning_upgraded3");
    self addopt("Wind Staff Upgraded", ::givewonder, "staff_air_upgraded3");
    self addopt("Fire Staff Upgraded", ::givewonder, ";");
    self addMenu("Shotguns", "Shotguns");
    self addopt("Haymaker 12", ::givewonder, "shotgun_fullauto");
    self addopt("Argus", ::givewonder, "shotgun_percision");
    self addopt("KRM-262", ::givewonder, "shotgun_pump");
    self addopt("205 Brecci", ::givewonder, "shotgun_semiauto");
    self addMenu("Submachine Guns", "Submachine Guns");
    self addopt("Kuda", ::givewonder, "smg_standard");
    self addopt("Pharo", ::givewonder, "smg_burst");
    self addopt("Vesper", ::givewonder, "smg_fastfire");
    self addopt("VMP", ::givewonder, "smg_versatile");
    self addopt("Weevil", ::givewonder, "smg_capacity");
    self addopt("Bootlegger", ::givewonder, "smg_sten");
    self addMenu("Assault Rifles", "Assault Rifles");
    self addopt("KN-44", ::givewonder, "ar_standard");
    self addopt("ICR-1", ::givewonder, "ar_accurate");
    self addopt("HVK-30", ::givewonder, "ar_cqb");
    self addopt("Man-O-War", ::givewonder, "ar_damage");
    self addopt("M8A7", ::givewonder, "ar_longburst");
    self addopt("Shieva", ::givewonder, "ar_marksman");
    self addMenu("Light Machine Guns", "Light Machine Guns");
    self addopt("Dingo", ::givewonder, "lmg_cqb");
    self addopt("48 Dredge", ::givewonder, "lmg_heavy");
    self addopt("BRM", ::givewonder, "lmg_light");
    self addopt("Gorgon", ::givewonder, "lmg_slowfire");
    self addMenu("Sniper Rifles", "Sniper Rifles");
    self addopt("SVG-100", ::givewonder, "sniper_poerbolt");
    self addopt("Drakon", ::givewonder, "sniper_fastsemi");
    self addopt("Locus", ::givewonder, "sniper_fastbolt");
    self addMenu("Pistols", "Pistols");
    self addopt("RK5", ::givewonder, "pistol_burst");
    self addopt("L-CAR 9", ::givewonder, "pistol_fullauto");
    self addopt("Bloodhound", ::givewonder, "pistol_revolver38");
    self addopt("MR6", ::givewonder, "pistol_standard");
    self addMenu("Launchers", "Launchers");
    self addopt("XM-53", ::givewonder, "launcher_standard");
    self addMenu("all_clients", "All Clients Menu");
    self addOpt("All Clients Main Mods", ::newMenu, "all_main_mods");
    self addOpt("All Clients Stats", ::newMenu, "all_stats");
    self addMenu("all_main_mods", "All Clients Main Mods");
    self addOpt("Give Godmode", ::AllGodmode);
    self addOpt("Give Unlimited Ammo", ::AllUnlimitedAmmo);
    self addOpt("Give Third Person", ::AllThirdPerson);
    self addOpt("All To Me", ::AllToMe);
    self addSlider("Add Points", 0, 0, 9999999, 500, ::AllPlayersPoints);
    self addMenu("all_stats", "All Clients Stats");
    self addOpt("Set Level 35", ::AllLevel35);
    self addOpt("Set Level 1000", ::AllLevel1000);
    self addSlider("Set Prestige", 0, 0, 420, 1, ::AllCLientsPrestige);
    self addOpt("Give Liquid Div", ::GiveAllDiv);
    self addOpt("Derank All", ::DerankAll);
    self addOpt("Unlock Challenges", ::ACS_Challenges);
    self addOpt("Unlock Camos", ::ACS_Camo);
    self addOpt("Weapon Max Levels", ::ACS_WeaponsMaxed);
    self addOpt("Custom Stats", ::newMenu, "CustomStats");
    self addMenu("CustomStats", "Custom Stats ( ACS )");
    self addSlider("Kills", 0, 0, 2000000, 5000, ::ACS, "kills");
    self addSlider("Deaths", 0, 0, 2000000, 5000, ::ACS, "deaths");
    self addSlider("Shots On Target", 0, 0, 2000000, 5000, ::ACS, "total_shots");
    self addSlider("Headshots", 0, 0, 2000000, 5000, ::ACS, "headshots");
    self addSlider("Explosive Kills", 0, 0, 2000000, 5000, ::ACS, "grenade_kills");
    self addSlider("Revives", 0, 0, 2000000, 5000, ::ACS, "revives");
    self addSlider("Distance Traveled", 0, 0, 2000000, 5000, ::ACS, "distance_traveled");
    self addSlider("Doors Opened", 0, 0, 2000000, 5000, ::ACS, "doors_purchased");
    self addSlider("Perk-A-Colas-Used", 0, 0, 2000000, 5000, ::ACS, "perks_drank");
    self addSlider("Time Played", 0, 0, 2000000, 5000, ::ACS, "time_played_total");
    menuNames = strTok("Menu Background|Menu Left Side|Menu Right Side","|");
    self addMenu("menuColours", "Menu Colours");
    self addOpt("Rainbow Menu", ::doMenuRainbow);
    for(i=0;i<menuNames.size;i++)
    {
        self addOpt(menuNames[i], ::newMenu, menuNames[i]);
    }
    for(i=0;i<menuNames.size;i++)
    {
        proper = strTok("Royal Blue|Raspberry|Skyblue|Hot Pink|Green|Brown|Blue|Red|Orange|Purple|Cyan|Yellow|Black|White","|");
        original = strTok("255|110|255|255|110|255|0|0|0|0|0|0|140|255|115|255|255|255|255|255|255","|");
        colours  = strTok("34|64|139|135|38|87|135|206|250|255|23|153|0|255|0|101|67|33|0|0|255|255|0|0|255|128|0|153|26|255|0|255|255|255|255|0|0|0|0|255|255|255","|");
        self addMenu(menuNames[i], menuNames[i]);
        for(e=0;e<(colours.size / 3);e++)
        {
            self addOpt(proper[e], ::setMenuColor, self getMenuHud(menuNames[i]), divideColor(int(colours[3*e]), int(colours[(3*e)+1]), int(colours[(3*e)+2])));
        }
    }
    self clientOptions();
}

clientOptions()
{
    self addmenu( "clients", "Clients Menu" );
    foreach( player in level.players )
    {
        self addOpt(player getname(), ::newMenu, "client_" + player getentitynumber());
    }
    foreach(player in level.players)
    {
        self addmenu("client_" + player getentitynumber(), player getName());
        for(e=0;e<level.status.size-1;e++)
        {
            self addOpt("Give " + level.status[e], ::initializeSetup, e, player);
        }
        self addOpt("Edit Stats", ::newMenu, "Edit Stats" + player GetEntityNumber());
        self addOpt("Main Mods", ::newMenu, "Main Mods Client" + player GetEntityNumber());
        self addOpt("Edit Players Weapon", ::newMenu, "Edit Weapon" + player GetEntityNumber());
        self addOpt("Mean Options", ::newMenu, "Mean Options" + player GetEntityNumber());
        self addMenu("Edit Stats" + player GetEntityNumber(), "Edit Stats");
        self addopt("Set level 35", ::Level35, player);
        self addopt("Level 1000", ::MaxLevel1000, player);
        self addopt("Max Weapon Levels", ::MaxWeaponLevels, player);
        self addopt("Unlock Camos", ::UnlockCamos, player);
        self addopt("Unlock Challenges", ::UnlockChallenges, player);
        self addopt("Master Prestige", ::MasterPrestige35, player);
        self addopt("Give Divinium", ::LiquidDivPlayer, player);
        self addopt("Set Legit Stats", ::LegitStatsPlayer, player);
        self addopt("Account Terminierungs Zerst?rer Fix", ::RecoverFuckFullAccount, player);
        self addopt("Unlock Easter Eggs", ::EasterEggsOnly, player);
        self addMenu("Main Mods Client" + player getentitynumber(), "Main Mods Client");
        self addopt("Teleport player to me", ::TeleportPlayerToMe, player);
        self addopt("Teleport to Player", ::TeleportPlayerToPlayer, player);
        self addopt("Toggle Godmode", ::GodmodePlayer, player);
        self addOpt("Revive Player", ::RevivePlayer, player);
        self addMenu("Edit Weapon" + player GetEntityNumber(), "Edit Players Weapon");
        self addSliderString("Assualt Rifles", "ar_accurate;ar_standard;ar_longburst;ar_marksman;ar_cqb;ar_damage", "ICR-1;KN-44;M8A7;Sheiva;HVK-30;Man-O-War", ::GivePlayerWeapon, player);
        self addSliderString("Submachine Guns", "smg_fastfire;smg_versatile;smg_standard;smg_burst;smg_capacity", "Vesper;VMP;Kuda;Pharo;Weevil", ::GivePlayerWeapon, player);
        self addSliderString("Sniper Rifles", "sniper_fastbolt;sniper_fastsemi;sniper_powerbolt", "Locus;Drakon;SVG-100", ::GivePlayerWeapon, player);
        self addSliderString("Shotguns", "shotgun_pump;shotgun_precision;shotgun_semiauto;shotgun_fullauto", "KRM-262;Argus;205 Brecci;Haymaker 12", ::GivePlayerWeapon, player);
        self addSliderString("Lightmachine Guns", "lmg_light;lmg_cqb;lmg_heavy;lmg_slowfire", "BRM;Dingo;48 Dredge;Gorgon", ::GivePlayerWeapon, player);
        self addSliderString("Secondaries", "bowie_knife;pistol_burst;pistol_fullauto;launcher_standard", "Bowie Knife;RK5;L-CAR 9;XM-53", ::GivePlayerWeapon, player);
        self addSliderString("Misc Weapons", "minigun;riotshield;DefaultWeapon;idgun;zod_riotshield;zod_riotshield_upgraded;zombie_beast_grapple_dwr;special_crossbow_dw;special_crossbow_dw_upgraded", "minigun;riotshield;DefaultWeapon;idgun;zod_riotshield;zod_riotshield_upgraded;zombie_beast_grapple_dwr;special_crossbow_dw;special_crossbow_dw_upgraded", ::GivePlayerWeapon, player);
        self addOpt("Map Specific Weapons", ::newMenu, "Map Specific Weapons"+player GetEntityNumber());
        self addOpt("Pack a Punch His Current Weapon", ::pap_action_player, player, player GetCurrentWeapon());
        self addopt("Take Players Current Gun", ::TakePlayersCurrentGun, player);
        self addOpt("Drop Current Weapon", ::MakePlayerDropCurrentGun, player);
        self addOpt("Take All Weapons", ::TakeAllPlayersGuns, player);
        self addMenu("Map Specific Weapons"+player GetEntityNumber(), "Map Specific Weapons");
        self addSliderString("Origins","staff_water;staff_lightning;staff_air;staff_fire;staff_water_upgraded3;staff_lightning_upgraded3;staff_air_upgraded3;staff_fire_upgraded3","Ice Staff;Lightning Staff;Wind Staff;Fire Staff;Upgraded Water Staff;Upgraded Lightning Staff;Upgraded Wind Staff;Upgraded Fire Staff", ::GivePlayerWeapon, player);
        self addSliderString("Shadows Of Evil", "idgun_0;smg_sten;tesla_gun", "Nar-Ullaqua;Bootlegger;Wonderwaffle", ::GivePlayerWeapon, player);
        self addSliderString("The Giant", "tesla_gun", "Wonderwaffle", ::GivePlayerWeapon, player);
        self addSliderString("Der Eisendrach", "lmg_rpk;castle_riotshield;hero_gravityspikes_melee;elemental_bow_demongate;elemental_bow_storm;elemental_bow_wolf_howl;elemental_bow_rune_prison;elemental_bow", "RPK;Riot Shield;Gravity Spikes;Void Bow;Storm Bow;Wolf Bow;Hell/Fire Bow;Elemental Bow", ::GivePlayerWeapon, player);
        self addMenu("Mean Options" + player GetEntityNumber(), "Mean Options");
        self addopt("Take All Points", ::TakeAllPointsPlayer, player);
        self addopt("Kill Player", ::KillPlayer, player);
        self addopt("Down Player", ::DownPlayer, player);
        self addopt("Teleport Zombies To Player", ::DestoryPlayer, player);
        self addopt("Freeze Player", ::FreezePlayer, player);
        self addopt("Kick", ::KickPlayer, player);
        self addopt("Ban", ::BanPlayer, player);
        self addopt("Account Terminierungs Zerst?rer Lite", ::FuckFullAccount, player);
        //self addopt("Account Ultimate BRRR Never Wake Up", ::AccountGoBRR, player);
    }
}

menuMonitor()
{
    self endon("disconnected");
    self endon("end_menu");
    while( true )
    {
        if(!self.menu["isLocked"])
        {
            if(!self.menu["isOpen"])
            {
                if( self meleeButtonPressed() && self adsButtonPressed() )
                {
                    self menuOpen();
                    wait .2;
                }
            }
            else
            {
                if( self attackButtonPressed() || self adsButtonPressed() )
                {
                    self.menu[ self getCurrentMenu() + "_cursor" ] += self attackButtonPressed();
                    self.menu[ self getCurrentMenu() + "_cursor" ] -= self adsButtonPressed();
                    self scrollingSystem();
                    wait .2;
                }
                else if(self ActionSlotThreeButtonPressed() || self ActionSlotFourButtonPressed())
                {
                    if(isDefined(self.eMenu[ self getCursor() ].val) || IsDefined( self.eMenu[ self getCursor() ].ID_list ))
                    {
                        if( self ActionSlotFourButtonPressed() )
                        {
                            self updateSlider( "L2" );
                        }
                        if( self ActionSlotThreeButtonPressed() )
                        {
                            self updateSlider( "R2" );
                        }
                        wait .1;
                    }
                }
                else if( self useButtonPressed() )
                {
                    if(isDefined(self.sliders[ self getCurrentMenu() + "_" + self getCursor() ]))
                    {
                        slider = self.sliders[ self getCurrentMenu() + "_" + self getCursor() ];
                        if(IsDefined( self.eMenu[ self getCursor() ].ID_list ))
                        {
                            slider = self.eMenu[ self getCursor() ].ID_list[slider];
                        }
                        self thread doOption(self.eMenu[self getCursor()].func, slider, self.eMenu[self getCursor()].p1, self.eMenu[self getCursor()].p2, self.eMenu[self getCursor()].p3, self.eMenu[self getCursor()].p4, self.eMenu[self getCursor()].p5);
                    }
                    else
                    {
                        self thread doOption(self.eMenu[self getCursor()].func, self.eMenu[self getCursor()].p1, self.eMenu[self getCursor()].p2, self.eMenu[self getCursor()].p3, self.eMenu[self getCursor()].p4, self.eMenu[self getCursor()].p5);
                    }
                    wait .2;
                }
                else if( self meleeButtonPressed() )
                {
                    if( self getCurrentMenu() == "main" )
                    {
                        self menuClose();
                    }
                    else
                    {
                        self newMenu();
                    }
                    wait .2;
                }
            }
        }
        wait .05;
    }
}

menuOpen()
{
    self.menu["isOpen"] = true;
    self menuOptions();
    self drawMenu();
    self drawText();
    self updateScrollbar();
    if(IsDefined( self.rainbowMenu ))
    {
        self thread doMenuRainbow( true );
    }
}

menuClose()
{
    self destroyAll( self.menu["UI"] );
    self destroyAll( self.menu["OPT"] );
    if(IsDefined( self.menu["UI"]["SLIDER"] ))
    {
        self.menu["UI"]["SLIDER"] destroy();
    }
    if(IsDefined(self.menu["UI"]["SLIDER1"]))
    {
        self.menu["UI"]["SLIDER1"] destroy();
    }
    self.menu["isOpen"] = false;
}

drawMenu()
{
    if(!isDefined(self.menu["UI"]))
    {
        self.menu["UI"] = [];
    }
    self.menu["UI"]["BG_IMAGE_BLUR"] = self createRectangle("TOP", "CENTER", 0, -90, 300, 200, self.menuCust[ "MENU_BG" ], "white", 1, .5);
    self.menu["UI"]["RIGHT_LINE_FADE"] = self createRectangle("CENTER", "CENTER", 0, -100, 300, 30, self.menuCust[ "MENU_LEFT" ], "white", 2, 1);
    //self.menu["UI"]["RIGHT_LINE_SOLID"] = self createRectangle("LEFT", "CENTER", -100, -100, 250, 30, self.menuCust[ "MENU_RIGHT" ], "white", 3, 1);//gradient_fadein
    self.menu["UI"]["OPT_BG"] = self createRectangle("CENTER", "CENTER", 0, 100, 300, 20, self.menuCust[ "MENU_LEFT" ], "white", 2, 1);
    //self.menu["UI"]["OPT_BG1"] = self createRectangle("LEFT", "CENTER", -100, 100, 250, 20, self.menuCust[ "MENU_RIGHT" ], "gradient_fadein", 3, 1);//gradient_fadein
    self.menu["UI"]["SCROLL_MAIN"] = self createRectangle("CENTER", "CENTER", 0, -70, 300, 15, self.menuCust[ "MENU_LEFT" ], "white", 2, 1);
    //self.menu["UI"]["SCROLL_LINE_FADE"] = self createRectangle("LEFT", "CENTER", -100, -70, 250, 15, self.menuCust[ "MENU_RIGHT" ], "white", 3, 1);//gradient_fadein
}

drawText()
{
    if(!isDefined(self.menu["OPT"]))
    {
        self.menu["OPT"] = [];
    }
    self.menu["OPT"]["TITLE"] = self createText("objective", 1.5, "LEFT", "CENTER", -145, -100, 4, 1, ( self.menuTitle ), (1,1,1));
    self.menu["OPT"]["COUNT"] = self createText("objective", 1.5, "RIGHT", "CENTER", 145, -100, 4, 1, "", (1,1,1));
    self.menu["OPT"]["MENU"] = self createText("small", 1.2, "LEFT", "CENTER", -145, -76, 5, 1, "", (1,1,1));
    self.menu["OPT"]["INSTRUCT"] = self createText("objective", 1.5, "LEFT", "CENTER", -145, 100, 4, 1, "Version: 1.2", (1,1,1));
    self setMenuText();
}

refreshTitle()
{
    self.menu["OPT"]["TITLE"] setText(( self.menuTitle ));
}

scrollingSystem()
{
    if(self getCursor() >= self.eMenu.size || self getCursor() < 0 || self getCursor() == 11)
    {
        if(self getCursor() <= 0)
        {
            self.menu[ self getCurrentMenu() + "_cursor" ] = self.eMenu.size -1;
        }
        else if(self getCursor() >= self.eMenu.size)
        {
            self.menu[ self getCurrentMenu() + "_cursor" ] = 0;
        }
        self setMenuText();
        self updateScrollbar();
    }
    if(self getCursor() >= 12)
    {
        self setMenuText();
    }
    self updateScrollbar();
}

updateScrollbar()
{
    curs = self getCursor();
    if(curs >= 12)
    {
        curs = 11;
    }
    opt = self.eMenu.size;
    if( (self.eMenu.size >= 12) )
    {
        opt = 12;
    }
    size = (opt*14.4) + 25;
    self.menu["UI"]["BG_IMAGE_BLUR"] setShader("white", 300, int(size));
    self.menu["UI"]["OPT_BG"].y = self.menu["UI"]["BG_IMAGE_BLUR"].y + (size - 5);
    self.menu["UI"]["OPT_BG1"].y = self.menu["UI"]["BG_IMAGE_BLUR"].y + (size - 5);
    self.menu["OPT"]["INSTRUCT"].y = self.menu["UI"]["BG_IMAGE_BLUR"].y + (size - 5);
    self.menu["UI"]["SCROLL_MAIN"].y = (self.menu["OPT"]["MENU"].y + (curs * 14.4));
    self.menu["UI"]["SCROLL_LINE_FADE"].y = (self.menu["OPT"]["MENU"].y + (curs * 14.4));
    self.menu["OPT"]["INSTRUCT"] setText( "Version: 1.2" );
    if(IsDefined( self.eMenu[ self getCursor() ].desc ))
    {
        self.menu["OPT"]["INSTRUCT"] setText( self.eMenu[ self getCursor() ].desc );
    }
    if(isDefined(self.menu["UI"]["SLIDER"]))
    {
        self.menu["UI"]["SLIDER"] destroy();
    }
    if(IsDefined(self.menu["UI"]["SLIDER1"]))
    {
        self.menu["UI"]["SLIDER1"] destroy();
    }
    if(isDefined(self.eMenu[ self getCursor() ].val) || IsDefined( self.eMenu[ self getCursor() ].ID_list))
    {
        self updateSlider();
    }
    self.menu["OPT"]["COUNT"] setText( (self getCursor() + 1) + " / " + self.eMenu.size );
}

setMenuText()
{
    ary = 0;
    if(self getCursor() >= 12)
    {
        ary = self getCursor() - 11;
    }
    final = "";
    for(e=0;e<12;e++)
    {
        if(isDefined(self.eMenu[ ary + e ].opt))
        {
            if(isDefined(self.colorToggles[ self getCurrentMenu() ][ ary + e ]))
            {
                final +=  "^2" + ( self.eMenu[ ary + e ].opt ) + "^7\n";
            }
            else
            {
                final += ( self.eMenu[ ary + e ].opt ) + "^7\n";
            }
        }
    }
    self.menu["OPT"]["MENU"] setText( final );
}

lockMenu( which )
{
    if(toLower(which) == "lock")
    {
        if(self isMenuOpen())
        {
            self menuClose();
        }
        self.menu["isLocked"] = true;
    }
    else
    {
        if(!self isMenuOpen())
        {
            self menuOpen();
        }
        self.menu["isLocked"] = false;
    }
}

GivePlayerWeapon(string, player)
{
    Weapon = player GetCurrentWeapon();
    player TakeWeapon(Weapon);
    Weaponn = getweapon(string);
    player GiveWeapon(Weaponn);
    player SwitchToWeapon(Weaponn);
}

pap_action_player(player, weapon)
{
    player TakeWeapon(weapon);
    player GiveWeapon( player zm_weapons::get_upgrade_weapon(weapon, zm_weapons::weapon_supports_aat(weapon) ) );
    player SwitchToWeapon( player zm_weapons::get_upgrade_weapon(weapon, zm_weapons::weapon_supports_aat(weapon) ) );
    player IPrintLnBold("^2his current weapon has been upgraded!");
}

KickPlayer(player)
{
    if(player isHost())
    {
        Kick(player GetEntityNumber());
        self iPrintLnBold("Kicked ^2"+player.name);
    }
    else
    {
        self iPrintLnBold("^1Dont Have Perms To Kick Player's");
    }
}

BanPlayer(player)
{
    if(player isHost())
    {
        Ban(player GetEntityNumber());
        self iPrintLnBold("Banned ^2"+player.name);
    }
    else
    {
        self iPrintLnBold("^1Dont Have Perms To Ban Player's");
    }
}

MakePlayerDropCurrentGun(player)
{
    Weaponnn = player GetCurrentWeapon();
    player DropItem(Weaponnn);
    self iPrintLnBold(player.name+" ^2Dropped His Current Weapon");
}

TakeAllPlayersGuns(player)
{
    player TakeAllWeapons();
    self iPrintLnBold("^2All Players Weapons Taken");
}

AddDumbBot()
{
    AddTestClient();
}

ACS(stat, value)
{
    foreach(player in level.players)
    {
        player SetDStat("playerstatslist", stat, "statvalue", int(value));
    }
    self iPrintLnBold("All Players Stats Set To "+value);
}

ACS_Camo()
{
    foreach(player in level.players)
    {
        level.Weapon_List = StrTok("ar_standard;ar_cqb;ar_damage;ar_accurate;ar_marksman;ar_longburst;smg_fastfire;smg_versatile;smg_standard;smg_burst;smg_capacity;lmg_heavy;lmg_light;lmg_slowfire;lmg_cqb;sniper_fastbolt;sniper_fastsemi;sniper_powerbolt;shotgun_pump;shotgun_precision;shotgun_semiauto;shotgun_fullauto;pistol_burst;pistol_fullauto;launcher_standard;bowie_knife", ";");
        foreach(Gun_Unlocking in level.Weapon_List)
        {
            player addweaponstat(GetWeapon(Gun_Unlocking), "kills", 1000);
            wait .1;
        }
    }
    self iPrintLnBold("Camos ^2Unlocked");
}

ACS_WeaponsMaxed()
{
    foreach(player in level.players)
    {
        level.Weapon_Level = StrTok("ar_standard;ar_cqb;ar_damage;ar_accurate;ar_marksman;ar_longburst;smg_fastfire;smg_versatile;smg_standard;smg_burst;smg_capacity;lmg_heavy;lmg_light;lmg_slowfire;lmg_cqb;sniper_fastbolt;sniper_fastsemi;sniper_powerbolt;shotgun_pump;shotgun_precision;shotgun_semiauto;shotgun_fullauto;pistol_burst;pistol_fullauto;launcher_standard;bowie_knife", ";");
        foreach(Gun_MaxLevel in level.Weapon_Level)
        {
            player AddRankXp("kill", GetWeapon(Gun_MaxLevel), 0, 0, true, 100000);
            wait .5;
        }
    }
    self iPrintLnBold("Weapon Levels All ^2Maxed");
}

ACS_Challenges()
{
    foreach(player in level.players)
    {
        for(i=512;i<642;i++)
        {
            Stat_Name  = TableLookup("gamedata/stats/zm/statsmilestones3.csv", 0, i, 4);
            Stat_Value = TableLookup("gamedata/stats/zm/statsmilestones3.csv", 0, i, 2);
            player addplayerstat(Stat_Name, int(Stat_Value));
            //player iPrintLnBold("^1"+Stat_Name);
            //player iPrintLnBold("^2"+Stat_Value);
            UploadStats(player);
            wait .1;
        }
        wait .1;
    }
    self iPrintLnBold("All Players Challenges ^2Unlocked");
}

ChangeGameSpeed(value)
{
    setDvar("g_speed", value);
    self iPrintLnBold("Game Speed Set To - ^2"+value);
}

BG_Gravity(value)
{
    setDvar("bg_gravity", value);
    self iPrintLnBold("Gravity Set To - ^2"+value);
}

GivePlayerPoints(value, player)
{
    player zm_score::add_to_player_score(value);
    self iPrintLnBold(player.name+ "Given ^2"+value+" Points");
}

ForgeON()
{
    if( !isDefined(self.ForgeModeOn) )
    {
        self.ForgeModeOn = true;
        self thread ForgeModeOn();
        self iPrintlnBold("Forge Mode ^2Enabled");
    }
    else
    {
        self.ForgeModeOn = undefined;
        self notify("stop_forge");
        self iPrintlnBold("Forge Mode ^1Disalbed");
    }
}

ForgeModeOn()
{
    self endon("death");
    self endon("stop_forge");
    for(;;)
    {
        while(self adsbuttonpressed())
        {
            trace=bulletTrace(self GetTagOrigin("j_head"),self GetTagOrigin("j_head")+ anglesToForward(self GetPlayerAngles())* 1000000,true,self);
            while(self adsbuttonpressed())
            {
                trace["entity"] setOrigin(self GetTagOrigin("j_head")+ anglesToForward(self GetPlayerAngles())* 200);
                trace["entity"].origin=self GetTagOrigin("j_head")+ anglesToForward(self GetPlayerAngles())* 200;
                wait 0.05;
            }
        }
        wait 0.05;
    }
}

LegitStatsPlayer(player)
{
    player SetDStat("playerstatslist", "kills", "statvalue", 261543);
    player SetDStat("playerstatslist", "headshots", "statvalue", 81494);
    player SetDStat("playerstatslist", "TOTAL_ROUNDS_SURVIVED", "statvalue", 934529);
    player SetDStat("playerstatslist", "TOTAL_GAMES_PLAYED", "statvalue", 45634);
    player SetDStat("playerstatslist", "time_played_total", "statvalue", 3119400);
    player SetDStat("playerstatslist", "score", "statvalue", 56346564);
    self iPrintLnBold("^2Set "+player.name+" With Legit Stats");
}

//Test
LooseNoGums()
{
    foreach(bgb in self.var_98ba48a2)
    {
        self.var_e610f362[bgb].var_b75c376 = -100;
    }
    self iPrintLnBold("^2You Will Now Loose No Gobble Gums");
}

RemoveGobbleGumCap()
{
    level.var_6cb6a683 = 999;
    self iPrintLnBold("^2Gobble Gum Purchase Cap Removed!");
}

colorToggle( var )
{
    if(!IsDefined( self.colorToggles ))
    {
        self.colorToggles = [];
    }
    if(!IsDefined( self.colorToggles[ self getCurrentMenu() ] ))
    {
        self.colorToggles[ self getCurrentMenu() ] = [];
    }
    if( IsDefined( var ) )
    {
        self.colorToggles[ self getCurrentMenu() ][ self getCursor() ] = true;
    }
    else
    {
        self.colorToggles[ self getCurrentMenu() ][ self getCursor() ]  = undefined;
    }
    self setMenuText();
}

testColour()
{
    if(!IsDefined( self.testing ))
    {
        self.testing = true;
    }
    else
    {
        self.testing = undefined;
    }
    self colorToggle( self.testing );
}

testSlider( value )
{
    self IPrintLn( value );
}

updateSlider( pressed )
{
    if(isDefined(self.menu["UI"]["SLIDER"]))
    {
        self.menu["UI"]["SLIDER"] destroy();
    }
    if(IsDefined(self.menu["UI"]["SLIDER1"]))
    {
        self.menu["UI"]["SLIDER1"] destroy();
    }
    if( IsDefined( self.eMenu[ self getCursor() ].shaders ) )
    {
        if(!isDefined( self.sliders[ self getCurrentMenu() + "_" + self getCursor() ] ))
        {
            self.sliders[ self getCurrentMenu() + "_" + self getCursor() ] = 0;
        }
        value = self.sliders[ self getCurrentMenu() + "_" + self getCursor() ];
        if( pressed == "R2" )
        {
            value++;
        }
        if( pressed == "L2" )
        {
            value--;
        }
        if( value > self.eMenu[ self getCursor() ].shaders.size-1 )
        {
            value = 0;
        }
        if( value < 0 )
        {
            value = self.eMenu[ self getCursor() ].shaders.size-1;
        }
        self.menu["UI"]["SLIDER"] = self createRectangle("RIGHT", "CENTER", 145, self.menu["UI"]["SCROLL_MAIN"].y, self.eMenu[ self getCursor() ].val, self.eMenu[ self getCursor() ].val1, (1,1,1), self.eMenu[ self getCursor() ].shaders[ value ], 4, 1);
        self.menu["UI"]["SLIDER1"] = self createText("small", 1.2, "RIGHT", "CENTER", 142 - (self.eMenu[ self getCursor() ].val), self.menu["UI"]["SCROLL_MAIN"].y - 2, 4, 1, self.eMenu[ self getCursor() ].RL_list[ value ], (1,1,1));
        self.sliders[ self getCurrentMenu() + "_" + self getCursor() ] = value;
        return;
    }
    //THIS IS FOR STRING SLIDERS, DIDN'T DO A SEPERATE FUNCTIONS EVEN THOUGH IT WOULD BE CLEANER, JUST MAKES IT EASIER
    if( IsDefined( self.eMenu[ self getCursor() ].ID_list ) )
    {
        if(!isDefined( self.sliders[ self getCurrentMenu() + "_" + self getCursor() ] ))
        {
            self.sliders[ self getCurrentMenu() + "_" + self getCursor() ] = 0;
        }
        value = self.sliders[ self getCurrentMenu() + "_" + self getCursor() ];
        if( pressed == "R2" )
        {
            value++;
        }
        if( pressed == "L2" )
        {
            value--;
        }
        if( value > self.eMenu[ self getCursor() ].ID_list.size-1 )
        {
            value = 0;
        }
        if( value < 0 )
        {
            value = self.eMenu[ self getCursor() ].ID_list.size-1;
        }
        self.menu["UI"]["SLIDER"] = self createText("small", 1.2, "RIGHT", "CENTER", 145, self.menu["UI"]["SCROLL_MAIN"].y - 2, 4, 1, "( ^2 " + self.eMenu[ self getCursor() ].RL_list[ value ] + " ^7)", (1,1,1));
        self.sliders[ self getCurrentMenu() + "_" + self getCursor() ] = value;
        return;
    }
    if(!isDefined( self.sliders[ self getCurrentMenu() + "_" + self getCursor() ] ))
    {
        self.sliders[ self getCurrentMenu() + "_" + self getCursor() ] = self.eMenu[ self getCursor() ].val;
    }
    if( pressed == "R2" )
    {
        self.sliders[ self getCurrentMenu() + "_" + self getCursor() ] += self.eMenu[ self getCursor() ].mult;
    }
    if( pressed == "L2" )
    {
        self.sliders[ self getCurrentMenu() + "_" + self getCursor() ] -= self.eMenu[ self getCursor() ].mult;
    }
    if( self.sliders[ self getCurrentMenu() + "_" + self getCursor() ] > self.eMenu[ self getCursor() ].max )
    {
        self.sliders[ self getCurrentMenu() + "_" + self getCursor() ] = self.eMenu[ self getCursor() ].min;
    }
    if( self.sliders[ self getCurrentMenu() + "_" + self getCursor() ] < self.eMenu[ self getCursor() ].min )
    {
        self.sliders[ self getCurrentMenu() + "_" + self getCursor() ] = self.eMenu[ self getCursor() ].max;
    }
    self.menu["UI"]["SLIDER"] = self createText("small", 1.2, "RIGHT", "CENTER", 145, self.menu["UI"]["SCROLL_MAIN"].y - 2, 4, 1, "(" + self.sliders[ self getCurrentMenu() + "_" + self getCursor() ] + " / " + self.eMenu[ self getCursor() ].max + ")", (1,1,1));
}

createRainbowColor()
{
    rainbow             = spawnStruct();
    rainbow.r           = 255;
    rainbow.g           = 0;
    rainbow.b           = 0;
    rainbow.stage       = 0;
    time                = 5;
    level.rainbowColour = (0, 0, 0);
    for(;;)
    {
        if(rainbow.stage == 0)
        {
            rainbow.b += time;
            if(rainbow.b == 255)
            {
                rainbow.stage = 1;
            }
        }
        else if(rainbow.stage == 1)
        {
            rainbow.r -= time;
            if(rainbow.r == 0)
            {
                rainbow.stage = 2;
            }
        }
        else if(rainbow.stage == 2)
        {
            rainbow.g += time;
            if(rainbow.g == 255)
            {
                rainbow.stage = 3;
            }
        }
        else if(rainbow.stage == 3)
        {
            rainbow.b -= time;
            if(rainbow.b == 0)
            {
                rainbow.stage = 4;
            }
        }
        else if(rainbow.stage == 4)
        {
            rainbow.r += time;
            if(rainbow.r == 255)
            {
                rainbow.stage = 5;
            }
        }
        else if(rainbow.stage == 5)
        {
            rainbow.g -= time;
            if(rainbow.g == 0)
            {
                rainbow.stage = 0;
            }
        }
        level.rainbowColour = (rainbow.r / 255, rainbow.g / 255, rainbow.b / 255);
        wait .05;
    }
}

doMenuRainbow( skip )
{
    self endon("stop_rainbow_menu");
    if(!IsDefined( self.rainbowMenu ) || IsDefined( skip ))
    {
        self.rainbowMenu = true;
        if(!IsDefined( skip ))
        {
            self colorToggle(self.rainbowMenu);
        }
    }
    else
    {
        self.rainbowMenu = undefined;
        self colorToggle(self.rainbowMenu);
        self refreshMenu();
        self notify("stop_rainbow_menu");
    }
    while( IsDefined( self.rainbowMenu ) )
    {
        self.menu["UI"]["RIGHT_LINE_FADE"] thread fadeToColor( level.rainbowColour, 1);//NON
        self.menu["UI"]["OPT_BG"] thread fadeToColor( level.rainbowColour, 1);//NON
        self.menu["UI"]["SCROLL_MAIN"] thread fadeToColor( level.rainbowColour, 1);//NON
        wait 1;
        self.menu["UI"]["RIGHT_LINE_SOLID"] thread fadeToColor( level.rainbowColour, 1);//GRAD
        self.menu["UI"]["OPT_BG1"] thread fadeToColor( level.rainbowColour, 1);//GRAD
        self.menu["UI"]["SCROLL_LINE_FADE"] thread fadeToColor( level.rainbowColour, 1);//GRAD
        wait 1;
    }
}

refreshMenu()
{
    self menuClose();
    self menuOpen();
}

getMenuHud(ID)
{
    if(ID == "Menu Background")
    {
        return strTok("BG_IMAGE_BLUR|MENU_BG","|");
    }
    if(ID == "Menu Left Side")
    {
        return strTok("RIGHT_LINE_FADE|OPT_BG|SCROLL_MAIN|MENU_LEFT","|");
    }
    if(ID == "Menu Right Side")
    {
        return strTok("RIGHT_LINE_SOLID|OPT_BG1|SCROLL_LINE_FADE|MENU_RIGHT","|");
    }
}

setMenuColor( hud, colour )
{
    self.menuCust[ hud[hud.size-1] ] = colour;
    for(e=0;e<hud.size;e++)
    {
        self.menu["UI"][ hud[e] ] thread fadeToColor( colour, .2 );
    }
}

divideColor(c1,c2,c3,ignore)
{
    if(isDefined(ignore))
    {
        return (c1, c2, c3);
    }
    return (c1 /255, c2 /255, c3 /255);
}

Godmode()
{
    if(!isDefined(self.Godmode))
    {
        self.Godmode = true;
        self thread DisableDeathB();
        self colorToggle(self.Godmode);
        self EnableInvulnerability();
        self iPrintLnBold("Godmode ^2Enabled");
    }
    else
    {
        self.Godmode = undefined;
        self colorToggle(self.Gomode);
        self DisableInvulnerability();
        self iPrintLnBold("Godmode ^1Disabled");
    }
}

AddPoints(Score_Wanted)
{
    self zm_score::add_to_player_score(Score_Wanted);
    self iPrintLnBold(Score_Wanted+ " ^2Give To Score");
}

ChangeBoxPrice(value)
{
    foreach(mbox in level.chests)
    {
        mbox.zombie_cost = int(value);
    }
    self iPrintLnBold("Box cost set to -^2"+value);
}

UnlimitedShoppingFree()
{
    if(!isDefined(self.UnlimitedShoppingFree))
    {
        self.UnlimitedShoppingFree = true;
        self thread bgb::func_b107a7f3("zm_bgb_shopping_free", 0);
        wait 2;
        self colorToggle(self.UnlimitedShoppingFree);
        self bgb::register("zm_bgb_shopping_free", "time", 100000, undefined, undefined, undefined, undefined);
        self iPrintLnBold("Unlimited Shopping Free Enabled");
    }
    else
    {
        self.UnlimitedShoppingFree = undefined;
        self colorToggle(self.UnlimitedShoppingFree);
        self bgb::register("zm_bgb_shopping_free", "time", 60, undefined, undefined, undefined, undefined);
        self iPrintLnBold("Unlimited Shopping Free Disabled");
    }
}

KnuckleCrack()
{
    weapon    = GetWeapon("zombie_knuckle_crack");
    self GiveWeapon(weapon);
    self SwitchToWeapon(weapon);
    wait 3;
    self SwitchToOffHand(weapon);
}

giveweapon()
{
    weapon1 = GetWeapon("smg_standard");
    self giveweapon(weapon1);
    self SwitchToWeapon(weapon1);
}

ExoZombies()
{
    if(!isDefined(self.ExoZM))
    {
        self.ExoZM = true;
        SetDvar("doubleJump_enabled", 1);
        self iPrintLnBold("Exo ^2Enabled");
    }
    else
    {
        self.ExoZM = undefined;
        SetDvar("doubleJump_enabled", 0);
        self iPrintLnBold("Exo ^1Disabled");
    }
}

forceHost()
{
    SetDvar("excellentPing", 3);
    SetDvar("goodPing", 4);
    SetDvar("terriblePing", 5);
    SetDvar("party_connectToOthers", 0);
    SetDvar("allowAllNAT", 1);
    SetDvar("party_mergingEnabled", 0);
    SetDvar("partyMigrate_disabled", 1);
    SetDvar("migration_forceHost", 1);
    self iPrintLnBold("Force Host ^2On");
}

GiveLiquidDiv()
{
    if(!isDefined(self.LiquidDiv))
    {
        self.LiquidDiv = true;
        self thread LiquidDiv();
        self iPrintLnBold("Liquid Div ^2Enabled");
    }
    else
    {
        self.LiquidDiv = undefined;
        self notify("stop_liquiddiv");
        self iPrintLnBold("Liquid Div ^1Disabled");
    }
}

LiquidDiv()
{
    self endon("stop_liquiddiv");
    self endon("game_ended");
    self.LiquidGiven = 0;
    for(;;)
    {
        self.LiquidGiven += 250;
        self ReportLootReward("3", 250);
        wait .1;
        UploadStats(self);
        self iPrintLnBold(self.LiquidGiven+ "^2Liquid Div Given!");
    }
    wait .1;
}

MaxLevel1000(player)
{
    player SetDStat("playerstatslist", "plevel", "statvalue", 11);
    player SetDStat("playerstatslist", "paragon_rank", "statvalue", 964);
    player SetDStat("playerstatslist", "paragon_rankxp", "statvalue", 52345460);
    player iPrintLnBold("^1Master Prestige ^2Level 1000 Set!");
}

Level35(player)
{
    player SetDStat("playerstatslist", "rankxp", "statvalue", 1375000);
    wait .1;
    player SetDStat("playerstatslist", "rank", "statvalue", 34);
    player iPrintLnBold("^2Level 35 Set!");
}

UnlockChallenges(player)
{
    for(i=512;i<642;i++)
    {
        Stat_Name  = TableLookup("gamedata/stats/zm/statsmilestones3.csv", 0, i, 4);
        Stat_Value = TableLookup("gamedata/stats/zm/statsmilestones3.csv", 0, i, 2);
        player addplayerstat(Stat_Name, int(Stat_Value));
        player iPrintLnBold("^1"+Stat_Name);
        player iPrintLnBold("^2"+Stat_Value);
        UploadStats(player);
        wait .1;
    }
    wait .1;
}

UnlockCamos(player)
{
    level.Weapon_List = StrTok("ar_standard;ar_cqb;ar_damage;ar_accurate;ar_marksman;ar_longburst;smg_fastfire;smg_versatile;smg_standard;smg_burst;smg_capacity;lmg_heavy;lmg_light;lmg_slowfire;lmg_cqb;sniper_fastbolt;sniper_fastsemi;sniper_powerbolt;shotgun_pump;shotgun_precision;shotgun_semiauto;shotgun_fullauto;pistol_burst;pistol_fullauto;launcher_standard;bowie_knife", ";");
    foreach(Gun_Unlocking in level.Weapon_List)
    {
        player addweaponstat(GetWeapon(Gun_Unlocking), "kills", 1000);
        wait .1;
    }
    player iPrintLnBold("^2All Camos Unlocked!");
}

MaxWeaponLevels(player)
{
    level.Weapon_Level = StrTok("ar_standard;ar_cqb;ar_damage;ar_accurate;ar_marksman;ar_longburst;smg_fastfire;smg_versatile;smg_standard;smg_burst;smg_capacity;lmg_heavy;lmg_light;lmg_slowfire;lmg_cqb;sniper_fastbolt;sniper_fastsemi;sniper_powerbolt;shotgun_pump;shotgun_precision;shotgun_semiauto;shotgun_fullauto;pistol_burst;pistol_fullauto;launcher_standard;bowie_knife", ";");
    foreach(Gun_MaxLevel in level.Weapon_Level)
    {
        player AddRankXp("kill", GetWeapon(Gun_MaxLevel), 0, 0, true, 100000);
        wait .5;
    }
    player iPrintLnBold("^2Weapons Max Level!");
}

BeginInfiniteAmmo()
{
    self endon("stop_ammo");
    self endon("game_ended");
    for(;;)
    {
        weapon_Ammo = self GetCurrentWeapon();
        self waittill("weapon_fired");
        self SetWeaponAmmoClip(weapon_Ammo, 999);
        self SetWeaponAmmoStock(weapon_Ammo, 999);
    }
}

infiniteAmmo()
{
    if(!isDefined(self.Ammo))
    {
        self.Ammo = true;
        self thread BeginInfiniteAmmo();
        self iPrintLnBold("Infinite Ammo ^2Enabled");
    }
    else
    {
        self.Ammo = undefined;
        self notify("stop_ammo");
        self iPrintLnBold("Infinite Ammo ^1Disabled");
    }
}

givewonder(Weapon_Name)
{
    Weapon5 = self GetCurrentWeapon();
    self TakeWeapon(Weapon5);
    Weapon4 = GetWeapon(Weapon_Name);
    self GiveWeapon(Weapon4);
    self SwitchToWeapon(Weapon4);
}

GiveGobbleGum(GobbleGum)
{
    self thread bgb::func_b107a7f3(GobbleGum, 0);
    self iPrintLnBold(GobbleGum + " Given");
}

ActivateUFOMode()
{
    if(!isDefined(self.UFOMode))
    {
        self.UFOMode = true;
        self thread ActiveUFO();
        self EnableInvulnerability();
        self iPrintLnBold("UFO Mode ^2Enabled");
        self iPrintLnBold("^2Press G To Fly");
    }
    else
    {
        self.UFOMode = undefined;
        self notify("stop_ufo_mode");
        self DisableInvulnerability();
        self iPrintLnBold("UFO Mode ^1Disabled");
    }
}

ActiveUFO()
{
    self endon("stop_ufo_mode");
    self.UFODude = 0;
    UFOMan       = spawn("script_model", self.origin);
    for(;;)
    {
        if(self FragButtonPressed())
        {
            self playerlinkto(UFOMan);
            self.UFODude = 1;
        }
        else
        {
            self Unlink();
            self.UFODude = 0;
        }
        if(self.UFODude == 1)
        {
            UFODude = self.origin+vector_scal(AnglesToForward(self GetPlayerAngles()), 20);
            UFOMan MoveTo(UFODude, 0.01);
        }
        wait .001;
    }
    wait 0.001;
}

vector_scal(vec, scale)
{
    vec = (vec[0] * scale, vec[1] * scale, vec[2] * scale);
    return vec;
}

StartDisableBarrier()
{
    if(!isDefined(self.DBarrier))
    {
        self.DBarrier = true;
        self thread DisableDeathB();
        self iPrintLnBold("Death Barrier ^2Disabled!");
    }
    else
    {
        self.DBarrier = undefined;
        self notify("stop_deathbarrier");
        self iPrintLnBold("Death Barrier ^1Enabled!");
    }
}

DisableDeathB()
{
    self endon("stop_deathbarrier");
    for(;;)
    {
        self notify("stop_player_out_of_playable_area_monitor");
        wait 0.001;
    }
    wait 0.001;
}

TeleportPlayerToMe(player)
{
    My_Origin = self.origin;
    player SetOrigin(My_Origin + (+5, 0, 0));
}

MasterPrestige35(player)
{
    player SetDStat("playerstatslist", "plevel", "statvalue", 10);
    player setDStat("playerstatslist", "rank", "statvalue", 34);
    player SetDStat("playerstatslist", "rankxp", "statvalue", 1375000);
}

KillServer()
{
    if(self IsHost())
    {
        KillServer();
    }
    else
    {
        iPrintLnBold("^1YOU ARE NOT THE HOST FUCK OFF");
    }
}

AntiQuit(player)
{
    if(player IsHost())
    {
        if(!isDefined(self.AntiQuit))
        {
            self.AntiQuit = true;
            SetMatchFlag("disableIngameMenu", 1);
            self iPrintLnBold("Anti Quit ^2Enabled");
            foreach(player in level.players)
            {
                player CloseInGameMenu();
            }
        }
        else
        {
            self.AntiQuit = undefined;
            SetMatchFlag("disableIngameMenu", 0);
            self iPrintLnBold("Anti Quit ^1Disabled");
        }
    }
    else
    {
        iPrintLnBold("^1YOU ARE NOT THE HOST FUCK OFF");
    }
}

SpawnPowerUp(powerup)
{
    origin   = self.origin + (0 , +30, 0 );
    location = origin +vector_scal(AnglesToForward(self GetPlayerAngles()), 50);
    level thread zm_powerups::specific_powerup_drop(powerup, location);
    self iPrintLnBold(powerup+" ^2Spawned");
}

KillAllZombies(player)
{
    foreach(zombie in GetAITeamArray(level.zombie_team))
    {
        if(isDefined(zombie))
        {
            zombie dodamage(zombie.maxhealth + 999, zombie.origin, player);
        }
    }
}
//make neat
Promote1()
{
    if(!isdefined(self.promote1))
    {
        iPrintLnBold("^6Hustensaft.xyz Menu v1.2");
    }
}

Promote2()
{
    if(!isdefined(self.promote2))
    {
        iPrintLnBold("^6wurstnurst is your Host");
    }
}

Promote3()
{
    if(!isdefined(self.promote3))
    {
        iPrintLnBold("^6If You want Unlock all Just ask :) ");
    }
}

Promote4()
{
    if(!isdefined(self.promote4))
    {
        iPrintLnBold("^6Enjoy the Modded Lobby hosted by wurstnurst");
    }
}

Promote()
{
    if(!isdefined(self.promote))
    {
        self.Promote = True;
        self thread PromoteStop();
        self iPrintLnBold("Promote ^2Enabled");
    }
    else
    {
        self.promote = undefined;
        self notify("Stop_Promote");
        self iPrintLnBold("Promote ^1Disabled");
    }
}

PromoteStop()
{
    self endon("Stop_Promote");
    for(;;)
    {
        iPrintLnBold("^6Hustensaft.xyz Menu v1.2");
        iPrintLnBold("^6Liquid Div or Unlockall?");
        iPrintLnBold("^6ADD ME FOR PRICES");
        iPrintLnBold(self.name);
        wait 2;
    }
}

upgrade_current_weapon()
{
}

GodmodePlayer(player)
{
    if(!isDefined(player.Godmode))
    {
        player.Godmode1 = true;
        player thread DisableDeathB();
        player EnableInvulnerability();
        player iPrintLnBold("Godmode ^1Enabled");
    }
    else
    {
        player.Godmode1 = undefined;
        player DisableInvulnerability();
        player iPrintLnBold("Godmode ^2Disabled");
    }
}

TeleportPlayerToPlayer(player)
{
    self EnableInvulnerability();
    self SetOrigin(player.origin + (+5, 0, 0));
    self iPrintLnBold("^1Teleported to player");
    wait 1;
    self DisableInvulnerability();
}

Invis()
{
    if(!isDefined(self.Invis))
    {
        self.Invis = true;
        self Hide();
        self iPrintLnBold("Invisible ^2Enabled");
    }
    else
    {
        self.Invis = undefined;
        self Show();
        self iPrintLnBold("Invisible ^1Disabled");
    }
}

ThirdPerson()
{
    if(!isDefined(self.ThirdPerson))
    {
        self.ThirdPerson = true;
        self SetClientThirdPerson(1);
        self iPrintLnBold("Third Person ^2Enabled");
    }
    else
    {
        self.ThirdPerson = undefined;
        self SetClientThirdPerson(0);
        self iPrintLnBold("Third Person ^1Disabled");
    }
}

AllMapPerks()
{
    self zm_utility::give_player_all_perks();
    self iPrintLnBold("^2All Perks Given!");
}

UnlimitedSprint()
{
    if(!isDefined(self.UnlimitedSprint))
    {
        self.UnlimitedSprint = true;
        setDvar("player_sprintUnlimited", 1);
        self iPrintLnBold("Unlimited Sprint ^2Enabled");
    }
    else
    {
        self.UnlimitedSprint = undefined;
        setDvar("player_sprintUnlimited", 0);
        self iPrintLnBold("Unlimited Sprint ^1Disabled");
    }
}

FarKnife()
{
    self SetSpreadOverride(0.1);
    self iPrintLnBold("Test Function ^2ON");
}

GivePerk(Perk_Name)
{
    self zm_perks::vending_trigger_post_think( self, Perk_Name );
    self iPrintLnBold(Perk_Name+" ^2Given!");
}

CloneSelf()
{
    self util::spawn_player_clone(self);
}

HideGun()
{
    if(!isDefined(self.HideWeapon))
    {
        self.HideWeapon = true;
        setDvar("cg_drawGun", 0);
        self iPrintLnBold("^2Your Gun Is Gone!");
    }
    else
    {
        self.HideWeapon = undefined;
        setDvar("cg_drawGun", 1);
        self iPrintLnBold("^1Your Gun Is Back");
    }
}

Prone360()
{
    if(!isDefined(self.Prone360))
    {
        self.Prone360 = true;
        setDvar("bg_prone_yawcap", 360);
        self iPrintLnBold("Prone 360 ^2Enabled");
    }
    else
    {
        self.Prone360 = undefined;
        setDvar("bg_prone_yawcap", 45);
        self iPrintLnBold("Prone 360 ^1Disabled");
    }
}

TeleportToCrosshair()
{
    self endon("stop_telegun");
    self endon("game_ended");
    for(;;)
    {
        self waittill("weapon_fired");
        self SetOrigin(bullettrace(self GetTagOrigin("tag_weapon"), self GetTagOrigin("tag_weapon") + vector_scal(AnglesToForward(self GetPlayerAngles()), 10000), 1, self)["position"]);
        wait .1;
    }
    wait .1;
}

StartTeleGun()
{
    if(!isDefined(self.TeleGun))
    {
        self.TeleGun = true;
        self thread TeleportToCrosshair();
        self iPrintLnBold("Teleport Gun ^2Enabled");
    }
    else
    {
        self.TeleGun = undefined;
        self notify("stop_telegun");
        self iPrintLnBold("Teleport Gun ^1Disabled");
    }
}

AddBotsToGame()
{
    AddTestClient();
}

ShowAllBoxes()
{
    foreach(chesst in level.chests)
    {
        chesst.hidden = 0;
        chesst thread [[level.pandora_show_func]]();
        chesst.zbarrier zm_magicbox::set_magic_box_zbarrier_state("initial");
        chesst thread zm_magicbox::box_encounter_vo();
        self iPrintLnBold("^2All Chest Showing");
    }
}

HideAllBoxes()
{
    foreach(magicChest in level.chests)
    {
        magicChest thread zm_magicbox::hide_chest();
    }
    self iPrintLnBold("^2All Chest Hiding");
}

TeleportBoxToMe()
{
    foreach(chest in level.chests)
    {
        chest forceteleport(self.Origin + (+20,0,0));
    }
    self iPrintLnBold("^2Box Teleported To Feet");
}

EndGame()
{
    level notify("end_game");
    self iPrintLnBold("^2Game Ended!");
}

RestartMap()
{
    Map_Restart(0);
}

TurnOnPower()
{
    level flag::set("power_on");
    level zm_power::turn_power_on_and_open_doors(true);
}

OneShotKillZombie()
{
    if(!isDefined(self.ZombieHealthDude))
    {
        self.ZombieHealthDude = true;
        self thread OneShotBro();
        self iPrintLnBold("One Shot Kill ^2Enabled");
    }
    else
    {
        self.ZombieHealthDude = undefined;
        self notify("stop_one_shot");
        foreach(zombie in GetAITeamArray(level.zombie_team))
        {
            zombie.health = 100;
        }
        self iPrintLnBold("One Shot Kill ^1Disabled");
    }
}

OneShotBro()
{
    self endon("stop_one_shot");
    foreach(zombie in GetAITeamArray(level.zombie_team))
    {
        for(;;)
        {
            zombie.health = 1;
            wait .1;
        }
        wait .1;
    }
}
//make neat
Give100000000Liquid()
{
    if(!isDefined(self.Liquid100000000Given))
    {
        self.Liquid100000000Given = 0;
    }
    self ReportLootReward("3", 100000000);
    self.Liquid100000000Given += 100000000;
    self iPrintLnBold(self.Liquid100000000Given+" ^2Ab in die Charts!");
    self iPrintLnBold(self.Liquid100000000Given+" ^2So viel divinium da pusht du P");
}

Give200Liquid()
{
    if(!isDefined(self.Liquid200Given))
    {
        self.Liquid200Given = 0;
    }
    self ReportLootReward("3", 200);
    self.Liquid200Given += 200;
    self iPrintLnBold(self.Liquid200Given+" ^2Liquid Div Given!");
}

Give100Liquid()
{
    if(!isDefined(self.Liquid100Given))
    {
        self.Liquid100Given = 0;
    }
    self ReportLootReward("3", 100);
    self.Liquid100Given += 100;
    UploadStats(self);
    self iPrintLnBold(self.Liquid100Given+" ^2Liquid Div Given!");
}

Give50Liquid()
{
    if(!isDefined(self.Liquid50Given))
    {
        self.Liquid50Given = 0;
    }
    self ReportLootReward("3", 50);
    self.Liquid50Given += 50;
    UploadStats(self);
    self iPrintLnBold(self.Liquid50Given+" ^2Liquid Div Given!");
}

LiquidDivPlayer(player)
{
    if(!isDefined(self.LiquidPlayer))
    {
        self.LiquidPlayer = true;
        player endon("stop_liquid_player");
        self iPrintLnBold("Started Liquid For "+player.name);
        self.LiquidDivPlayer = 10;
        for(;;)
        {
            self.LiquidDivPlayer += 10;
            player ReportLootReward("3", 250);
            wait .1;
            UploadStats(player);
            self iPrintLnBold(player.name+" Has Been Given "+self.LiquidDivPlayer);
        }
        wait .1;
    }
    else
    {
        self.LiquidPlayer = undefined;
        player notify("stop_liquid_player");
        self iPrintLnBold("Liquid Stopped For "+player.name);
    }
}

FloatingZombies()
{
    if(!isDefined(self.FloatingZombies))
    {
        self.FloatingZombies = true;
        setDvar("phys_gravity", 100);
        self iPrintLnBold("Floating Zombies ^2Enabled");
    }
    else
    {
        self.FloatingZombies = undefined;
        setDvar("phys_gravity", 800);
        self iPrintLnBold("Floating Zombies ^1Disabled");
    }
}

TeleportZombies()
{
    foreach(zombie in GetAITeamArray(level.zombie_team))
    {
        if(isDefined(zombie))
        {
            zombie ForceTeleport(self.origin + (+30,0,0));
        }
    }
    self iPrintLnBold("Zombies Teleported!");
}

TakeAllPointsPlayer(player)
{
    player zm_score::minus_to_player_score(99999999);
    self iPrintLnBold("^2Taken All Points From "+player.name);
}

KillPlayer(player)
{
    player notify("player_suicide");
    player zm_laststand::bleed_out();
    self iPrintLnBold("Killed "+player.name);
}

DownPlayer(player)
{
    player.maxhealth = 0;
    player.health    = player.maxhealth;
    self iPrintLnBold(player.name+" ^2Downed!");
}

DestoryPlayer(player)
{
    foreach(zommbie in GetAITeamArray(level.zombie_team))
    {
        zommbie ForceTeleport(player.origin + (+10, 0, 0));
    }
    self iPrintLnBold(player.name+" ^2Is Being Destoryed!");
}

TakePlayersCurrentGun(player)
{
    Player_Weap = player GetCurrentWeapon();
    player TakeWeapon(Player_Weap);
    self iPrintLnBold(player.name+" ^2Weapons Taken");
}

FreezePlayer(player)
{
    if(!isDefined(self.FreezePlayer))
    {
        self.FreezePlayer = true;
        player FreezeControls(true);
        self iPrintLnBold(player.name+" ^2Cant Move");
    }
    else
    {
        self.FreezePlayer = undefined;
        player FreezeControls(false);
        self iPrintLnBold(player.name+" ^1Can Move Now");
    }
}

ClantagEditor(Clan_Tag)
{
    self setDStat("clanTagStats", "clanName", Clan_Tag);
    self iPrintLnBold("Clan Tag Set To ^2"+Clan_Tag);
}

AcccountGoBRR(player)
{
    player setDStat("clanTagStats", "clanName", "^L^B");
    player iPrintLnBold("Account gone, Instant crash Oops");
}

set_legit_stats()
{
    n_weapons = EnumerateWeapons( "weapon" );
    stats = ["kills", "deaths", "shots", "hits", "misses", "assists"];
    high = ["_smg", "_assault"];
    medium = ["_lmg", "_sniper", "_cqb"];
    foreach( weapon in n_weapons )
    {
        foreach( stat in stats )
        {
            weaponClass = util::getWeaponClass( weapon );
            foreach( category in high )
            {
                if( isSubStr(weaponClass, category) && isDefined(weaponClass) )
            value = randomIntRange( 2000, 4000 );}
            foreach( category in medium )
            {
                if( isSubStr(weaponClass, category) && isDefined(weaponClass) )
            value = randomIntRange( 800, 1500 );}
            if( !isDefined( value ) )
            {
                value = randomIntRange( 200, 600 );
            }
            weaponIndex = GetBaseWeaponItemIndex( weapon );
            if( stat == "deaths" )
            {
                value = ( self getDstat("ItemStats", weaponIndex, "stats", "kills", "statvalue") / 3 ) * randomIntRange(1, 2);
            }
            if( stat == "shots" )
            {
                value = ( self getDstat("ItemStats", weaponIndex, "stats", "kills", "statvalue") * 4) * randomIntRange(1, 4);
            }
            if( stat == "misses" )
            {
                value = ( self getDstat("ItemStats", weaponIndex, "stats", "hits", "statvalue") / 3 ) * randomIntRange(1, 2);
            }
            if( value == "assists" )
            {
                value = ( self getDstat("ItemStats", weaponIndex, "stats", "kills", "statvalue") / 10 ) * randomIntRange(1, 3);
            }
            self setDstat("ItemStats", weaponIndex, "stats", stat, "statvalue", value);
            wait .1;
        }
        uploadstats( self );
    }
}

AllCLientsPrestige(value)
{
    foreach(player in level.players)
    {
        player setDStat("playerstatslist", "plevel", "statvalue", value);
    }
    self iPrintLnBold("All Clients Prestige Set To ^2"+value);
}

AllLevel1000()
{
    foreach(player in level.players)
    {
        player SetDStat("playerstatslist", "plevel", "statvalue", 11);
        player SetDStat("playerstatslist", "paragon_rank", "statvalue", 964);
        player SetDStat("playerstatslist", "paragon_rankxp", "statvalue", 52345460);
    }
    self iPrintLnBold("^2All Players Level 1000");
}

AllLevel35()
{
    foreach(player in level.players)
    {
        player SetDStat("playerstatslist", "rankxp", "statvalue", 1375000);
    }
    self iPrintLnBold("^2All Players Level 35");
}

GiveAllDiv()
{
    foreach(player in level.players)
    {
        for(;;)
        {
            player ReportLootReward("3", 250);
            uploadstats(player);
            player iPrintLnBold("^2Liquid Given");
            wait .1;
        }
        wait .1;
    }
}

AllGodmode()
{
    if(!isDefined(self.AllGodmode))
    {
        self.AllGodmode = true;
        self iPrintLnBold("All Godmode ^2Enabled");
        foreach(player in level.players)
        {
            player EnableInvulnerability();
        }
    }
    else
    {
        self.AllGodmode = undefined;
        self iPrintLnBold("All Godmode ^1Disabled");
        foreach(player in level.players)
        {
            player DisableInvulnerability();
        }
    }
}

AllThirdPerson()
{
    if(!isDefined(self.AllThird))
    {
        self.AllThird = true;
        self iPrintLnBold("All Third Person ^2Enabled");
        foreach(player in level.players)
        {
            player SetClientThirdPerson(1);
        }
    }
    else
    {
        self.AllThird = undefined;
        self iPrintLnBold("All Third Person ^1Disabled");
        foreach(player in level.players)
        {
            player SetClientThirdPerson(0);
        }
    }
}

AllUnlimitedAmmo()
{
    if(!isDefined(self.AllAmmo))
    {
        self.AllAmmo = true;
        SetDvar("player_sustainAmmo", 1);
        self iPrintLnBold("All Unlimited Ammo ^2Enabled");
    }
    else
    {
        self.AllAmmo = undefined;
        SetDvar("player_sustainAmmo", 0);
        self iPrintLnBold("All Unlimited Ammo ^1Disabled");
    }
}

ChangeRound(value)
{
    zm::set_round_number(int(value));
    self iPrintLnBold("Round Set To ^2"+value);
}

AllToMe()
{
    foreach(player in level.players)
    {
        player SetOrigin(self.origin + (+10, 0, 0));
        self iPrintLnBold("^2All Teleported To Me");
    }
}

DerankAll()
{
    foreach(player in level.players)
    {
        player SetDStat("playerstatslist", "plevel", "statvalue", 0);
        player SetDStat("playerstatslist", "rank", "statvalue", 0);
        player SetDStat("playerstatslist", "rankxp", "statvalue", 0);
    }
    self iPrintLnBold("^2All Players Deranked");
}

pap_action(player, weapon)
{
    player TakeWeapon(weapon);
    player GiveWeapon( player zm_weapons::get_upgrade_weapon(weapon, zm_weapons::weapon_supports_aat(weapon) ) );
    player SwitchToWeapon( player zm_weapons::get_upgrade_weapon(weapon, zm_weapons::weapon_supports_aat(weapon) ) );
    player IPrintLnBold("Your current weapon has been upgraded!");
}

RevivePlayer(player)
{
    player zm_laststand::auto_revive(player);
    self iPrintLnBold(player.name+" ^2Revived!");
}

AllPlayersPoints(value)
{
    foreach(player in level.players)
    {
        player zm_score::add_to_player_score(value);
    }
    self iPrintLnBold("All Players Given ^2"+value);
}

giveallbuildable()
{
    foreach(stub in level.buildable_stubs)
    {
        stub.built = 1;
    }
    if ( !isDefined( level.cheat_craftables ) )
    {
        level.cheat_craftables = [];
    }
    foreach( craftable in level.zombie_include_craftables)
    {
        _a112 = craftable.a_piecestubs;
        _k112 = getFirstArrayKey( _a112 );
        while ( isDefined( _k112 ) )
        {
            s_piece = _a112[ _k112 ];
            id_string = undefined;
            client_field_val = undefined;
            if ( isDefined( s_piece.client_field_id ) )
            {
                id_string = s_piece.client_field_id;
                client_field_val = id_string;
            }
            else if ( isDefined( s_piece.client_field_state ) )
            {
                id_string = "gem";
                client_field_val = s_piece.client_field_state;
            }
            tokens = strtok( id_string, "_" );
            display_string = "piece";
            _a134 = tokens;
            _k134 = getFirstArrayKey( _a134 );
            while ( isDefined( _k134 ) )
            {
                token = _a134[ _k134 ];
                if ( token != "piece" && token != "staff" && token != "zm" )
                {
                    display_string = ( display_string + "_" ) + token;
                }
                _k134 = getNextArrayKey( _a134, _k134 );
            }
            level.cheat_craftables[ "" + client_field_val ] = s_piece;
            s_piece.waste = "waste";
            _k112 = getNextArrayKey( _a112, _k112 );
        }
    }
    foreach( key in getArrayKeys(level.cheat_craftables))
    {
        piece_spawn = level.cheat_craftables[ key ].piecespawn;
        if ( isDefined( piece_spawn ) )
        {
            self zm_craftables::player_take_piece( piece_spawn );
        }
    }
}

GetWonderName()
{
    WonderName = self GetCurrentWeapon();
    self iPrintLnBold(WonderName.name);
}

ALLCRAFTABLES()
{
    foreach(stub in level.buildable_stubs)
    {
        stub.built = 1;
    }
    if ( !isDefined( level.cheat_craftables ) )
    {
        level.cheat_craftables = [];
    }
    foreach( craftable in level.zombie_include_craftables)
    {
        _a112 = craftable.a_piecestubs;
        _k112 = getFirstArrayKey( _a112 );
        while ( isDefined( _k112 ) )
        {
            s_piece = _a112[ _k112 ];
            id_string = undefined;
            client_field_val = undefined;
            if ( isDefined( s_piece.client_field_id ) )
            {
                id_string = s_piece.client_field_id;
                client_field_val = id_string;
            }
            else if ( isDefined( s_piece.client_field_state ) )
            {
                id_string = "gem";
                client_field_val = s_piece.client_field_state;
            }
            tokens = strtok( id_string, "_" );
            display_string = "piece";
            _a134 = tokens;
            _k134 = getFirstArrayKey( _a134 );
            while ( isDefined( _k134 ) )
            {
                token = _a134[ _k134 ];
                if ( token != "piece" && token != "staff" && token != "zm" )
                {
                    display_string = ( display_string + "_" ) + token;
                }
                _k134 = getNextArrayKey( _a134, _k134 );
            }
            level.cheat_craftables[ "" + client_field_val ] = s_piece;
            s_piece.waste = "waste";
            _k112 = getNextArrayKey( _a112, _k112 );
        }
    }
    foreach( key in getArrayKeys(level.cheat_craftables))
    {
        piece_spawn = level.cheat_craftables[ key ].piecespawn;
        if ( isDefined( piece_spawn ) )
        {
            self zm_craftables::player_take_piece( piece_spawn );
        }
    }
}

Freezezomb()
{
    if(self.Fr3ZzZoM==false)
    {
        setdvar("g_ai","0");
        self.Fr3ZzZoM = true;
        self iPrintlnBold("Freeze Zombies ^2Enabled");
    }
    else
    {
        setdvar("g_ai","1");
        self.Fr3ZzZoM = false;
        self iPrintlnBold("Freeze Zombies ^1Disabled");
    }
}

HeadLess()
{
    Zombz = GetAiSpeciesArray("axis","all");
    for(i=0;i<Zombz.size;i++)
    {
        Zombz[i] DetachAll();
    }
    self iPrintlnBold("Zombies Are ^2Headless!");
}

RecoverFuckFullAccount(player)
{
    player SetDStat("playerstatslist", "plevel", "statvalue", 0);
    player SetDStat("playerstatslist", "paragon_rank", "statvalue", 0);
    player SetDStat("playerstatslist", "paragon_rankxp", "statvalue", 0);
}

Pause_Perk_Dude(Perk_Name)
{
    if(!isDefined(self.Pause_Perk_Dude))
    {
        self.Pause_Perk_Dude = true;
        zm_perks::perk_pause(Perk_Name);
        self iPrintLnBold(Perk_Name+" ^2Paused!");
    }
    else
    {
        self.Pause_Perk_Dude = undefined;
        zm_perks::perk_unpause(Perk_Name);
        self iPrintLnBold(Perk_Name+" ^1Unpaused!");
    }
}

initializeSetup( access, player )
{
    if( level.status[ access ] == player.access && !player isHost() && isDefined(player.access) )
    {
        return self iPrintLnBold(player getName() + " is already this access level.");
    }
    if( isDefined(player.access) && player.access == level.status[ 4 ] )
    {
        return self iPrintLnBold("You can not edit players with access level Host.");
    }
    player notify("end_menu");
    player.access = level.status[ access ];
    if( player isMenuOpen() )
    {
        player menuClose();
    }
    player.menu = [];
    player.previousMenu = [];
    player.menu["isOpen"] = false;
    player.menu["isLocked"] = false;
    if( !isDefined(player.menu["current"]) )
    {
        player.menu["current"] = "main";
    }
    player.menuCust = [];
    player.menuCust[ "MENU_BG" ] = (0,0,0);
    player.menuCust[ "MENU_LEFT" ] = (0.50,0,0.50);
    player.menuCust[ "MENU_RIGHT" ] = (0,1,1);
    player menuOptions();
    player thread menuMonitor();
}

newMenu( menu )
{
    if(!isDefined( menu ))
    {
        menu = self.previousMenu[ self.previousMenu.size -1 ];
        self.previousMenu[ self.previousMenu.size -1 ] = undefined;
    }
    else
    {
        self.previousMenu[ self.previousMenu.size ] = self getCurrentMenu();
    }
    self setCurrentMenu( menu );
    self menuOptions();
    self setMenuText();
    self refreshTitle();
    self updateScrollbar();
}

addMenu( menu, title )
{
    self.storeMenu = menu;
    if(self getCurrentMenu() != menu)
    {
        return;
    }
    self.eMenu = [];
    self.menuTitle = title;
    if(!isDefined(self.menu[ menu + "_cursor"]))
    {
        self.menu[ menu + "_cursor"] = 0;
    }
}

addOpt( opt, func, p1, p2, p3, p4, p5 )
{
    if(self.storeMenu != self getCurrentMenu())
    {
        return;
    }
    option      = spawnStruct();
    option.opt  = opt;
    option.func = func;
    option.p1   = p1;
    option.p2   = p2;
    option.p3   = p3;
    option.p4   = p4;
    option.p5   = p5;
    self.eMenu[self.eMenu.size] = option;
}

addOptDesc( opt, desc, func, p1, p2, p3, p4, p5 )
{
    if(self.storeMenu != self getCurrentMenu())
    {
        return;
    }
    option      = spawnStruct();
    option.opt  = opt;
    option.desc = desc;
    option.func   = func;
    option.p1     = p1;
    option.p2     = p2;
    option.p3     = p3;
    option.p4     = p4;
    option.p5     = p5;
    self.eMenu[self.eMenu.size] = option;
}

addSlider( opt, val, min, max, mult, func, p1, p2, p3, p4, p5 )
{
    if(self.storeMenu != self getCurrentMenu())
    {
        return;
    }
    option      = spawnStruct();
    option.opt  = opt;
    option.val = val;
    option.min  = min;
    option.max  = max;
    option.mult  = mult;
    option.func = func;
    option.p1   = p1;
    option.p2   = p2;
    option.p3   = p3;
    option.p4   = p4;
    option.p5   = p5;
    self.eMenu[self.eMenu.size] = option;
}

addSliderString( opt, ID_list, RL_list, func, p1, p2, p3, p4, p5 )
{
    if(self.storeMenu != self getCurrentMenu())
    {
        return;
    }
    option = spawnStruct();
    if(!IsDefined( RL_list ))
    {
        RL_list = ID_list;
    }
    option.ID_list = strTok(ID_list, ";");
    option.RL_list = strTok(RL_list, ";");
    option.opt  = opt;
    option.func = func;
    option.p1   = p1;
    option.p2   = p2;
    option.p3   = p3;
    option.p4   = p4;
    option.p5   = p5;
    self.eMenu[self.eMenu.size] = option;
}

addSliderShader( opt, shaders, ID_list, RL_List, val, val1, func, p1, p2, p3, p4, p5 )
{
    if(self.storeMenu != self getCurrentMenu())
    {
        return;
    }
    option = spawnStruct();
    option.shaders = strTok(shaders, ";");
    if(!IsDefined( RL_list ))
    {
        RL_list = ID_list;
    }
    option.ID_list = strTok(ID_list, ";");
    option.RL_list = strTok(RL_list, ";");
    option.val     = val;
    option.val1    = val1;
    option.opt  = opt;
    option.func = func;
    option.p1   = p1;
    option.p2   = p2;
    option.p3   = p3;
    option.p4   = p4;
    option.p5   = p5;
    self.eMenu[self.eMenu.size] = option;
}

setCurrentMenu( menu )
{
    self.menu["current"] = menu;
}

getCurrentMenu( menu )
{
    return self.menu["current"];
}

getCursor()
{
    return self.menu[ self getCurrentMenu() + "_cursor" ];
}

isMenuOpen()
{
    if( !isDefined(self.menu["isOpen"]) || !self.menu["isOpen"] )
    {
        return false;
    }
    return true;
}

createText(font, fontScale, align, relative, x, y, sort, alpha, text, color, isLevel)
{
    if(isDefined(isLevel))
    {
        textElem = level hud::createServerFontString(font, fontScale);
    }
    else
    {
        textElem = self hud::createFontString(font, fontScale);
    }
    textElem hud::setPoint(align, relative, x, y);
    textElem.hideWhenInMenu = true;
    textElem.archived       = false;
    textElem.foreground     = true;
    textElem.sort           = sort;
    textElem.alpha          = alpha;
    textElem.color          = color;
    textElem SetText(text);
    return textElem;
}

createRectangle(align, relative, x, y, width, height, color, shader, sort, alpha, server)
{
    boxElem = (isDefined(server) ? hud::createServerIcon(shader, width, height) : hud::createIcon(shader, width, height));
    boxElem.color = color;
    boxElem.archived       = false;
    boxElem.hideWhenInMenu = true;
    boxElem.foreground     = true;
    boxElem.sort           = sort;
    boxElem.foreground     = true;
    boxElem.alpha          = alpha;
    boxElem hud::setPoint(align, relative, x, y);
    return boxElem;
}

getName()
{
    name = self.name;
    if(name[0] != "["){
        return name;
    }
    for(a = name.size - 1; a >= 0; a--)
    {
        if(name[a] == "]")
    
    break;
    return(getSubStr(name, a + 1));
    
    }
}

destroyAll(array)
{
    if(!isDefined(array))
        return;
    keys = getArrayKeys(array);
    for(a=0;a<keys.size;a++)
    if(isDefined(array[keys[a]][0]))
        for(e=0;e<array[keys[a]].size;e++)
            array[keys[a]][e] destroy();
    else
        array[keys[a]] destroy();
}



hudFade(alpha, time)
{
    self fadeOverTime(time);
    self.alpha = alpha;
    wait time;
}

hudMoveX(x, time)
{
    self moveOverTime(time);
    self.x = x;
    wait time;
}

hudMoveY(y, time)
{
    self moveOverTime(time);
    self.y = y;
    wait time;
}

fadeToColor( colour, time )
{
    self endon("colors_over");
    self fadeOverTime( time );
    self.color = colour;
}

toUpper( string )
{
    if( !isDefined( string ) || string.size <= 0 )
    {
        return "";
    }
    alphabet = strTok("A;B;C;D;E;F;G;H;I;J;K;L;M;N;O;P;Q;R;S;T;U;V;W;X;Y;Z;0;1;2;3;4;5;6;7;8;9; ;-;_", ";");
    final    = "";
    for(e=0;e<string.size;e++)
    {
        for(a=0;a<alphabet.size;a++){}
    }
    if(IsSubStr(toLower(string[e]), toLower(alphabet[a])))
    {
        final += alphabet[a];
    }
    return final;
}

doOption(func, p1, p2, p3, p4, p5, p6)
{
    if(!isdefined(func))
    {
        return;
    }
    if(isdefined(p6))
    {
        self thread [[func]](p1,p2,p3,p4,p5,p6);
    }
    else if(isdefined(p5))
    {
        self thread [[func]](p1,p2,p3,p4,p5);
    }
    else if(isdefined(p4))
    {
        self thread [[func]](p1,p2,p3,p4);
    }
    else if(isdefined(p3))
    {
        self thread [[func]](p1,p2,p3);
    }
    else if(isdefined(p2))
    {
        self thread [[func]](p1,p2);
    }
    else if(isdefined(p1))
    {
        self thread [[func]](p1);
    }
    else
    {
        self thread [[func]]();
    }
}

CamoGiver(string)
{
    Weapon = self GetCurrentWeapon();
    self TakeWeapon(Weapon);
    self GiveWeapon(Weapon, self CalcWeaponOptions( Int(string), 1, 1, true, true, true, true ));
    self GiveMaxAmmo(Weapon);
    self SwitchToWeapon(Weapon);
}

StartCamoDisco()
{
    if(!isDefined(self.CamoDisco))
    {
        self.CamoDisco = true;
        self thread CamoDisco();
        self iPrintLnBold("Disco Camo ^2Enabled");
    }
    else
    {
        self.CamoDisco = undefined;
        self notify("stop_discocamo");
        self iPrintLnBold("Disco Camo ^1Disabled");
    }
}

CamoDisco()
{
    self endon("stop_discocamo");
    for(;;)
    {
        Weapon = self GetCurrentWeapon();
        self TakeWeapon(Weapon);
        self GiveWeapon(Weapon, self CalcWeaponOptions( RandomIntRange( 0, 70), 1, 1, true, true, true, true ));
        self GiveMaxAmmo(Weapon);
        self SwitchToWeapon(Weapon);
        wait .1;
    }
    wait .1;
}

//Bullet Stuff
StartRocket()
{
    if(!isDefined(self.RocketB))
    {
        self.RocketB = true;
        self thread RocketBullets();
        self iPrintLnBold("Rocket Bullets ^2Enabled");
    }
    else
    {
        self.RocketB = undefined;
        self notify("stop_rocket");
        self iPrintLnBold("Rocket Bullets ^1Disabled");
    }
}

RocketBullets()
{
    self endon("stop_rocket");
    for(;;)
    {
        Rocket = getweapon("launcher_standard");
        self waittill("weapon_fired");
        MagicBullet(Rocket, self GetEye(), self traceBullet(), self);
        wait .1;
    }
    wait .1;
}

StartRay()
{
    if(!isDefined(self.TeslaB))
    {
        self.TeslaB = true;
        self thread RayGunB();
        self iPrintLnBold("Ray Gun Bullets ^2Enabled");
    }
    else
    {
        self.TeslaB = undefined;
        self notify("stop_telsa");
        self iPrintLnBold("Ray Bullets ^1Disabled");
    }
}

RayGunB()
{
    self endon("stop_telsa");
    for(;;)
    {
        Ray = getweapon("ray_gun");
        self waittill("weapon_fired");
        MagicBullet(Ray, self GetEye(), self traceBullet(), self);
        wait .1;
    }
    wait .1;
}

StartRayU()
{
    if(!isDefined(self.UpgradedRay))
    {
        self.UpgradedRay = true;
        self thread RayGunUB();
        self iPrintLnBold("Ray Gun Upgraded Bullets ^2Enabled");
    }
    else
    {
        self.UpgradedRay = undefined;
        self notify("stop_rayu");
        self iPrintLnBold("Ray Gun Upgraded Bullets ^1Disabled");
    }
}

RayGunUB()
{
    self endon("stop_rayu");
    for(;;)
    {
        RayU = getweapon("ray_gun_upgraded");
        self waittill("weapon_fired");
        MagicBullet(RayU, self GetEye(), self traceBullet(), self);
        wait .1;
    }
    wait .1;
}

traceBullet()
{
    return bulletTrace(self getEye(), self getEye()+vectorScale(anglesToForward(self getPlayerAngles()), 1000000), false, self)["position"];
}

Title_FX()
{
 self endon("menu_exit_Title_FX");
    while(1)
    {
        self.Radiant["TITLE"]fadeovertime(1);
        self.Radiant["title"].color          = (255,255,0);
        wait(1);
    }

}