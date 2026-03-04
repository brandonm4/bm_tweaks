BEGIN ~BMSCRKIT~

IF
  ~OR(2)
ActuallyInCombat()
Detect([ENEMY])~
THEN BEGIN bm_scrollkit_busy
  SAY ~You cannot use the scroll scribing kit while enemies are nearby.~
    IF ~~ THEN EXIT
END

IF ~!Class(LastTalkedToBy(Myself),CLERIC)
!Class(LastTalkedToBy(Myself),CLERIC_MAGE)
!Class(LastTalkedToBy(Myself),FIGHTER_CLERIC)
!Class(LastTalkedToBy(Myself),CLERIC_RANGER)
!Class(LastTalkedToBy(Myself),CLERIC_THIEF)
!Class(LastTalkedToBy(Myself),FIGHTER_MAGE_CLERIC)
!Class(LastTalkedToBy(Myself),SHAMAN)
!Class(LastTalkedToBy(Myself),MAGE)
!Class(LastTalkedToBy(Myself),SORCERER)
!Class(LastTalkedToBy(Myself),FIGHTER_MAGE)
!Class(LastTalkedToBy(Myself),FIGHTER_MAGE_THIEF)
!Class(LastTalkedToBy(Myself),MAGE_THIEF)~ THEN BEGIN bm_scrollkit_invalid_target
  SAY ~The scroll scribing kit can only be used on party members who cast from cleric or wizard spellbooks.~
    IF ~~ THEN REPLY ~Put the kit away.~ EXIT
END

IF ~OR(12)
Class(LastTalkedToBy(Myself),CLERIC)
Class(LastTalkedToBy(Myself),CLERIC_MAGE)
Class(LastTalkedToBy(Myself),FIGHTER_CLERIC)
Class(LastTalkedToBy(Myself),CLERIC_RANGER)
Class(LastTalkedToBy(Myself),CLERIC_THIEF)
Class(LastTalkedToBy(Myself),FIGHTER_MAGE_CLERIC)
Class(LastTalkedToBy(Myself),SHAMAN)
Class(LastTalkedToBy(Myself),MAGE)
Class(LastTalkedToBy(Myself),SORCERER)
Class(LastTalkedToBy(Myself),FIGHTER_MAGE)
Class(LastTalkedToBy(Myself),FIGHTER_MAGE_THIEF)
Class(LastTalkedToBy(Myself),MAGE_THIEF)~ THEN BEGIN bm_scrollkit_main
  SAY ~The scroll scribing kit is open.~
    IF ~OR(6) Class(LastTalkedToBy(Myself),CLERIC) Class(LastTalkedToBy(Myself),CLERIC_MAGE) Class(LastTalkedToBy(Myself),FIGHTER_CLERIC) Class(LastTalkedToBy(Myself),CLERIC_RANGER) Class(LastTalkedToBy(Myself),CLERIC_THIEF) Class(LastTalkedToBy(Myself),FIGHTER_MAGE_CLERIC)~ THEN REPLY ~Craft a priest scroll.~ GOTO ~bm_scrollkit_divine_menu~
    IF ~OR(7) Class(LastTalkedToBy(Myself),MAGE) Class(LastTalkedToBy(Myself),SORCERER) Class(LastTalkedToBy(Myself),CLERIC_MAGE) Class(LastTalkedToBy(Myself),FIGHTER_MAGE) Class(LastTalkedToBy(Myself),FIGHTER_MAGE_CLERIC) Class(LastTalkedToBy(Myself),FIGHTER_MAGE_THIEF) Class(LastTalkedToBy(Myself),MAGE_THIEF)~ THEN REPLY ~Craft a wizard scroll.~ GOTO ~bm_scrollkit_arcane_menu~
    IF ~Class(LastTalkedToBy(Myself),SHAMAN)~ THEN REPLY ~Craft a priest scroll.~ GOTO ~bm_scrollkit_divine_menu~
    IF ~~ THEN REPLY ~Put the kit away.~ EXIT
END

IF ~~ THEN BEGIN bm_scrollkit_arcane_menu
  SAY ~Which wizard spell circle do you want to scribe from?~
    IF ~~ THEN REPLY ~Level 1~ GOTO ~bm_scrollkit_arcane_circle_1~
    IF ~~ THEN REPLY ~Level 2~ GOTO ~bm_scrollkit_arcane_circle_2~
    IF ~~ THEN REPLY ~Level 3~ GOTO ~bm_scrollkit_arcane_circle_3~
    IF ~~ THEN REPLY ~Level 4~ GOTO ~bm_scrollkit_arcane_circle_4~
    IF ~~ THEN REPLY ~Level 5~ GOTO ~bm_scrollkit_arcane_circle_5~
    IF ~~ THEN REPLY ~Level 6~ GOTO ~bm_scrollkit_arcane_circle_6~
    IF ~~ THEN REPLY ~Level 7~ GOTO ~bm_scrollkit_arcane_circle_7~
    IF ~~ THEN REPLY ~Level 8~ GOTO ~bm_scrollkit_arcane_circle_8~
    IF ~~ THEN REPLY ~Level 9~ GOTO ~bm_scrollkit_arcane_circle_9~
    IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_main~
    IF ~~ THEN REPLY ~Put the kit away.~ EXIT
END

IF ~~ THEN BEGIN bm_scrollkit_divine_menu
  SAY ~Which priest spell circle do you want to scribe from?~
    IF ~~ THEN REPLY ~Level 1~ GOTO ~bm_scrollkit_divine_circle_1~
    IF ~~ THEN REPLY ~Level 2~ GOTO ~bm_scrollkit_divine_circle_2~
    IF ~~ THEN REPLY ~Level 3~ GOTO ~bm_scrollkit_divine_circle_3~
    IF ~~ THEN REPLY ~Level 4~ GOTO ~bm_scrollkit_divine_circle_4~
    IF ~~ THEN REPLY ~Level 5~ GOTO ~bm_scrollkit_divine_circle_5~
    IF ~~ THEN REPLY ~Level 6~ GOTO ~bm_scrollkit_divine_circle_6~
    IF ~~ THEN REPLY ~Level 7~ GOTO ~bm_scrollkit_divine_circle_7~
    IF ~~ THEN REPLY ~Level 8~ GOTO ~bm_scrollkit_divine_circle_8~
    IF ~~ THEN REPLY ~Level 9~ GOTO ~bm_scrollkit_divine_circle_9~
    IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_main~
    IF ~~ THEN REPLY ~Put the kit away.~ EXIT
END

IF ~~ THEN BEGIN bm_scrollkit_arcane_circle_1
  SAY ~Choose a spell to scribe.~
  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("MEWI151"))~ THEN REPLY ~Disruptive Surge~ GOTO ~bm_scrollkit_confirm_MEWI151~
  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("MEWI152"))~ THEN REPLY ~Inertia~ GOTO ~bm_scrollkit_confirm_MEWI152~
  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("MEWI160"))~ THEN REPLY ~Dimensional Chest~ GOTO ~bm_scrollkit_confirm_MEWI160~


  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI101"))~ THEN REPLY #226344 GOTO ~bm_scrollkit_confirm_SPWI101~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI102"))~ THEN REPLY #272404 GOTO ~bm_scrollkit_confirm_SPWI102~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI103"))~ THEN REPLY #226349 GOTO ~bm_scrollkit_confirm_SPWI103~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI104"))~ THEN REPLY #225908 GOTO ~bm_scrollkit_confirm_SPWI104~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI105"))~ THEN REPLY #226071 GOTO ~bm_scrollkit_confirm_SPWI105~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI106"))~ THEN REPLY #272223 GOTO ~bm_scrollkit_confirm_SPWI106~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI107"))~ THEN REPLY #226336 GOTO ~bm_scrollkit_confirm_SPWI107~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI108"))~ THEN REPLY #13019 GOTO ~bm_scrollkit_confirm_SPWI108~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI109"))~ THEN REPLY #272451 GOTO ~bm_scrollkit_confirm_SPWI109~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI110"))~ THEN REPLY #226360 GOTO ~bm_scrollkit_confirm_SPWI110~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI111"))~ THEN REPLY #272414 GOTO ~bm_scrollkit_confirm_SPWI111~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI112"))~ THEN REPLY #225940 GOTO ~bm_scrollkit_confirm_SPWI112~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI113"))~ THEN REPLY #272205 GOTO ~bm_scrollkit_confirm_SPWI113~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI114"))~ THEN REPLY #226366 GOTO ~bm_scrollkit_confirm_SPWI114~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI115"))~ THEN REPLY #226369 GOTO ~bm_scrollkit_confirm_SPWI115~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI116"))~ THEN REPLY #226371 GOTO ~bm_scrollkit_confirm_SPWI116~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI117"))~ THEN REPLY #226372 GOTO ~bm_scrollkit_confirm_SPWI117~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI118"))~ THEN REPLY #225859 GOTO ~bm_scrollkit_confirm_SPWI118~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI119"))~ THEN REPLY #225892 GOTO ~bm_scrollkit_confirm_SPWI119~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI120"))~ THEN REPLY #230204 GOTO ~bm_scrollkit_confirm_SPWI120~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI121"))~ THEN REPLY #272453 GOTO ~bm_scrollkit_confirm_SPWI121~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI122"))~ THEN REPLY #226156 GOTO ~bm_scrollkit_confirm_SPWI122~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI123"))~ THEN REPLY #230206 GOTO ~bm_scrollkit_confirm_SPWI123~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI125"))~ THEN REPLY #230264 GOTO ~bm_scrollkit_confirm_SPWI125~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI126"))~ THEN REPLY #103587 GOTO ~bm_scrollkit_confirm_SPWI126~

  IF ~~ THEN REPLY ~Choose a different spell circle.~ GOTO ~bm_scrollkit_arcane_menu~

  IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_main~

  IF ~~ THEN REPLY ~Put the kit away.~ EXIT
END

IF ~~ THEN BEGIN bm_scrollkit_arcane_circle_2
  SAY ~Choose a spell to scribe.~
  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("MEWI251"))~ THEN REPLY ~Power Word, Pull~ GOTO ~bm_scrollkit_confirm_MEWI251~
  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("MEWI253"))~ THEN REPLY ~Power Word, Push~ GOTO ~bm_scrollkit_confirm_MEWI253~
  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("MEWI254"))~ THEN REPLY ~Intoxicate~ GOTO ~bm_scrollkit_confirm_MEWI254~
  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("MEWI255"))~ THEN REPLY ~Null Healing~ GOTO ~bm_scrollkit_confirm_MEWI255~
  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("MEWI258"))~ THEN REPLY ~Bounce Spell~ GOTO ~bm_scrollkit_confirm_MEWI258~


  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI201"))~ THEN REPLY #226078 GOTO ~bm_scrollkit_confirm_SPWI201~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI203"))~ THEN REPLY #226382 GOTO ~bm_scrollkit_confirm_SPWI203~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI204"))~ THEN REPLY #272242 GOTO ~bm_scrollkit_confirm_SPWI204~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI205"))~ THEN REPLY #225894 GOTO ~bm_scrollkit_confirm_SPWI205~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI206"))~ THEN REPLY #225906 GOTO ~bm_scrollkit_confirm_SPWI206~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI207"))~ THEN REPLY #272460 GOTO ~bm_scrollkit_confirm_SPWI207~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI208"))~ THEN REPLY #272240 GOTO ~bm_scrollkit_confirm_SPWI208~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI209"))~ THEN REPLY #226390 GOTO ~bm_scrollkit_confirm_SPWI209~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI210"))~ THEN REPLY #226391 GOTO ~bm_scrollkit_confirm_SPWI210~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI211"))~ THEN REPLY #226393 GOTO ~bm_scrollkit_confirm_SPWI211~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI212"))~ THEN REPLY #225959 GOTO ~bm_scrollkit_confirm_SPWI212~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI213"))~ THEN REPLY #226074 GOTO ~bm_scrollkit_confirm_SPWI213~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI214"))~ THEN REPLY #226014 GOTO ~bm_scrollkit_confirm_SPWI214~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI215"))~ THEN REPLY #225864 GOTO ~bm_scrollkit_confirm_SPWI215~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI216"))~ THEN REPLY #226339 GOTO ~bm_scrollkit_confirm_SPWI216~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI217"))~ THEN REPLY #226105 GOTO ~bm_scrollkit_confirm_SPWI217~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI218"))~ THEN REPLY #226398 GOTO ~bm_scrollkit_confirm_SPWI218~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI219"))~ THEN REPLY #226400 GOTO ~bm_scrollkit_confirm_SPWI219~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI220"))~ THEN REPLY #272472 GOTO ~bm_scrollkit_confirm_SPWI220~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI221"))~ THEN REPLY #5005 GOTO ~bm_scrollkit_confirm_SPWI221~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI223"))~ THEN REPLY #267475 GOTO ~bm_scrollkit_confirm_SPWI223~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI224"))~ THEN REPLY #230260 GOTO ~bm_scrollkit_confirm_SPWI224~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI225"))~ THEN REPLY #272792 GOTO ~bm_scrollkit_confirm_SPWI225~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI226"))~ THEN REPLY #272794 GOTO ~bm_scrollkit_confirm_SPWI226~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI227"))~ THEN REPLY #272796 GOTO ~bm_scrollkit_confirm_SPWI227~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI228"))~ THEN REPLY #99992 GOTO ~bm_scrollkit_confirm_SPWI228~

  IF ~~ THEN REPLY ~Choose a different spell circle.~ GOTO ~bm_scrollkit_arcane_menu~

  IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_main~

  IF ~~ THEN REPLY ~Put the kit away.~ EXIT
END

IF ~~ THEN BEGIN bm_scrollkit_arcane_circle_3
  SAY ~Choose a spell to scribe.~
  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("MEWI351"))~ THEN REPLY ~Absorb Spell~ GOTO ~bm_scrollkit_confirm_MEWI351~
  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("MEWI353"))~ THEN REPLY ~Displacement~ GOTO ~bm_scrollkit_confirm_MEWI353~
  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("MEWI354"))~ THEN REPLY ~Terror~ GOTO ~bm_scrollkit_confirm_MEWI354~
  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("MEWI356"))~ THEN REPLY ~Legend Lore~ GOTO ~bm_scrollkit_confirm_MEWI356~
  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("MEWI357"))~ THEN REPLY ~Glyph of Spell Storing~ GOTO ~bm_scrollkit_confirm_MEWI357~
  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("MEWI361"))~ THEN REPLY ~Mestil's Acid Breath~ GOTO ~bm_scrollkit_confirm_MEWI361~


  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI301"))~ THEN REPLY #226415 GOTO ~bm_scrollkit_confirm_SPWI301~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI302"))~ THEN REPLY #225819 GOTO ~bm_scrollkit_confirm_SPWI302~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI303"))~ THEN REPLY #226418 GOTO ~bm_scrollkit_confirm_SPWI303~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI304"))~ THEN REPLY #231779 GOTO ~bm_scrollkit_confirm_SPWI304~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI305"))~ THEN REPLY #226018 GOTO ~bm_scrollkit_confirm_SPWI305~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI306"))~ THEN REPLY #226106 GOTO ~bm_scrollkit_confirm_SPWI306~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI307"))~ THEN REPLY #272485 GOTO ~bm_scrollkit_confirm_SPWI307~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI308"))~ THEN REPLY #225852 GOTO ~bm_scrollkit_confirm_SPWI308~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI309"))~ THEN REPLY #226494 GOTO ~bm_scrollkit_confirm_SPWI309~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI310"))~ THEN REPLY #226423 GOTO ~bm_scrollkit_confirm_SPWI310~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI311"))~ THEN REPLY #272194 GOTO ~bm_scrollkit_confirm_SPWI311~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI312"))~ THEN REPLY #226103 GOTO ~bm_scrollkit_confirm_SPWI312~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI313"))~ THEN REPLY #226426 GOTO ~bm_scrollkit_confirm_SPWI313~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI314"))~ THEN REPLY #225896 GOTO ~bm_scrollkit_confirm_SPWI314~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI315"))~ THEN REPLY #13065 GOTO ~bm_scrollkit_confirm_SPWI315~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI316"))~ THEN REPLY #226328 GOTO ~bm_scrollkit_confirm_SPWI316~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI317"))~ THEN REPLY #226429 GOTO ~bm_scrollkit_confirm_SPWI317~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI318"))~ THEN REPLY #230210 GOTO ~bm_scrollkit_confirm_SPWI318~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI321"))~ THEN REPLY #230216 GOTO ~bm_scrollkit_confirm_SPWI321~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI322"))~ THEN REPLY #230218 GOTO ~bm_scrollkit_confirm_SPWI322~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI323"))~ THEN REPLY #272290 GOTO ~bm_scrollkit_confirm_SPWI323~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI324"))~ THEN REPLY #272498 GOTO ~bm_scrollkit_confirm_SPWI324~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI325"))~ THEN REPLY #230262 GOTO ~bm_scrollkit_confirm_SPWI325~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI327"))~ THEN REPLY #272799 GOTO ~bm_scrollkit_confirm_SPWI327~

  IF ~~ THEN REPLY ~Choose a different spell circle.~ GOTO ~bm_scrollkit_arcane_menu~

  IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_main~

  IF ~~ THEN REPLY ~Put the kit away.~ EXIT
END

IF ~~ THEN BEGIN bm_scrollkit_arcane_circle_4
  SAY ~Choose a spell to scribe.~
  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("MEWI451"))~ THEN REPLY ~Wall of Fire~ GOTO ~bm_scrollkit_confirm_MEWI451~
  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("MEWI452"))~ THEN REPLY ~Phantasmal Killer~ GOTO ~bm_scrollkit_confirm_MEWI452~
  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("MEWI453"))~ THEN REPLY ~Ghoulish Feast~ GOTO ~bm_scrollkit_confirm_MEWI453~
  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("MEWI454"))~ THEN REPLY ~Backstab Sequencer~ GOTO ~bm_scrollkit_confirm_MEWI454~
  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("MEWI457"))~ THEN REPLY ~Linked Portals~ GOTO ~bm_scrollkit_confirm_MEWI457~


  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI401"))~ THEN REPLY #225968 GOTO ~bm_scrollkit_confirm_SPWI401~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI404"))~ THEN REPLY #230198 GOTO ~bm_scrollkit_confirm_SPWI404~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI405"))~ THEN REPLY #225868 GOTO ~bm_scrollkit_confirm_SPWI405~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI406"))~ THEN REPLY #226448 GOTO ~bm_scrollkit_confirm_SPWI406~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI408"))~ THEN REPLY #230200 GOTO ~bm_scrollkit_confirm_SPWI408~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI409"))~ THEN REPLY #230268 GOTO ~bm_scrollkit_confirm_SPWI409~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI410"))~ THEN REPLY #272268 GOTO ~bm_scrollkit_confirm_SPWI410~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI411"))~ THEN REPLY #226455 GOTO ~bm_scrollkit_confirm_SPWI411~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI412"))~ THEN REPLY #226457 GOTO ~bm_scrollkit_confirm_SPWI412~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI413"))~ THEN REPLY #226027 GOTO ~bm_scrollkit_confirm_SPWI413~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI414"))~ THEN REPLY #226459 GOTO ~bm_scrollkit_confirm_SPWI414~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI415"))~ THEN REPLY #226057 GOTO ~bm_scrollkit_confirm_SPWI415~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI416"))~ THEN REPLY #226461 GOTO ~bm_scrollkit_confirm_SPWI416~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI417"))~ THEN REPLY #5010 GOTO ~bm_scrollkit_confirm_SPWI417~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI418"))~ THEN REPLY #213070 GOTO ~bm_scrollkit_confirm_SPWI418~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI419"))~ THEN REPLY #230226 GOTO ~bm_scrollkit_confirm_SPWI419~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI420"))~ THEN REPLY #272521 GOTO ~bm_scrollkit_confirm_SPWI420~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI421"))~ THEN REPLY #226473 GOTO ~bm_scrollkit_confirm_SPWI421~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI422"))~ THEN REPLY #272527 GOTO ~bm_scrollkit_confirm_SPWI422~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI423"))~ THEN REPLY #34580 GOTO ~bm_scrollkit_confirm_SPWI423~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI424"))~ THEN REPLY #230272 GOTO ~bm_scrollkit_confirm_SPWI424~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI425"))~ THEN REPLY #230256 GOTO ~bm_scrollkit_confirm_SPWI425~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI426"))~ THEN REPLY #272529 GOTO ~bm_scrollkit_confirm_SPWI426~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI427"))~ THEN REPLY #272801 GOTO ~bm_scrollkit_confirm_SPWI427~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI428"))~ THEN REPLY #272803 GOTO ~bm_scrollkit_confirm_SPWI428~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI429"))~ THEN REPLY #272805 GOTO ~bm_scrollkit_confirm_SPWI429~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI430"))~ THEN REPLY #272807 GOTO ~bm_scrollkit_confirm_SPWI430~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI431"))~ THEN REPLY #272811 GOTO ~bm_scrollkit_confirm_SPWI431~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI432"))~ THEN REPLY #272812 GOTO ~bm_scrollkit_confirm_SPWI432~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI433"))~ THEN REPLY #272859 GOTO ~bm_scrollkit_confirm_SPWI433~

  IF ~~ THEN REPLY ~Choose a different spell circle.~ GOTO ~bm_scrollkit_arcane_menu~

  IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_main~

  IF ~~ THEN REPLY ~Put the kit away.~ EXIT
END

IF ~~ THEN BEGIN bm_scrollkit_arcane_circle_5
  SAY ~Choose a spell to scribe.~
  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("MEWI551"))~ THEN REPLY ~Life Transfer~ GOTO ~bm_scrollkit_confirm_MEWI551~
  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("MEWI554"))~ THEN REPLY ~Ball Lightning~ GOTO ~bm_scrollkit_confirm_MEWI554~
  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("MEWI555"))~ THEN REPLY ~Major Mirror Image~ GOTO ~bm_scrollkit_confirm_MEWI555~
  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("MEWI556"))~ THEN REPLY ~Skeleton Horde~ GOTO ~bm_scrollkit_confirm_MEWI556~
  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("MEWI557"))~ THEN REPLY ~Commando Conjuration~ GOTO ~bm_scrollkit_confirm_MEWI557~
  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("MEWI558"))~ THEN REPLY ~Missile of Patience~ GOTO ~bm_scrollkit_confirm_MEWI558~
  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("MEWI560"))~ THEN REPLY ~Slime Drop~ GOTO ~bm_scrollkit_confirm_MEWI560~
  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("MEWI563"))~ THEN REPLY ~Warrior Simulacrum~ GOTO ~bm_scrollkit_confirm_MEWI563~
  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("MEWI565"))~ THEN REPLY ~Sacrificial Explosion~ GOTO ~bm_scrollkit_confirm_MEWI565~
  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("MEWI566"))~ THEN REPLY ~Gedlee's Electric Barrier~ GOTO ~bm_scrollkit_confirm_MEWI566~


  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI501"))~ THEN REPLY #272531 GOTO ~bm_scrollkit_confirm_SPWI501~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI502"))~ THEN REPLY #225927 GOTO ~bm_scrollkit_confirm_SPWI502~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI503"))~ THEN REPLY #226492 GOTO ~bm_scrollkit_confirm_SPWI503~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI504"))~ THEN REPLY #16158 GOTO ~bm_scrollkit_confirm_SPWI504~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI505"))~ THEN REPLY #226496 GOTO ~bm_scrollkit_confirm_SPWI505~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI506"))~ THEN REPLY #226035 GOTO ~bm_scrollkit_confirm_SPWI506~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI507"))~ THEN REPLY #226499 GOTO ~bm_scrollkit_confirm_SPWI507~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI508"))~ THEN REPLY #272538 GOTO ~bm_scrollkit_confirm_SPWI508~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI509"))~ THEN REPLY #226501 GOTO ~bm_scrollkit_confirm_SPWI509~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI510"))~ THEN REPLY #272541 GOTO ~bm_scrollkit_confirm_SPWI510~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI511"))~ THEN REPLY #272545 GOTO ~bm_scrollkit_confirm_SPWI511~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI513"))~ THEN REPLY #230236 GOTO ~bm_scrollkit_confirm_SPWI513~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI514"))~ THEN REPLY #230238 GOTO ~bm_scrollkit_confirm_SPWI514~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI515"))~ THEN REPLY #230240 GOTO ~bm_scrollkit_confirm_SPWI515~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI516"))~ THEN REPLY #230242 GOTO ~bm_scrollkit_confirm_SPWI516~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI518"))~ THEN REPLY #230246 GOTO ~bm_scrollkit_confirm_SPWI518~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI519"))~ THEN REPLY #230254 GOTO ~bm_scrollkit_confirm_SPWI519~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI520"))~ THEN REPLY #230248 GOTO ~bm_scrollkit_confirm_SPWI520~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI521"))~ THEN REPLY #230250 GOTO ~bm_scrollkit_confirm_SPWI521~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI522"))~ THEN REPLY #225970 GOTO ~bm_scrollkit_confirm_SPWI522~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI523"))~ THEN REPLY #48351 GOTO ~bm_scrollkit_confirm_SPWI523~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI524"))~ THEN REPLY #272504 GOTO ~bm_scrollkit_confirm_SPWI524~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI525"))~ THEN REPLY #272815 GOTO ~bm_scrollkit_confirm_SPWI525~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI526"))~ THEN REPLY #273172 GOTO ~bm_scrollkit_confirm_SPWI526~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI527"))~ THEN REPLY #272863 GOTO ~bm_scrollkit_confirm_SPWI527~

  IF ~~ THEN REPLY ~Choose a different spell circle.~ GOTO ~bm_scrollkit_arcane_menu~

  IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_main~

  IF ~~ THEN REPLY ~Put the kit away.~ EXIT
END

IF ~~ THEN BEGIN bm_scrollkit_arcane_circle_6
  SAY ~Choose a spell to scribe.~
  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("MEWI651"))~ THEN REPLY ~Isaac's Greater Missile Storm~ GOTO ~bm_scrollkit_confirm_MEWI651~
  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("MEWI652"))~ THEN REPLY ~Freeze Inanimates~ GOTO ~bm_scrollkit_confirm_MEWI652~
  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("MEWI653"))~ THEN REPLY ~Greater Nightmare~ GOTO ~bm_scrollkit_confirm_MEWI653~
  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("MEWI656"))~ THEN REPLY ~Mass Charm~ GOTO ~bm_scrollkit_confirm_MEWI656~
  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("MEWI657"))~ THEN REPLY ~Mind Fog~ GOTO ~bm_scrollkit_confirm_MEWI657~
  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("MEWI658"))~ THEN REPLY ~Empower Familiar~ GOTO ~bm_scrollkit_confirm_MEWI658~


  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI601"))~ THEN REPLY #226556 GOTO ~bm_scrollkit_confirm_SPWI601~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI602"))~ THEN REPLY #231742 GOTO ~bm_scrollkit_confirm_SPWI602~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI603"))~ THEN REPLY #226560 GOTO ~bm_scrollkit_confirm_SPWI603~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI604"))~ THEN REPLY #226030 GOTO ~bm_scrollkit_confirm_SPWI604~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI605"))~ THEN REPLY #226000 GOTO ~bm_scrollkit_confirm_SPWI605~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI606"))~ THEN REPLY #272565 GOTO ~bm_scrollkit_confirm_SPWI606~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI607"))~ THEN REPLY #226567 GOTO ~bm_scrollkit_confirm_SPWI607~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI608"))~ THEN REPLY #226570 GOTO ~bm_scrollkit_confirm_SPWI608~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI609"))~ THEN REPLY #225822 GOTO ~bm_scrollkit_confirm_SPWI609~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI610"))~ THEN REPLY #16159 GOTO ~bm_scrollkit_confirm_SPWI610~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI611"))~ THEN REPLY #272570 GOTO ~bm_scrollkit_confirm_SPWI611~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI612"))~ THEN REPLY #272572 GOTO ~bm_scrollkit_confirm_SPWI612~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI613"))~ THEN REPLY #226573 GOTO ~bm_scrollkit_confirm_SPWI613~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI614"))~ THEN REPLY #272575 GOTO ~bm_scrollkit_confirm_SPWI614~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI615"))~ THEN REPLY #225797 GOTO ~bm_scrollkit_confirm_SPWI615~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI616"))~ THEN REPLY #226102 GOTO ~bm_scrollkit_confirm_SPWI616~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI617"))~ THEN REPLY #226577 GOTO ~bm_scrollkit_confirm_SPWI617~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI620"))~ THEN REPLY #226267 GOTO ~bm_scrollkit_confirm_SPWI620~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI621"))~ THEN REPLY #226582 GOTO ~bm_scrollkit_confirm_SPWI621~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI622"))~ THEN REPLY #226289 GOTO ~bm_scrollkit_confirm_SPWI622~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI623"))~ THEN REPLY #272363 GOTO ~bm_scrollkit_confirm_SPWI623~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI626"))~ THEN REPLY #272817 GOTO ~bm_scrollkit_confirm_SPWI626~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI627"))~ THEN REPLY #272821 GOTO ~bm_scrollkit_confirm_SPWI627~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI628"))~ THEN REPLY #272823 GOTO ~bm_scrollkit_confirm_SPWI628~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI629"))~ THEN REPLY #272825 GOTO ~bm_scrollkit_confirm_SPWI629~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI630"))~ THEN REPLY #272865 GOTO ~bm_scrollkit_confirm_SPWI630~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI631"))~ THEN REPLY #272867 GOTO ~bm_scrollkit_confirm_SPWI631~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI632"))~ THEN REPLY #272870 GOTO ~bm_scrollkit_confirm_SPWI632~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI633"))~ THEN REPLY #272854 GOTO ~bm_scrollkit_confirm_SPWI633~

  IF ~~ THEN REPLY ~Choose a different spell circle.~ GOTO ~bm_scrollkit_arcane_menu~

  IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_main~

  IF ~~ THEN REPLY ~Put the kit away.~ EXIT
END

IF ~~ THEN BEGIN bm_scrollkit_arcane_circle_7
  SAY ~Choose a spell to scribe.~
  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("MEWI754"))~ THEN REPLY ~Stygian Ice Storm~ GOTO ~bm_scrollkit_confirm_MEWI754~
  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("MEWI756"))~ THEN REPLY ~Critical Sequencer~ GOTO ~bm_scrollkit_confirm_MEWI756~
  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("MEWI759"))~ THEN REPLY ~Extraordinary Luck~ GOTO ~bm_scrollkit_confirm_MEWI759~
  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("MEWI760"))~ THEN REPLY ~Lightning Stream~ GOTO ~bm_scrollkit_confirm_MEWI760~
  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("MEWI762"))~ THEN REPLY ~Insanity~ GOTO ~bm_scrollkit_confirm_MEWI762~


  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI701"))~ THEN REPLY #272587 GOTO ~bm_scrollkit_confirm_SPWI701~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI702"))~ THEN REPLY #272589 GOTO ~bm_scrollkit_confirm_SPWI702~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI703"))~ THEN REPLY #225720 GOTO ~bm_scrollkit_confirm_SPWI703~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI704"))~ THEN REPLY #34597 GOTO ~bm_scrollkit_confirm_SPWI704~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI705"))~ THEN REPLY #226599 GOTO ~bm_scrollkit_confirm_SPWI705~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI706"))~ THEN REPLY #16160 GOTO ~bm_scrollkit_confirm_SPWI706~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI707"))~ THEN REPLY #272367 GOTO ~bm_scrollkit_confirm_SPWI707~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI708"))~ THEN REPLY #272595 GOTO ~bm_scrollkit_confirm_SPWI708~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI709"))~ THEN REPLY #272827 GOTO ~bm_scrollkit_confirm_SPWI709~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI710"))~ THEN REPLY #272597 GOTO ~bm_scrollkit_confirm_SPWI710~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI711"))~ THEN REPLY #225871 GOTO ~bm_scrollkit_confirm_SPWI711~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI712"))~ THEN REPLY #226609 GOTO ~bm_scrollkit_confirm_SPWI712~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI713"))~ THEN REPLY #226095 GOTO ~bm_scrollkit_confirm_SPWI713~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI714"))~ THEN REPLY #226611 GOTO ~bm_scrollkit_confirm_SPWI714~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI715"))~ THEN REPLY #272603 GOTO ~bm_scrollkit_confirm_SPWI715~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI716"))~ THEN REPLY #226613 GOTO ~bm_scrollkit_confirm_SPWI716~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI717"))~ THEN REPLY #226615 GOTO ~bm_scrollkit_confirm_SPWI717~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI718"))~ THEN REPLY #226617 GOTO ~bm_scrollkit_confirm_SPWI718~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI719"))~ THEN REPLY #226587 GOTO ~bm_scrollkit_confirm_SPWI719~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI720"))~ THEN REPLY #226621 GOTO ~bm_scrollkit_confirm_SPWI720~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI721"))~ THEN REPLY #226623 GOTO ~bm_scrollkit_confirm_SPWI721~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI722"))~ THEN REPLY #226625 GOTO ~bm_scrollkit_confirm_SPWI722~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI724"))~ THEN REPLY #272829 GOTO ~bm_scrollkit_confirm_SPWI724~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI725"))~ THEN REPLY #273175 GOTO ~bm_scrollkit_confirm_SPWI725~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI726"))~ THEN REPLY #272872 GOTO ~bm_scrollkit_confirm_SPWI726~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI727"))~ THEN REPLY #272883 GOTO ~bm_scrollkit_confirm_SPWI727~

  IF ~~ THEN REPLY ~Choose a different spell circle.~ GOTO ~bm_scrollkit_arcane_menu~

  IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_main~

  IF ~~ THEN REPLY ~Put the kit away.~ EXIT
END

IF ~~ THEN BEGIN bm_scrollkit_arcane_circle_8
  SAY ~Choose a spell to scribe.~
  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("MEWI851"))~ THEN REPLY ~Enhance Attribute~ GOTO ~bm_scrollkit_confirm_MEWI851~
  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("MEWI852"))~ THEN REPLY ~Globe of Invisibility~ GOTO ~bm_scrollkit_confirm_MEWI852~
  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("MEWI855"))~ THEN REPLY ~Omnipresence~ GOTO ~bm_scrollkit_confirm_MEWI855~
  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("MEWI857"))~ THEN REPLY ~Extend Vision~ GOTO ~bm_scrollkit_confirm_MEWI857~
  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("MEWI859"))~ THEN REPLY ~False Life~ GOTO ~bm_scrollkit_confirm_MEWI859~
  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("MEWI860"))~ THEN REPLY ~Enslave~ GOTO ~bm_scrollkit_confirm_MEWI860~
  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("MEWI861"))~ THEN REPLY ~Polar Ray~ GOTO ~bm_scrollkit_confirm_MEWI861~
  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("MEWI862"))~ THEN REPLY ~Clone Other~ GOTO ~bm_scrollkit_confirm_MEWI862~
  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("MEWI863"))~ THEN REPLY ~Metafireball~ GOTO ~bm_scrollkit_confirm_MEWI863~


  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI801"))~ THEN REPLY #272613 GOTO ~bm_scrollkit_confirm_SPWI801~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI802"))~ THEN REPLY #272543 GOTO ~bm_scrollkit_confirm_SPWI802~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI803"))~ THEN REPLY #272615 GOTO ~bm_scrollkit_confirm_SPWI803~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI804"))~ THEN REPLY #226630 GOTO ~bm_scrollkit_confirm_SPWI804~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI805"))~ THEN REPLY #226633 GOTO ~bm_scrollkit_confirm_SPWI805~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI806"))~ THEN REPLY #272634 GOTO ~bm_scrollkit_confirm_SPWI806~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI807"))~ THEN REPLY #226635 GOTO ~bm_scrollkit_confirm_SPWI807~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI808"))~ THEN REPLY #272620 GOTO ~bm_scrollkit_confirm_SPWI808~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI809"))~ THEN REPLY #272622 GOTO ~bm_scrollkit_confirm_SPWI809~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI810"))~ THEN REPLY #226642 GOTO ~bm_scrollkit_confirm_SPWI810~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI811"))~ THEN REPLY #272371 GOTO ~bm_scrollkit_confirm_SPWI811~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI812"))~ THEN REPLY #226645 GOTO ~bm_scrollkit_confirm_SPWI812~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI813"))~ THEN REPLY #225993 GOTO ~bm_scrollkit_confirm_SPWI813~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI814"))~ THEN REPLY #272833 GOTO ~bm_scrollkit_confirm_SPWI814~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI815"))~ THEN REPLY #272628 GOTO ~bm_scrollkit_confirm_SPWI815~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI816"))~ THEN REPLY #272382 GOTO ~bm_scrollkit_confirm_SPWI816~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI817"))~ THEN REPLY #272384 GOTO ~bm_scrollkit_confirm_SPWI817~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI818"))~ THEN REPLY #272632 GOTO ~bm_scrollkit_confirm_SPWI818~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI819"))~ THEN REPLY #272836 GOTO ~bm_scrollkit_confirm_SPWI819~

  IF ~~ THEN REPLY ~Choose a different spell circle.~ GOTO ~bm_scrollkit_arcane_menu~

  IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_main~

  IF ~~ THEN REPLY ~Put the kit away.~ EXIT
END

IF ~~ THEN BEGIN bm_scrollkit_arcane_circle_9
  SAY ~Choose a spell to scribe.~
  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("MEWI951"))~ THEN REPLY ~Perfect Invisibility~ GOTO ~bm_scrollkit_confirm_MEWI951~
  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("MEWI952"))~ THEN REPLY ~Mass Domination~ GOTO ~bm_scrollkit_confirm_MEWI952~
  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("MEWI953"))~ THEN REPLY ~Attain Perfection~ GOTO ~bm_scrollkit_confirm_MEWI953~
  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("MEWI954"))~ THEN REPLY ~Vampiric Feast~ GOTO ~bm_scrollkit_confirm_MEWI954~
  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("MEWI955"))~ THEN REPLY ~Mass Sequencer~ GOTO ~bm_scrollkit_confirm_MEWI955~
  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("MEWI957"))~ THEN REPLY ~Executioner's Eyes~ GOTO ~bm_scrollkit_confirm_MEWI957~
  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("MEWI958"))~ THEN REPLY ~Phantasmal Dragon~ GOTO ~bm_scrollkit_confirm_MEWI958~
  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("MEWI959"))~ THEN REPLY ~Damage Turning~ GOTO ~bm_scrollkit_confirm_MEWI959~
  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("MEWI966"))~ THEN REPLY ~Protection from Time Stop~ GOTO ~bm_scrollkit_confirm_MEWI966~


  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI901"))~ THEN REPLY #16160 GOTO ~bm_scrollkit_confirm_SPWI901~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI902"))~ THEN REPLY #226653 GOTO ~bm_scrollkit_confirm_SPWI902~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI903"))~ THEN REPLY #226656 GOTO ~bm_scrollkit_confirm_SPWI903~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI905"))~ THEN REPLY #226291 GOTO ~bm_scrollkit_confirm_SPWI905~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI907"))~ THEN REPLY #226659 GOTO ~bm_scrollkit_confirm_SPWI907~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI908"))~ THEN REPLY #226662 GOTO ~bm_scrollkit_confirm_SPWI908~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI909"))~ THEN REPLY #226664 GOTO ~bm_scrollkit_confirm_SPWI909~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI910"))~ THEN REPLY #226002 GOTO ~bm_scrollkit_confirm_SPWI910~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI911"))~ THEN REPLY #225976 GOTO ~bm_scrollkit_confirm_SPWI911~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI912"))~ THEN REPLY #272644 GOTO ~bm_scrollkit_confirm_SPWI912~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI913"))~ THEN REPLY #225934 GOTO ~bm_scrollkit_confirm_SPWI913~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI914"))~ THEN REPLY #272647 GOTO ~bm_scrollkit_confirm_SPWI914~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI915"))~ THEN REPLY #226668 GOTO ~bm_scrollkit_confirm_SPWI915~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI916"))~ THEN REPLY #226670 GOTO ~bm_scrollkit_confirm_SPWI916~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI917"))~ THEN REPLY #226673 GOTO ~bm_scrollkit_confirm_SPWI917~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI918"))~ THEN REPLY #226675 GOTO ~bm_scrollkit_confirm_SPWI918~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPWI919"))~ THEN REPLY #226677 GOTO ~bm_scrollkit_confirm_SPWI919~

  IF ~~ THEN REPLY ~Choose a different spell circle.~ GOTO ~bm_scrollkit_arcane_menu~

  IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_main~

  IF ~~ THEN REPLY ~Put the kit away.~ EXIT
END

IF ~~ THEN BEGIN bm_scrollkit_divine_circle_1
  SAY ~Choose a spell to scribe.~
  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("MEPR151"))~ THEN REPLY ~Snake's Swiftness~ GOTO ~bm_scrollkit_confirm_MEPR151~
  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("MEPR153"))~ THEN REPLY ~Hunter's Mark~ GOTO ~bm_scrollkit_confirm_MEPR153~
  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("MEPR154"))~ THEN REPLY ~Turning Weapon~ GOTO ~bm_scrollkit_confirm_MEPR154~
  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("MEPR155"))~ THEN REPLY ~Repulse~ GOTO ~bm_scrollkit_confirm_MEPR155~
  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("MEPR156"))~ THEN REPLY ~Camouflage~ GOTO ~bm_scrollkit_confirm_MEPR156~
  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("MEPR157"))~ THEN REPLY ~Searing Smite~ GOTO ~bm_scrollkit_confirm_MEPR157~


  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR101"))~ THEN REPLY #226124 GOTO ~bm_scrollkit_confirm_SPPR101~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR102"))~ THEN REPLY #226125 GOTO ~bm_scrollkit_confirm_SPPR102~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR103"))~ THEN REPLY #225886 GOTO ~bm_scrollkit_confirm_SPPR103~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR104"))~ THEN REPLY #226156 GOTO ~bm_scrollkit_confirm_SPPR104~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR105"))~ THEN REPLY #231777 GOTO ~bm_scrollkit_confirm_SPPR105~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR106"))~ THEN REPLY #226129 GOTO ~bm_scrollkit_confirm_SPPR106~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR107"))~ THEN REPLY #272205 GOTO ~bm_scrollkit_confirm_SPPR107~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR108"))~ THEN REPLY #226391 GOTO ~bm_scrollkit_confirm_SPPR108~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR109"))~ THEN REPLY #226132 GOTO ~bm_scrollkit_confirm_SPPR109~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR110"))~ THEN REPLY #226134 GOTO ~bm_scrollkit_confirm_SPPR110~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR111"))~ THEN REPLY #226136 GOTO ~bm_scrollkit_confirm_SPPR111~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR112"))~ THEN REPLY #272213 GOTO ~bm_scrollkit_confirm_SPPR112~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR113"))~ THEN REPLY #226138 GOTO ~bm_scrollkit_confirm_SPPR113~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR114"))~ THEN REPLY #272215 GOTO ~bm_scrollkit_confirm_SPPR114~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR115"))~ THEN REPLY #272217 GOTO ~bm_scrollkit_confirm_SPPR115~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR116"))~ THEN REPLY #252368 GOTO ~bm_scrollkit_confirm_SPPR116~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR117"))~ THEN REPLY #226151 GOTO ~bm_scrollkit_confirm_SPPR117~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR118"))~ THEN REPLY #272220 GOTO ~bm_scrollkit_confirm_SPPR118~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR119"))~ THEN REPLY #226199 GOTO ~bm_scrollkit_confirm_SPPR119~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR120"))~ THEN REPLY #272223 GOTO ~bm_scrollkit_confirm_SPPR120~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR121"))~ THEN REPLY #101765 GOTO ~bm_scrollkit_confirm_SPPR121~

  IF ~~ THEN REPLY ~Choose a different spell circle.~ GOTO ~bm_scrollkit_divine_menu~

  IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_main~

  IF ~~ THEN REPLY ~Put the kit away.~ EXIT
END

IF ~~ THEN BEGIN bm_scrollkit_divine_circle_2
  SAY ~Choose a spell to scribe.~
  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("MEPR251"))~ THEN REPLY ~Beast Sense~ GOTO ~bm_scrollkit_confirm_MEPR251~
  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("MEPR252"))~ THEN REPLY ~Fiery Link~ GOTO ~bm_scrollkit_confirm_MEPR252~
  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("MEPR253"))~ THEN REPLY ~Null Healing~ GOTO ~bm_scrollkit_confirm_MEPR253~
  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("MEPR254"))~ THEN REPLY ~Critical Boon~ GOTO ~bm_scrollkit_confirm_MEPR254~
  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("MEPR257"))~ THEN REPLY ~Hide Campsite~ GOTO ~bm_scrollkit_confirm_MEPR257~


  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR201"))~ THEN REPLY #226143 GOTO ~bm_scrollkit_confirm_SPPR201~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR202"))~ THEN REPLY #226145 GOTO ~bm_scrollkit_confirm_SPPR202~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR203"))~ THEN REPLY #226148 GOTO ~bm_scrollkit_confirm_SPPR203~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR204"))~ THEN REPLY #272228 GOTO ~bm_scrollkit_confirm_SPPR204~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR205"))~ THEN REPLY #226149 GOTO ~bm_scrollkit_confirm_SPPR205~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR206"))~ THEN REPLY #225922 GOTO ~bm_scrollkit_confirm_SPPR206~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR207"))~ THEN REPLY #226151 GOTO ~bm_scrollkit_confirm_SPPR207~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR208"))~ THEN REPLY #226106 GOTO ~bm_scrollkit_confirm_SPPR208~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR209"))~ THEN REPLY #272240 GOTO ~bm_scrollkit_confirm_SPPR209~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR210"))~ THEN REPLY #272242 GOTO ~bm_scrollkit_confirm_SPPR210~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR211"))~ THEN REPLY #231791 GOTO ~bm_scrollkit_confirm_SPPR211~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR212"))~ THEN REPLY #225887 GOTO ~bm_scrollkit_confirm_SPPR212~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR213"))~ THEN REPLY #225900 GOTO ~bm_scrollkit_confirm_SPPR213~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR214"))~ THEN REPLY #272247 GOTO ~bm_scrollkit_confirm_SPPR214~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR215"))~ THEN REPLY #272249 GOTO ~bm_scrollkit_confirm_SPPR215~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR216"))~ THEN REPLY #272251 GOTO ~bm_scrollkit_confirm_SPPR216~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR217"))~ THEN REPLY #272253 GOTO ~bm_scrollkit_confirm_SPPR217~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR218"))~ THEN REPLY #272255 GOTO ~bm_scrollkit_confirm_SPPR218~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR219"))~ THEN REPLY #272257 GOTO ~bm_scrollkit_confirm_SPPR219~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR220"))~ THEN REPLY #226228 GOTO ~bm_scrollkit_confirm_SPPR220~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR221"))~ THEN REPLY #272905 GOTO ~bm_scrollkit_confirm_SPPR221~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR222"))~ THEN REPLY #272908 GOTO ~bm_scrollkit_confirm_SPPR222~

  IF ~~ THEN REPLY ~Choose a different spell circle.~ GOTO ~bm_scrollkit_divine_menu~

  IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_main~

  IF ~~ THEN REPLY ~Put the kit away.~ EXIT
END

IF ~~ THEN BEGIN bm_scrollkit_divine_circle_3
  SAY ~Choose a spell to scribe.~
  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("MEPR351"))~ THEN REPLY ~Call Water Weirds~ GOTO ~bm_scrollkit_confirm_MEPR351~
  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("MEPR354"))~ THEN REPLY ~Healing Curse~ GOTO ~bm_scrollkit_confirm_MEPR354~
  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("MEPR356"))~ THEN REPLY ~Wind Shots~ GOTO ~bm_scrollkit_confirm_MEPR356~
  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("MEPR359"))~ THEN REPLY ~MEPR359~ GOTO ~bm_scrollkit_confirm_MEPR359~


  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR301"))~ THEN REPLY #226489 GOTO ~bm_scrollkit_confirm_SPPR301~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR302"))~ THEN REPLY #226163 GOTO ~bm_scrollkit_confirm_SPPR302~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR303"))~ THEN REPLY #225819 GOTO ~bm_scrollkit_confirm_SPPR303~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR304"))~ THEN REPLY #226165 GOTO ~bm_scrollkit_confirm_SPPR304~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR305"))~ THEN REPLY #272264 GOTO ~bm_scrollkit_confirm_SPPR305~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR306"))~ THEN REPLY #272266 GOTO ~bm_scrollkit_confirm_SPPR306~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR307"))~ THEN REPLY #272268 GOTO ~bm_scrollkit_confirm_SPPR307~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR308"))~ THEN REPLY #226175 GOTO ~bm_scrollkit_confirm_SPPR308~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR309"))~ THEN REPLY #226177 GOTO ~bm_scrollkit_confirm_SPPR309~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR310"))~ THEN REPLY #226180 GOTO ~bm_scrollkit_confirm_SPPR310~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR311"))~ THEN REPLY #12101 GOTO ~bm_scrollkit_confirm_SPPR311~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR312"))~ THEN REPLY #226185 GOTO ~bm_scrollkit_confirm_SPPR312~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR313"))~ THEN REPLY #226187 GOTO ~bm_scrollkit_confirm_SPPR313~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR314"))~ THEN REPLY #226189 GOTO ~bm_scrollkit_confirm_SPPR314~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR315"))~ THEN REPLY #226092 GOTO ~bm_scrollkit_confirm_SPPR315~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR316"))~ THEN REPLY #230268 GOTO ~bm_scrollkit_confirm_SPPR316~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR317"))~ THEN REPLY #226193 GOTO ~bm_scrollkit_confirm_SPPR317~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR318"))~ THEN REPLY #272255 GOTO ~bm_scrollkit_confirm_SPPR318~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR319"))~ THEN REPLY #225948 GOTO ~bm_scrollkit_confirm_SPPR319~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR320"))~ THEN REPLY #226261 GOTO ~bm_scrollkit_confirm_SPPR320~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR321"))~ THEN REPLY #226104 GOTO ~bm_scrollkit_confirm_SPPR321~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR322"))~ THEN REPLY #225851 GOTO ~bm_scrollkit_confirm_SPPR322~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR323"))~ THEN REPLY #272284 GOTO ~bm_scrollkit_confirm_SPPR323~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR324"))~ THEN REPLY #272286 GOTO ~bm_scrollkit_confirm_SPPR324~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR325"))~ THEN REPLY #272288 GOTO ~bm_scrollkit_confirm_SPPR325~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR326"))~ THEN REPLY #272290 GOTO ~bm_scrollkit_confirm_SPPR326~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR327"))~ THEN REPLY #272911 GOTO ~bm_scrollkit_confirm_SPPR327~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR328"))~ THEN REPLY #101781 GOTO ~bm_scrollkit_confirm_SPPR328~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR329"))~ THEN REPLY #232368 GOTO ~bm_scrollkit_confirm_SPPR329~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR330"))~ THEN REPLY #210223 GOTO ~bm_scrollkit_confirm_SPPR330~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR331"))~ THEN REPLY #272917 GOTO ~bm_scrollkit_confirm_SPPR331~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR332"))~ THEN REPLY #272919 GOTO ~bm_scrollkit_confirm_SPPR332~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR333"))~ THEN REPLY #272922 GOTO ~bm_scrollkit_confirm_SPPR333~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR334"))~ THEN REPLY #272923 GOTO ~bm_scrollkit_confirm_SPPR334~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR335"))~ THEN REPLY #272927 GOTO ~bm_scrollkit_confirm_SPPR335~

  IF ~~ THEN REPLY ~Choose a different spell circle.~ GOTO ~bm_scrollkit_divine_menu~

  IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_main~

  IF ~~ THEN REPLY ~Put the kit away.~ EXIT
END

IF ~~ THEN BEGIN bm_scrollkit_divine_circle_4
  SAY ~Choose a spell to scribe.~
  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("MEPR451"))~ THEN REPLY ~Disarm~ GOTO ~bm_scrollkit_confirm_MEPR451~
  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("MEPR452"))~ THEN REPLY ~Forest's Blessing~ GOTO ~bm_scrollkit_confirm_MEPR452~
  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("MEPR453"))~ THEN REPLY ~Turn Creature~ GOTO ~bm_scrollkit_confirm_MEPR453~
  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("MEPR457"))~ THEN REPLY ~MEPR457~ GOTO ~bm_scrollkit_confirm_MEPR457~


  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR401"))~ THEN REPLY #226230 GOTO ~bm_scrollkit_confirm_SPPR401~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR402"))~ THEN REPLY #272186 GOTO ~bm_scrollkit_confirm_SPPR402~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR403"))~ THEN REPLY #226200 GOTO ~bm_scrollkit_confirm_SPPR403~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR404"))~ THEN REPLY #226202 GOTO ~bm_scrollkit_confirm_SPPR404~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR405"))~ THEN REPLY #226204 GOTO ~bm_scrollkit_confirm_SPPR405~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR406"))~ THEN REPLY #226207 GOTO ~bm_scrollkit_confirm_SPPR406~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR407"))~ THEN REPLY #272298 GOTO ~bm_scrollkit_confirm_SPPR407~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR408"))~ THEN REPLY #272300 GOTO ~bm_scrollkit_confirm_SPPR408~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR409"))~ THEN REPLY #226211 GOTO ~bm_scrollkit_confirm_SPPR409~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR410"))~ THEN REPLY #226213 GOTO ~bm_scrollkit_confirm_SPPR410~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR411"))~ THEN REPLY #226215 GOTO ~bm_scrollkit_confirm_SPPR411~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR412"))~ THEN REPLY #272305 GOTO ~bm_scrollkit_confirm_SPPR412~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR413"))~ THEN REPLY #226219 GOTO ~bm_scrollkit_confirm_SPPR413~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR414"))~ THEN REPLY #226243 GOTO ~bm_scrollkit_confirm_SPPR414~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR415"))~ THEN REPLY #230272 GOTO ~bm_scrollkit_confirm_SPPR415~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR416"))~ THEN REPLY #226224 GOTO ~bm_scrollkit_confirm_SPPR416~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR417"))~ THEN REPLY #226226 GOTO ~bm_scrollkit_confirm_SPPR417~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR418"))~ THEN REPLY #230198 GOTO ~bm_scrollkit_confirm_SPPR418~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR419"))~ THEN REPLY #272313 GOTO ~bm_scrollkit_confirm_SPPR419~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR420"))~ THEN REPLY #272929 GOTO ~bm_scrollkit_confirm_SPPR420~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR421"))~ THEN REPLY #272932 GOTO ~bm_scrollkit_confirm_SPPR421~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR422"))~ THEN REPLY #272934 GOTO ~bm_scrollkit_confirm_SPPR422~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR423"))~ THEN REPLY #272936 GOTO ~bm_scrollkit_confirm_SPPR423~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR424"))~ THEN REPLY #272938 GOTO ~bm_scrollkit_confirm_SPPR424~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR425"))~ THEN REPLY #272940 GOTO ~bm_scrollkit_confirm_SPPR425~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR426"))~ THEN REPLY #272942 GOTO ~bm_scrollkit_confirm_SPPR426~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR427"))~ THEN REPLY #272944 GOTO ~bm_scrollkit_confirm_SPPR427~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR428"))~ THEN REPLY #272946 GOTO ~bm_scrollkit_confirm_SPPR428~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR429"))~ THEN REPLY #272948 GOTO ~bm_scrollkit_confirm_SPPR429~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR430"))~ THEN REPLY #272982 GOTO ~bm_scrollkit_confirm_SPPR430~

  IF ~~ THEN REPLY ~Choose a different spell circle.~ GOTO ~bm_scrollkit_divine_menu~

  IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_main~

  IF ~~ THEN REPLY ~Put the kit away.~ EXIT
END

IF ~~ THEN BEGIN bm_scrollkit_divine_circle_5
  SAY ~Choose a spell to scribe.~
  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("MEPR557"))~ THEN REPLY ~Expose to the Elements~ GOTO ~bm_scrollkit_confirm_MEPR557~
  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("MEPR558"))~ THEN REPLY ~Sphere of Security~ GOTO ~bm_scrollkit_confirm_MEPR558~


  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR501"))~ THEN REPLY #272188 GOTO ~bm_scrollkit_confirm_SPPR501~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR502"))~ THEN REPLY #226230 GOTO ~bm_scrollkit_confirm_SPPR502~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR503"))~ THEN REPLY #226004 GOTO ~bm_scrollkit_confirm_SPPR503~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR504"))~ THEN REPLY #226232 GOTO ~bm_scrollkit_confirm_SPPR504~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR505"))~ THEN REPLY #225822 GOTO ~bm_scrollkit_confirm_SPPR505~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR506"))~ THEN REPLY #230200 GOTO ~bm_scrollkit_confirm_SPPR506~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR507"))~ THEN REPLY #226236 GOTO ~bm_scrollkit_confirm_SPPR507~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR508"))~ THEN REPLY #226238 GOTO ~bm_scrollkit_confirm_SPPR508~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR509"))~ THEN REPLY #226241 GOTO ~bm_scrollkit_confirm_SPPR509~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR510"))~ THEN REPLY #272325 GOTO ~bm_scrollkit_confirm_SPPR510~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR511"))~ THEN REPLY #226245 GOTO ~bm_scrollkit_confirm_SPPR511~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR512"))~ THEN REPLY #226247 GOTO ~bm_scrollkit_confirm_SPPR512~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR513"))~ THEN REPLY #272329 GOTO ~bm_scrollkit_confirm_SPPR513~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR514"))~ THEN REPLY #226251 GOTO ~bm_scrollkit_confirm_SPPR514~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR515"))~ THEN REPLY #226694 GOTO ~bm_scrollkit_confirm_SPPR515~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR516"))~ THEN REPLY #226255 GOTO ~bm_scrollkit_confirm_SPPR516~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR517"))~ THEN REPLY #226257 GOTO ~bm_scrollkit_confirm_SPPR517~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR518"))~ THEN REPLY #226057 GOTO ~bm_scrollkit_confirm_SPPR518~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR519"))~ THEN REPLY #272336 GOTO ~bm_scrollkit_confirm_SPPR519~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR520"))~ THEN REPLY #272338 GOTO ~bm_scrollkit_confirm_SPPR520~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR521"))~ THEN REPLY #272298 GOTO ~bm_scrollkit_confirm_SPPR521~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR522"))~ THEN REPLY #272266 GOTO ~bm_scrollkit_confirm_SPPR522~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR523"))~ THEN REPLY #272340 GOTO ~bm_scrollkit_confirm_SPPR523~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR524"))~ THEN REPLY #272342 GOTO ~bm_scrollkit_confirm_SPPR524~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR525"))~ THEN REPLY #272950 GOTO ~bm_scrollkit_confirm_SPPR525~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR526"))~ THEN REPLY #272952 GOTO ~bm_scrollkit_confirm_SPPR526~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR527"))~ THEN REPLY #272954 GOTO ~bm_scrollkit_confirm_SPPR527~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR528"))~ THEN REPLY #272956 GOTO ~bm_scrollkit_confirm_SPPR528~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR529"))~ THEN REPLY #102860 GOTO ~bm_scrollkit_confirm_SPPR529~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR530"))~ THEN REPLY #272959 GOTO ~bm_scrollkit_confirm_SPPR530~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR531"))~ THEN REPLY #226282 GOTO ~bm_scrollkit_confirm_SPPR531~

  IF ~~ THEN REPLY ~Choose a different spell circle.~ GOTO ~bm_scrollkit_divine_menu~

  IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_main~

  IF ~~ THEN REPLY ~Put the kit away.~ EXIT
END

IF ~~ THEN BEGIN bm_scrollkit_divine_circle_6
  SAY ~Choose a spell to scribe.~
  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("MEPR652"))~ THEN REPLY ~Drown~ GOTO ~bm_scrollkit_confirm_MEPR652~
  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("MEPR653"))~ THEN REPLY ~Antiharm Shell~ GOTO ~bm_scrollkit_confirm_MEPR653~
  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("MEPR654"))~ THEN REPLY ~Living Lightning~ GOTO ~bm_scrollkit_confirm_MEPR654~
  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("MEPR656"))~ THEN REPLY ~Protection from Non-Silver Weapons~ GOTO ~bm_scrollkit_confirm_MEPR656~
  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("MEPR657"))~ THEN REPLY ~Trial By Fire~ GOTO ~bm_scrollkit_confirm_MEPR657~
  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("MEPR658"))~ THEN REPLY ~Conjure Earth Elemental~ GOTO ~bm_scrollkit_confirm_MEPR658~


  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR601"))~ THEN REPLY #226259 GOTO ~bm_scrollkit_confirm_SPPR601~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR602"))~ THEN REPLY #272190 GOTO ~bm_scrollkit_confirm_SPPR602~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR603"))~ THEN REPLY #226263 GOTO ~bm_scrollkit_confirm_SPPR603~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR604"))~ THEN REPLY #226265 GOTO ~bm_scrollkit_confirm_SPPR604~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR605"))~ THEN REPLY #226267 GOTO ~bm_scrollkit_confirm_SPPR605~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR606"))~ THEN REPLY #226269 GOTO ~bm_scrollkit_confirm_SPPR606~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR607"))~ THEN REPLY #231782 GOTO ~bm_scrollkit_confirm_SPPR607~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR608"))~ THEN REPLY #226272 GOTO ~bm_scrollkit_confirm_SPPR608~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR609"))~ THEN REPLY #226274 GOTO ~bm_scrollkit_confirm_SPPR609~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR610"))~ THEN REPLY #226276 GOTO ~bm_scrollkit_confirm_SPPR610~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR611"))~ THEN REPLY #226278 GOTO ~bm_scrollkit_confirm_SPPR611~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR612"))~ THEN REPLY #226280 GOTO ~bm_scrollkit_confirm_SPPR612~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR614"))~ THEN REPLY #226284 GOTO ~bm_scrollkit_confirm_SPPR614~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR615"))~ THEN REPLY #226305 GOTO ~bm_scrollkit_confirm_SPPR615~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR616"))~ THEN REPLY #226000 GOTO ~bm_scrollkit_confirm_SPPR616~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR617"))~ THEN REPLY #226582 GOTO ~bm_scrollkit_confirm_SPPR617~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR618"))~ THEN REPLY #226289 GOTO ~bm_scrollkit_confirm_SPPR618~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR619"))~ THEN REPLY #272363 GOTO ~bm_scrollkit_confirm_SPPR619~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR620"))~ THEN REPLY #272961 GOTO ~bm_scrollkit_confirm_SPPR620~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR621"))~ THEN REPLY #72819 GOTO ~bm_scrollkit_confirm_SPPR621~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR622"))~ THEN REPLY #272964 GOTO ~bm_scrollkit_confirm_SPPR622~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR698"))~ THEN REPLY #14262 GOTO ~bm_scrollkit_confirm_SPPR698~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR699"))~ THEN REPLY #11200 GOTO ~bm_scrollkit_confirm_SPPR699~

  IF ~~ THEN REPLY ~Choose a different spell circle.~ GOTO ~bm_scrollkit_divine_menu~

  IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_main~

  IF ~~ THEN REPLY ~Put the kit away.~ EXIT
END

IF ~~ THEN BEGIN bm_scrollkit_divine_circle_7
  SAY ~Choose a spell to scribe.~
  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("MEPR751"))~ THEN REPLY ~Power Word, Heal~ GOTO ~bm_scrollkit_confirm_MEPR751~
  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("MEPR753"))~ THEN REPLY ~Nonrandom Zone~ GOTO ~bm_scrollkit_confirm_MEPR753~
  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("MEPR755"))~ THEN REPLY ~Enhance Attribute~ GOTO ~bm_scrollkit_confirm_MEPR755~
  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("MEPR759"))~ THEN REPLY ~Omnipresence~ GOTO ~bm_scrollkit_confirm_MEPR759~
  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("MEPR760"))~ THEN REPLY ~True Dispel~ GOTO ~bm_scrollkit_confirm_MEPR760~


  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR701"))~ THEN REPLY #226286 GOTO ~bm_scrollkit_confirm_SPPR701~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR702"))~ THEN REPLY #225336 GOTO ~bm_scrollkit_confirm_SPPR702~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR703"))~ THEN REPLY #272367 GOTO ~bm_scrollkit_confirm_SPPR703~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR704"))~ THEN REPLY #226293 GOTO ~bm_scrollkit_confirm_SPPR704~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR705"))~ THEN REPLY #226296 GOTO ~bm_scrollkit_confirm_SPPR705~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR706"))~ THEN REPLY #272371 GOTO ~bm_scrollkit_confirm_SPPR706~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR707"))~ THEN REPLY #226300 GOTO ~bm_scrollkit_confirm_SPPR707~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR708"))~ THEN REPLY #226095 GOTO ~bm_scrollkit_confirm_SPPR708~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR709"))~ THEN REPLY #225871 GOTO ~bm_scrollkit_confirm_SPPR709~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR710"))~ THEN REPLY #226303 GOTO ~bm_scrollkit_confirm_SPPR710~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR711"))~ THEN REPLY #226305 GOTO ~bm_scrollkit_confirm_SPPR711~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR712"))~ THEN REPLY #226308 GOTO ~bm_scrollkit_confirm_SPPR712~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR713"))~ THEN REPLY #230194 GOTO ~bm_scrollkit_confirm_SPPR713~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR714"))~ THEN REPLY #226666 GOTO ~bm_scrollkit_confirm_SPPR714~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR715"))~ THEN REPLY #226312 GOTO ~bm_scrollkit_confirm_SPPR715~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR716"))~ THEN REPLY #272387 GOTO ~bm_scrollkit_confirm_SPPR716~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR717"))~ THEN REPLY #226314 GOTO ~bm_scrollkit_confirm_SPPR717~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR718"))~ THEN REPLY #272382 GOTO ~bm_scrollkit_confirm_SPPR718~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR719"))~ THEN REPLY #272384 GOTO ~bm_scrollkit_confirm_SPPR719~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR720"))~ THEN REPLY #226319 GOTO ~bm_scrollkit_confirm_SPPR720~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR733"))~ THEN REPLY #226690 GOTO ~bm_scrollkit_confirm_SPPR733~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR734"))~ THEN REPLY #272967 GOTO ~bm_scrollkit_confirm_SPPR734~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR735"))~ THEN REPLY #272969 GOTO ~bm_scrollkit_confirm_SPPR735~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR736"))~ THEN REPLY #272971 GOTO ~bm_scrollkit_confirm_SPPR736~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR737"))~ THEN REPLY #272973 GOTO ~bm_scrollkit_confirm_SPPR737~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR738"))~ THEN REPLY #272975 GOTO ~bm_scrollkit_confirm_SPPR738~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR739"))~ THEN REPLY #272985 GOTO ~bm_scrollkit_confirm_SPPR739~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR751"))~ THEN REPLY #103080 GOTO ~bm_scrollkit_confirm_SPPR751~

  IF ~~ THEN REPLY ~Choose a different spell circle.~ GOTO ~bm_scrollkit_divine_menu~

  IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_main~

  IF ~~ THEN REPLY ~Put the kit away.~ EXIT
END

IF ~~ THEN BEGIN bm_scrollkit_divine_circle_8
  SAY ~Choose a spell to scribe.~

  IF ~~ THEN REPLY ~Choose a different spell circle.~ GOTO ~bm_scrollkit_divine_menu~

  IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_main~

  IF ~~ THEN REPLY ~Put the kit away.~ EXIT
END

IF ~~ THEN BEGIN bm_scrollkit_divine_circle_9
  SAY ~Choose a spell to scribe.~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR984"))~ THEN REPLY #12054 GOTO ~bm_scrollkit_confirm_SPPR984~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR986"))~ THEN REPLY #12103 GOTO ~bm_scrollkit_confirm_SPPR986~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR987"))~ THEN REPLY #12124 GOTO ~bm_scrollkit_confirm_SPPR987~

  IF ~TriggerOverride(LastTalkedToBy(Myself),HaveKnownSpellRES("SPPR999"))~ THEN REPLY #12117 GOTO ~bm_scrollkit_confirm_SPPR999~

  IF ~~ THEN REPLY ~Choose a different spell circle.~ GOTO ~bm_scrollkit_divine_menu~

  IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_main~

  IF ~~ THEN REPLY ~Put the kit away.~ EXIT
END

IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI101~
    SAY ~Scribe this scroll for 10 gold? This takes 1 hours.~
      IF ~PartyGoldGT(9)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(10) AdvanceTime(300) GiveItemCreate("SCRL66",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(9)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI101~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_1~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI101~
    SAY ~You need 10 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_1~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI102~
    SAY ~Scribe this scroll for 10 gold? This takes 1 hours.~
      IF ~PartyGoldGT(9)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(10) AdvanceTime(300) GiveItemCreate("SCRL67",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(9)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI102~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_1~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI102~
    SAY ~You need 10 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_1~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI103~
    SAY ~Scribe this scroll for 10 gold? This takes 1 hours.~
      IF ~PartyGoldGT(9)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(10) AdvanceTime(300) GiveItemCreate("SCRL68",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(9)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI103~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_1~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI103~
    SAY ~You need 10 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_1~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI104~
    SAY ~Scribe this scroll for 10 gold? This takes 1 hours.~
      IF ~PartyGoldGT(9)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(10) AdvanceTime(300) GiveItemCreate("SCRL69",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(9)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI104~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_1~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI104~
    SAY ~You need 10 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_1~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI105~
    SAY ~Scribe this scroll for 10 gold? This takes 1 hours.~
      IF ~PartyGoldGT(9)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(10) AdvanceTime(300) GiveItemCreate("SCRL70",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(9)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI105~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_1~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI105~
    SAY ~You need 10 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_1~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI106~
    SAY ~Scribe this scroll for 10 gold? This takes 1 hours.~
      IF ~PartyGoldGT(9)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(10) AdvanceTime(300) GiveItemCreate("SCRL71",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(9)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI106~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_1~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI106~
    SAY ~You need 10 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_1~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI107~
    SAY ~Scribe this scroll for 10 gold? This takes 1 hours.~
      IF ~PartyGoldGT(9)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(10) AdvanceTime(300) GiveItemCreate("SCRL72",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(9)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI107~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_1~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI107~
    SAY ~You need 10 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_1~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI108~
    SAY ~Scribe this scroll for 10 gold? This takes 1 hours.~
      IF ~PartyGoldGT(9)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(10) AdvanceTime(300) GiveItemCreate("SCRL73",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(9)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI108~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_1~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI108~
    SAY ~You need 10 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_1~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI109~
    SAY ~Scribe this scroll for 10 gold? This takes 1 hours.~
      IF ~PartyGoldGT(9)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(10) AdvanceTime(300) GiveItemCreate("DVSCRL73",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(9)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI109~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_1~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI109~
    SAY ~You need 10 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_1~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI110~
    SAY ~Scribe this scroll for 10 gold? This takes 1 hours.~
      IF ~PartyGoldGT(9)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(10) AdvanceTime(300) GiveItemCreate("SCRL75",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(9)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI110~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_1~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI110~
    SAY ~You need 10 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_1~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI111~
    SAY ~Scribe this scroll for 10 gold? This takes 1 hours.~
      IF ~PartyGoldGT(9)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(10) AdvanceTime(300) GiveItemCreate("SCRL76",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(9)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI111~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_1~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI111~
    SAY ~You need 10 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_1~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI112~
    SAY ~Scribe this scroll for 10 gold? This takes 1 hours.~
      IF ~PartyGoldGT(9)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(10) AdvanceTime(300) GiveItemCreate("SCRL77",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(9)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI112~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_1~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI112~
    SAY ~You need 10 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_1~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI113~
    SAY ~Scribe this scroll for 10 gold? This takes 1 hours.~
      IF ~PartyGoldGT(9)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(10) AdvanceTime(300) GiveItemCreate("SCRL78",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(9)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI113~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_1~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI113~
    SAY ~You need 10 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_1~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI114~
    SAY ~Scribe this scroll for 10 gold? This takes 1 hours.~
      IF ~PartyGoldGT(9)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(10) AdvanceTime(300) GiveItemCreate("SCRL79",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(9)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI114~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_1~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI114~
    SAY ~You need 10 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_1~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI115~
    SAY ~Scribe this scroll for 10 gold? This takes 1 hours.~
      IF ~PartyGoldGT(9)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(10) AdvanceTime(300) GiveItemCreate("SCRL80",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(9)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI115~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_1~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI115~
    SAY ~You need 10 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_1~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI116~
    SAY ~Scribe this scroll for 10 gold? This takes 1 hours.~
      IF ~PartyGoldGT(9)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(10) AdvanceTime(300) GiveItemCreate("SCRL81",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(9)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI116~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_1~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI116~
    SAY ~You need 10 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_1~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI117~
    SAY ~Scribe this scroll for 10 gold? This takes 1 hours.~
      IF ~PartyGoldGT(9)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(10) AdvanceTime(300) GiveItemCreate("SCRL82",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(9)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI117~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_1~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI117~
    SAY ~You need 10 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_1~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI118~
    SAY ~Scribe this scroll for 10 gold? This takes 1 hours.~
      IF ~PartyGoldGT(9)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(10) AdvanceTime(300) GiveItemCreate("SCRL83",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(9)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI118~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_1~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI118~
    SAY ~You need 10 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_1~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI119~
    SAY ~Scribe this scroll for 10 gold? This takes 1 hours.~
      IF ~PartyGoldGT(9)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(10) AdvanceTime(300) GiveItemCreate("SCRL84",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(9)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI119~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_1~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI119~
    SAY ~You need 10 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_1~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI120~
    SAY ~Scribe this scroll for 10 gold? This takes 1 hours.~
      IF ~PartyGoldGT(9)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(10) AdvanceTime(300) GiveItemCreate("SCRL5U",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(9)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI120~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_1~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI120~
    SAY ~You need 10 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_1~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI121~
    SAY ~Scribe this scroll for 15 gold? This takes 1 hours.~
      IF ~PartyGoldGT(14)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(15) AdvanceTime(300) GiveItemCreate("SCRL1V",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(14)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI121~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_1~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI121~
    SAY ~You need 15 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_1~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI122~
    SAY ~Scribe this scroll for 30 gold? This takes 1 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(300) GiveItemCreate("BMWI122",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI122~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_1~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI122~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_1~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI123~
    SAY ~Scribe this scroll for 10 gold? This takes 1 hours.~
      IF ~PartyGoldGT(9)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(10) AdvanceTime(300) GiveItemCreate("SCRL6D",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(9)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI123~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_1~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI123~
    SAY ~You need 10 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_1~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI125~
    SAY ~Scribe this scroll for 10 gold? This takes 1 hours.~
      IF ~PartyGoldGT(9)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(10) AdvanceTime(300) GiveItemCreate("SCRLA6",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(9)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI125~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_1~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI125~
    SAY ~You need 10 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_1~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI126~
    SAY ~Scribe this scroll for 30 gold? This takes 1 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(300) GiveItemCreate("BMWI126",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI126~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_1~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI126~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_1~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI201~
    SAY ~Scribe this scroll for 20 gold? This takes 2 hours.~
      IF ~PartyGoldGT(19)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(20) AdvanceTime(600) GiveItemCreate("SCRL85",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(19)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI201~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_2~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI201~
    SAY ~You need 20 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_2~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI203~
    SAY ~Scribe this scroll for 20 gold? This takes 2 hours.~
      IF ~PartyGoldGT(19)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(20) AdvanceTime(600) GiveItemCreate("SCRL87",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(19)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI203~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_2~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI203~
    SAY ~You need 20 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_2~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI204~
    SAY ~Scribe this scroll for 20 gold? This takes 2 hours.~
      IF ~PartyGoldGT(19)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(20) AdvanceTime(600) GiveItemCreate("SCRL86",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(19)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI204~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_2~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI204~
    SAY ~You need 20 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_2~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI205~
    SAY ~Scribe this scroll for 20 gold? This takes 2 hours.~
      IF ~PartyGoldGT(19)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(20) AdvanceTime(600) GiveItemCreate("SCRL89",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(19)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI205~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_2~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI205~
    SAY ~You need 20 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_2~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI206~
    SAY ~Scribe this scroll for 20 gold? This takes 2 hours.~
      IF ~PartyGoldGT(19)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(20) AdvanceTime(600) GiveItemCreate("SCRL90",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(19)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI206~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_2~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI206~
    SAY ~You need 20 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_2~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI207~
    SAY ~Scribe this scroll for 20 gold? This takes 2 hours.~
      IF ~PartyGoldGT(19)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(20) AdvanceTime(600) GiveItemCreate("SCRL91",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(19)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI207~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_2~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI207~
    SAY ~You need 20 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_2~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI208~
    SAY ~Scribe this scroll for 20 gold? This takes 2 hours.~
      IF ~PartyGoldGT(19)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(20) AdvanceTime(600) GiveItemCreate("SCRL92",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(19)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI208~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_2~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI208~
    SAY ~You need 20 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_2~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI209~
    SAY ~Scribe this scroll for 20 gold? This takes 2 hours.~
      IF ~PartyGoldGT(19)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(20) AdvanceTime(600) GiveItemCreate("SCRL93",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(19)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI209~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_2~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI209~
    SAY ~You need 20 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_2~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI210~
    SAY ~Scribe this scroll for 20 gold? This takes 2 hours.~
      IF ~PartyGoldGT(19)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(20) AdvanceTime(600) GiveItemCreate("SCRL94",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(19)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI210~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_2~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI210~
    SAY ~You need 20 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_2~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI211~
    SAY ~Scribe this scroll for 20 gold? This takes 2 hours.~
      IF ~PartyGoldGT(19)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(20) AdvanceTime(600) GiveItemCreate("SCRL95",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(19)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI211~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_2~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI211~
    SAY ~You need 20 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_2~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI212~
    SAY ~Scribe this scroll for 20 gold? This takes 2 hours.~
      IF ~PartyGoldGT(19)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(20) AdvanceTime(600) GiveItemCreate("SCRL96",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(19)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI212~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_2~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI212~
    SAY ~You need 20 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_2~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI213~
    SAY ~Scribe this scroll for 20 gold? This takes 2 hours.~
      IF ~PartyGoldGT(19)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(20) AdvanceTime(600) GiveItemCreate("SCRL97",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(19)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI213~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_2~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI213~
    SAY ~You need 20 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_2~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI214~
    SAY ~Scribe this scroll for 20 gold? This takes 2 hours.~
      IF ~PartyGoldGT(19)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(20) AdvanceTime(600) GiveItemCreate("SCRL98",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(19)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI214~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_2~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI214~
    SAY ~You need 20 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_2~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI215~
    SAY ~Scribe this scroll for 20 gold? This takes 2 hours.~
      IF ~PartyGoldGT(19)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(20) AdvanceTime(600) GiveItemCreate("SCRL99",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(19)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI215~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_2~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI215~
    SAY ~You need 20 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_2~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI216~
    SAY ~Scribe this scroll for 20 gold? This takes 2 hours.~
      IF ~PartyGoldGT(19)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(20) AdvanceTime(600) GiveItemCreate("SCRL2A",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(19)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI216~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_2~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI216~
    SAY ~You need 20 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_2~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI217~
    SAY ~Scribe this scroll for 20 gold? This takes 2 hours.~
      IF ~PartyGoldGT(19)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(20) AdvanceTime(600) GiveItemCreate("SCRL1B",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(19)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI217~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_2~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI217~
    SAY ~You need 20 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_2~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI218~
    SAY ~Scribe this scroll for 20 gold? This takes 2 hours.~
      IF ~PartyGoldGT(19)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(20) AdvanceTime(600) GiveItemCreate("SCRL1C",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(19)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI218~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_2~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI218~
    SAY ~You need 20 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_2~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI219~
    SAY ~Scribe this scroll for 30 gold? This takes 2 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(600) GiveItemCreate("SCRL3G",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI219~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_2~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI219~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_2~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI220~
    SAY ~Scribe this scroll for 20 gold? This takes 2 hours.~
      IF ~PartyGoldGT(19)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(20) AdvanceTime(600) GiveItemCreate("SCRL6E",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(19)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI220~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_2~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI220~
    SAY ~You need 20 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_2~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI221~
    SAY ~Scribe this scroll for 20 gold? This takes 2 hours.~
      IF ~PartyGoldGT(19)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(20) AdvanceTime(600) GiveItemCreate("SCRLAI",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(19)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI221~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_2~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI221~
    SAY ~You need 20 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_2~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI223~
    SAY ~Scribe this scroll for 30 gold? This takes 2 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(600) GiveItemCreate("SCRLA2",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI223~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_2~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI223~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_2~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI224~
    SAY ~Scribe this scroll for 30 gold? This takes 2 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(600) GiveItemCreate("SCRLA3",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI224~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_2~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI224~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_2~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI225~
    SAY ~Scribe this scroll for 20 gold? This takes 2 hours.~
      IF ~PartyGoldGT(19)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(20) AdvanceTime(600) GiveItemCreate("CDIA225",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(19)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI225~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_2~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI225~
    SAY ~You need 20 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_2~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI226~
    SAY ~Scribe this scroll for 20 gold? This takes 2 hours.~
      IF ~PartyGoldGT(19)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(20) AdvanceTime(600) GiveItemCreate("CDIA226",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(19)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI226~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_2~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI226~
    SAY ~You need 20 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_2~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI227~
    SAY ~Scribe this scroll for 20 gold? This takes 2 hours.~
      IF ~PartyGoldGT(19)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(20) AdvanceTime(600) GiveItemCreate("CDIA227",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(19)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI227~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_2~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI227~
    SAY ~You need 20 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_2~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI228~
    SAY ~Scribe this scroll for 30 gold? This takes 2 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(600) GiveItemCreate("BMWI228",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI228~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_2~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI228~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_2~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI301~
    SAY ~Scribe this scroll for 30 gold? This takes 3 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(900) GiveItemCreate("SCRL1D",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI301~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_3~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI301~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_3~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI302~
    SAY ~Scribe this scroll for 30 gold? This takes 3 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(900) GiveItemCreate("SCRL1E",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI302~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_3~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI302~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_3~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI303~
    SAY ~Scribe this scroll for 30 gold? This takes 3 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(900) GiveItemCreate("SCRL1F",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI303~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_3~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI303~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_3~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI304~
    SAY ~Scribe this scroll for 90 gold? This takes 3 hours.~
      IF ~PartyGoldGT(89)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(90) AdvanceTime(900) GiveItemCreate("SCRL1G",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(89)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI304~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_3~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI304~
    SAY ~You need 90 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_3~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI305~
    SAY ~Scribe this scroll for 90 gold? This takes 3 hours.~
      IF ~PartyGoldGT(89)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(90) AdvanceTime(900) GiveItemCreate("SCRL1H",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(89)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI305~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_3~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI305~
    SAY ~You need 90 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_3~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI306~
    SAY ~Scribe this scroll for 30 gold? This takes 3 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(900) GiveItemCreate("SCRL1I",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI306~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_3~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI306~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_3~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI307~
    SAY ~Scribe this scroll for 30 gold? This takes 3 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(900) GiveItemCreate("SCRL1J",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI307~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_3~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI307~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_3~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI308~
    SAY ~Scribe this scroll for 90 gold? This takes 3 hours.~
      IF ~PartyGoldGT(89)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(90) AdvanceTime(900) GiveItemCreate("SCRL1K",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(89)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI308~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_3~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI308~
    SAY ~You need 90 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_3~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI309~
    SAY ~Scribe this scroll for 30 gold? This takes 3 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(900) GiveItemCreate("SCRL1L",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI309~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_3~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI309~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_3~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI310~
    SAY ~Scribe this scroll for 30 gold? This takes 3 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(900) GiveItemCreate("SCRL1M",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI310~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_3~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI310~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_3~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI311~
    SAY ~Scribe this scroll for 90 gold? This takes 3 hours.~
      IF ~PartyGoldGT(89)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(90) AdvanceTime(900) GiveItemCreate("SCRL1N",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(89)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI311~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_3~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI311~
    SAY ~You need 90 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_3~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI312~
    SAY ~Scribe this scroll for 30 gold? This takes 3 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(900) GiveItemCreate("SCRL1O",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI312~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_3~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI312~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_3~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI313~
    SAY ~Scribe this scroll for 30 gold? This takes 3 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(900) GiveItemCreate("SCRL1P",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI313~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_3~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI313~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_3~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI314~
    SAY ~Scribe this scroll for 30 gold? This takes 3 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(900) GiveItemCreate("SCRL1Q",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI314~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_3~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI314~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_3~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI315~
    SAY ~Scribe this scroll for 30 gold? This takes 3 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(900) GiveItemCreate("SCRL1R",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI315~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_3~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI315~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_3~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI316~
    SAY ~Scribe this scroll for 30 gold? This takes 3 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(900) GiveItemCreate("SCRL1S",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI316~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_3~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI316~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_3~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI317~
    SAY ~Scribe this scroll for 30 gold? This takes 3 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(900) GiveItemCreate("SCRL1T",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI317~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_3~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI317~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_3~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI318~
    SAY ~Scribe this scroll for 30 gold? This takes 3 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(900) GiveItemCreate("SCRL6G",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI318~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_3~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI318~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_3~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI321~
    SAY ~Scribe this scroll for 30 gold? This takes 3 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(900) GiveItemCreate("SCRL6J",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI321~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_3~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI321~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_3~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI322~
    SAY ~Scribe this scroll for 30 gold? This takes 3 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(900) GiveItemCreate("SCRL6K",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI322~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_3~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI322~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_3~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI323~
    SAY ~Scribe this scroll for 100 gold? This takes 3 hours.~
      IF ~PartyGoldGT(99)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(100) AdvanceTime(900) GiveItemCreate("SCRL6I",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(99)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI323~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_3~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI323~
    SAY ~You need 100 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_3~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI324~
    SAY ~Scribe this scroll for 30 gold? This takes 3 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(900) GiveItemCreate("SCRL6L",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI324~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_3~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI324~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_3~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI325~
    SAY ~Scribe this scroll for 30 gold? This takes 3 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(900) GiveItemCreate("SCRLA5",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI325~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_3~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI325~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_3~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI327~
    SAY ~Scribe this scroll for 30 gold? This takes 3 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(900) GiveItemCreate("CDIA327",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI327~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_3~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI327~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_3~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI401~
    SAY ~Scribe this scroll for 50 gold? This takes 4 hours.~
      IF ~PartyGoldGT(49)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(50) AdvanceTime(1200) GiveItemCreate("SCRL1U",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(49)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI401~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_4~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI401~
    SAY ~You need 50 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_4~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI404~
    SAY ~Scribe this scroll for 50 gold? This takes 4 hours.~
      IF ~PartyGoldGT(49)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(50) AdvanceTime(1200) GiveItemCreate("SCRL1X",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(49)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI404~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_4~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI404~
    SAY ~You need 50 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_4~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI405~
    SAY ~Scribe this scroll for 50 gold? This takes 4 hours.~
      IF ~PartyGoldGT(49)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(50) AdvanceTime(1200) GiveItemCreate("SCRL1Y",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(49)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI405~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_4~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI405~
    SAY ~You need 50 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_4~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI406~
    SAY ~Scribe this scroll for 50 gold? This takes 4 hours.~
      IF ~PartyGoldGT(49)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(50) AdvanceTime(1200) GiveItemCreate("SCRL1Z",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(49)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI406~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_4~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI406~
    SAY ~You need 50 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_4~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI408~
    SAY ~Scribe this scroll for 50 gold? This takes 4 hours.~
      IF ~PartyGoldGT(49)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(50) AdvanceTime(1200) GiveItemCreate("SCRL2B",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(49)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI408~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_4~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI408~
    SAY ~You need 50 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_4~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI409~
    SAY ~Scribe this scroll for 50 gold? This takes 4 hours.~
      IF ~PartyGoldGT(49)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(50) AdvanceTime(1200) GiveItemCreate("SCRLA8",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(49)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI409~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_4~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI409~
    SAY ~You need 50 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_4~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI410~
    SAY ~Scribe this scroll for 40 gold? This takes 4 hours.~
      IF ~PartyGoldGT(39)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(40) AdvanceTime(1200) GiveItemCreate("SCRL5G",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(39)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI410~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_4~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI410~
    SAY ~You need 40 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_4~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI411~
    SAY ~Scribe this scroll for 50 gold? This takes 4 hours.~
      IF ~PartyGoldGT(49)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(50) AdvanceTime(1200) GiveItemCreate("SCRL5H",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(49)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI411~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_4~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI411~
    SAY ~You need 50 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_4~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI412~
    SAY ~Scribe this scroll for 50 gold? This takes 4 hours.~
      IF ~PartyGoldGT(49)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(50) AdvanceTime(1200) GiveItemCreate("SCRL5I",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(49)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI412~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_4~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI412~
    SAY ~You need 50 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_4~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI413~
    SAY ~Scribe this scroll for 50 gold? This takes 4 hours.~
      IF ~PartyGoldGT(49)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(50) AdvanceTime(1200) GiveItemCreate("SCRL5J",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(49)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI413~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_4~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI413~
    SAY ~You need 50 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_4~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI414~
    SAY ~Scribe this scroll for 50 gold? This takes 4 hours.~
      IF ~PartyGoldGT(49)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(50) AdvanceTime(1200) GiveItemCreate("SCRL5K",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(49)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI414~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_4~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI414~
    SAY ~You need 50 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_4~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI415~
    SAY ~Scribe this scroll for 50 gold? This takes 4 hours.~
      IF ~PartyGoldGT(49)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(50) AdvanceTime(1200) GiveItemCreate("SCRL5L",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(49)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI415~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_4~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI415~
    SAY ~You need 50 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_4~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI416~
    SAY ~Scribe this scroll for 50 gold? This takes 4 hours.~
      IF ~PartyGoldGT(49)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(50) AdvanceTime(1200) GiveItemCreate("SCRL5M",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(49)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI416~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_4~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI416~
    SAY ~You need 50 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_4~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI417~
    SAY ~Scribe this scroll for 50 gold? This takes 4 hours.~
      IF ~PartyGoldGT(49)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(50) AdvanceTime(1200) GiveItemCreate("SCRL6M",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(49)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI417~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_4~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI417~
    SAY ~You need 50 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_4~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI418~
    SAY ~Scribe this scroll for 50 gold? This takes 4 hours.~
      IF ~PartyGoldGT(49)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(50) AdvanceTime(1200) GiveItemCreate("SCRL6N",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(49)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI418~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_4~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI418~
    SAY ~You need 50 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_4~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI419~
    SAY ~Scribe this scroll for 50 gold? This takes 4 hours.~
      IF ~PartyGoldGT(49)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(50) AdvanceTime(1200) GiveItemCreate("SCRL6O",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(49)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI419~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_4~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI419~
    SAY ~You need 50 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_4~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI420~
    SAY ~Scribe this scroll for 50 gold? This takes 4 hours.~
      IF ~PartyGoldGT(49)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(50) AdvanceTime(1200) GiveItemCreate("SCRL6P",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(49)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI420~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_4~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI420~
    SAY ~You need 50 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_4~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI421~
    SAY ~Scribe this scroll for 50 gold? This takes 4 hours.~
      IF ~PartyGoldGT(49)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(50) AdvanceTime(1200) GiveItemCreate("SCRL6Q",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(49)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI421~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_4~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI421~
    SAY ~You need 50 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_4~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI422~
    SAY ~Scribe this scroll for 100 gold? This takes 4 hours.~
      IF ~PartyGoldGT(99)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(100) AdvanceTime(1200) GiveItemCreate("SCRL6H",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(99)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI422~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_4~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI422~
    SAY ~You need 100 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_4~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI423~
    SAY ~Scribe this scroll for 50 gold? This takes 4 hours.~
      IF ~PartyGoldGT(49)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(50) AdvanceTime(1200) GiveItemCreate("SCRL6R",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(49)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI423~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_4~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI423~
    SAY ~You need 50 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_4~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI424~
    SAY ~Scribe this scroll for 70 gold? This takes 4 hours.~
      IF ~PartyGoldGT(69)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(70) AdvanceTime(1200) GiveItemCreate("SCRLAQ",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(69)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI424~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_4~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI424~
    SAY ~You need 70 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_4~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI425~
    SAY ~Scribe this scroll for 50 gold? This takes 4 hours.~
      IF ~PartyGoldGT(49)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(50) AdvanceTime(1200) GiveItemCreate("SCRLA1",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(49)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI425~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_4~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI425~
    SAY ~You need 50 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_4~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI426~
    SAY ~Scribe this scroll for 100 gold? This takes 4 hours.~
      IF ~PartyGoldGT(99)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(100) AdvanceTime(1200) GiveItemCreate("SCRL6Y",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(99)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI426~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_4~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI426~
    SAY ~You need 100 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_4~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI427~
    SAY ~Scribe this scroll for 50 gold? This takes 4 hours.~
      IF ~PartyGoldGT(49)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(50) AdvanceTime(1200) GiveItemCreate("CDIA427",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(49)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI427~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_4~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI427~
    SAY ~You need 50 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_4~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI428~
    SAY ~Scribe this scroll for 50 gold? This takes 4 hours.~
      IF ~PartyGoldGT(49)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(50) AdvanceTime(1200) GiveItemCreate("CDIA428",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(49)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI428~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_4~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI428~
    SAY ~You need 50 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_4~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI429~
    SAY ~Scribe this scroll for 50 gold? This takes 4 hours.~
      IF ~PartyGoldGT(49)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(50) AdvanceTime(1200) GiveItemCreate("CDIA429",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(49)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI429~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_4~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI429~
    SAY ~You need 50 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_4~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI430~
    SAY ~Scribe this scroll for 50 gold? This takes 4 hours.~
      IF ~PartyGoldGT(49)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(50) AdvanceTime(1200) GiveItemCreate("CDIA430",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(49)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI430~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_4~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI430~
    SAY ~You need 50 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_4~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI431~
    SAY ~Scribe this scroll for 50 gold? This takes 4 hours.~
      IF ~PartyGoldGT(49)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(50) AdvanceTime(1200) GiveItemCreate("CDIA431",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(49)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI431~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_4~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI431~
    SAY ~You need 50 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_4~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI432~
    SAY ~Scribe this scroll for 50 gold? This takes 4 hours.~
      IF ~PartyGoldGT(49)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(50) AdvanceTime(1200) GiveItemCreate("CDIA432",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(49)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI432~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_4~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI432~
    SAY ~You need 50 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_4~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI433~
    SAY ~Scribe this scroll for 50 gold? This takes 4 hours.~
      IF ~PartyGoldGT(49)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(50) AdvanceTime(1200) GiveItemCreate("CDIA433",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(49)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI433~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_4~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI433~
    SAY ~You need 50 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_4~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI501~
    SAY ~Scribe this scroll for 100 gold? This takes 5 hours.~
      IF ~PartyGoldGT(99)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(100) AdvanceTime(1500) GiveItemCreate("SCRL2D",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(99)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI501~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_5~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI501~
    SAY ~You need 100 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_5~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI502~
    SAY ~Scribe this scroll for 100 gold? This takes 5 hours.~
      IF ~PartyGoldGT(99)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(100) AdvanceTime(1500) GiveItemCreate("SCRL2E",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(99)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI502~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_5~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI502~
    SAY ~You need 100 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_5~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI503~
    SAY ~Scribe this scroll for 100 gold? This takes 5 hours.~
      IF ~PartyGoldGT(99)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(100) AdvanceTime(1500) GiveItemCreate("SCRL2F",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(99)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI503~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_5~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI503~
    SAY ~You need 100 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_5~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI504~
    SAY ~Scribe this scroll for 100 gold? This takes 5 hours.~
      IF ~PartyGoldGT(99)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(100) AdvanceTime(1500) GiveItemCreate("SCRL2G",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(99)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI504~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_5~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI504~
    SAY ~You need 100 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_5~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI505~
    SAY ~Scribe this scroll for 100 gold? This takes 5 hours.~
      IF ~PartyGoldGT(99)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(100) AdvanceTime(1500) GiveItemCreate("SCRL2H",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(99)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI505~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_5~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI505~
    SAY ~You need 100 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_5~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI506~
    SAY ~Scribe this scroll for 100 gold? This takes 5 hours.~
      IF ~PartyGoldGT(99)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(100) AdvanceTime(1500) GiveItemCreate("SCRL5N",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(99)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI506~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_5~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI506~
    SAY ~You need 100 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_5~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI507~
    SAY ~Scribe this scroll for 100 gold? This takes 5 hours.~
      IF ~PartyGoldGT(99)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(100) AdvanceTime(1500) GiveItemCreate("SCRL5O",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(99)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI507~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_5~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI507~
    SAY ~You need 100 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_5~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI508~
    SAY ~Scribe this scroll for 100 gold? This takes 5 hours.~
      IF ~PartyGoldGT(99)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(100) AdvanceTime(1500) GiveItemCreate("SCRL5P",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(99)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI508~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_5~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI508~
    SAY ~You need 100 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_5~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI509~
    SAY ~Scribe this scroll for 100 gold? This takes 5 hours.~
      IF ~PartyGoldGT(99)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(100) AdvanceTime(1500) GiveItemCreate("SCRL5Q",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(99)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI509~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_5~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI509~
    SAY ~You need 100 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_5~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI510~
    SAY ~Scribe this scroll for 100 gold? This takes 5 hours.~
      IF ~PartyGoldGT(99)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(100) AdvanceTime(1500) GiveItemCreate("SCRL6S",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(99)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI510~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_5~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI510~
    SAY ~You need 100 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_5~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI511~
    SAY ~Scribe this scroll for 100 gold? This takes 5 hours.~
      IF ~PartyGoldGT(99)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(100) AdvanceTime(1500) GiveItemCreate("SCRL6T",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(99)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI511~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_5~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI511~
    SAY ~You need 100 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_5~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI513~
    SAY ~Scribe this scroll for 100 gold? This takes 5 hours.~
      IF ~PartyGoldGT(99)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(100) AdvanceTime(1500) GiveItemCreate("SCRL6U",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(99)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI513~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_5~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI513~
    SAY ~You need 100 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_5~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI514~
    SAY ~Scribe this scroll for 100 gold? This takes 5 hours.~
      IF ~PartyGoldGT(99)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(100) AdvanceTime(1500) GiveItemCreate("SCRL6V",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(99)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI514~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_5~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI514~
    SAY ~You need 100 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_5~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI515~
    SAY ~Scribe this scroll for 100 gold? This takes 5 hours.~
      IF ~PartyGoldGT(99)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(100) AdvanceTime(1500) GiveItemCreate("SCRL6W",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(99)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI515~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_5~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI515~
    SAY ~You need 100 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_5~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI516~
    SAY ~Scribe this scroll for 100 gold? This takes 5 hours.~
      IF ~PartyGoldGT(99)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(100) AdvanceTime(1500) GiveItemCreate("SCRL6X",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(99)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI516~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_5~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI516~
    SAY ~You need 100 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_5~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI518~
    SAY ~Scribe this scroll for 100 gold? This takes 5 hours.~
      IF ~PartyGoldGT(99)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(100) AdvanceTime(1500) GiveItemCreate("SCRL6Z",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(99)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI518~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_5~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI518~
    SAY ~You need 100 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_5~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI519~
    SAY ~Scribe this scroll for 500 gold? This takes 5 hours.~
      IF ~PartyGoldGT(499)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(500) AdvanceTime(1500) GiveItemCreate("SCRL8X",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(499)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI519~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_5~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI519~
    SAY ~You need 500 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_5~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI520~
    SAY ~Scribe this scroll for 100 gold? This takes 5 hours.~
      IF ~PartyGoldGT(99)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(100) AdvanceTime(1500) GiveItemCreate("SCRL7B",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(99)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI520~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_5~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI520~
    SAY ~You need 100 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_5~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI521~
    SAY ~Scribe this scroll for 100 gold? This takes 5 hours.~
      IF ~PartyGoldGT(99)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(100) AdvanceTime(1500) GiveItemCreate("SCRL7C",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(99)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI521~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_5~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI521~
    SAY ~You need 100 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_5~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI522~
    SAY ~Scribe this scroll for 100 gold? This takes 5 hours.~
      IF ~PartyGoldGT(99)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(100) AdvanceTime(1500) GiveItemCreate("SCRL7D",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(99)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI522~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_5~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI522~
    SAY ~You need 100 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_5~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI523~
    SAY ~Scribe this scroll for 50 gold? This takes 5 hours.~
      IF ~PartyGoldGT(49)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(50) AdvanceTime(1500) GiveItemCreate("SCRLAL",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(49)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI523~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_5~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI523~
    SAY ~You need 50 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_5~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI524~
    SAY ~Scribe this scroll for 100 gold? This takes 5 hours.~
      IF ~PartyGoldGT(99)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(100) AdvanceTime(1500) GiveItemCreate("SCRL1W",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(99)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI524~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_5~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI524~
    SAY ~You need 100 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_5~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI525~
    SAY ~Scribe this scroll for 100 gold? This takes 5 hours.~
      IF ~PartyGoldGT(99)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(100) AdvanceTime(1500) GiveItemCreate("CDIA525",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(99)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI525~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_5~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI525~
    SAY ~You need 100 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_5~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI526~
    SAY ~Scribe this scroll for 100 gold? This takes 5 hours.~
      IF ~PartyGoldGT(99)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(100) AdvanceTime(1500) GiveItemCreate("CDIA526",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(99)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI526~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_5~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI526~
    SAY ~You need 100 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_5~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI527~
    SAY ~Scribe this scroll for 100 gold? This takes 5 hours.~
      IF ~PartyGoldGT(99)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(100) AdvanceTime(1500) GiveItemCreate("CDIA527",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(99)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI527~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_5~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI527~
    SAY ~You need 100 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_5~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI601~
    SAY ~Scribe this scroll for 200 gold? This takes 6 hours.~
      IF ~PartyGoldGT(199)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(200) AdvanceTime(1800) GiveItemCreate("SCRL7E",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(199)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI601~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_6~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI601~
    SAY ~You need 200 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_6~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI602~
    SAY ~Scribe this scroll for 200 gold? This takes 6 hours.~
      IF ~PartyGoldGT(199)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(200) AdvanceTime(1800) GiveItemCreate("SCRL7F",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(199)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI602~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_6~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI602~
    SAY ~You need 200 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_6~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI603~
    SAY ~Scribe this scroll for 200 gold? This takes 6 hours.~
      IF ~PartyGoldGT(199)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(200) AdvanceTime(1800) GiveItemCreate("SCRL7G",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(199)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI603~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_6~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI603~
    SAY ~You need 200 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_6~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI604~
    SAY ~Scribe this scroll for 200 gold? This takes 6 hours.~
      IF ~PartyGoldGT(199)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(200) AdvanceTime(1800) GiveItemCreate("SCRL7H",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(199)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI604~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_6~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI604~
    SAY ~You need 200 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_6~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI605~
    SAY ~Scribe this scroll for 200 gold? This takes 6 hours.~
      IF ~PartyGoldGT(199)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(200) AdvanceTime(1800) GiveItemCreate("SCRL7I",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(199)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI605~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_6~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI605~
    SAY ~You need 200 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_6~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI606~
    SAY ~Scribe this scroll for 200 gold? This takes 6 hours.~
      IF ~PartyGoldGT(199)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(200) AdvanceTime(1800) GiveItemCreate("SCRL7J",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(199)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI606~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_6~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI606~
    SAY ~You need 200 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_6~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI607~
    SAY ~Scribe this scroll for 200 gold? This takes 6 hours.~
      IF ~PartyGoldGT(199)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(200) AdvanceTime(1800) GiveItemCreate("SCRL7K",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(199)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI607~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_6~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI607~
    SAY ~You need 200 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_6~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI608~
    SAY ~Scribe this scroll for 200 gold? This takes 6 hours.~
      IF ~PartyGoldGT(199)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(200) AdvanceTime(1800) GiveItemCreate("SCRL7L",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(199)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI608~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_6~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI608~
    SAY ~You need 200 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_6~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI609~
    SAY ~Scribe this scroll for 200 gold? This takes 6 hours.~
      IF ~PartyGoldGT(199)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(200) AdvanceTime(1800) GiveItemCreate("SCRL7M",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(199)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI609~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_6~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI609~
    SAY ~You need 200 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_6~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI610~
    SAY ~Scribe this scroll for 200 gold? This takes 6 hours.~
      IF ~PartyGoldGT(199)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(200) AdvanceTime(1800) GiveItemCreate("SCRL7W",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(199)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI610~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_6~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI610~
    SAY ~You need 200 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_6~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI611~
    SAY ~Scribe this scroll for 200 gold? This takes 6 hours.~
      IF ~PartyGoldGT(199)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(200) AdvanceTime(1800) GiveItemCreate("SCRL7O",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(199)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI611~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_6~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI611~
    SAY ~You need 200 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_6~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI612~
    SAY ~Scribe this scroll for 200 gold? This takes 6 hours.~
      IF ~PartyGoldGT(199)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(200) AdvanceTime(1800) GiveItemCreate("SCRL7P",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(199)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI612~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_6~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI612~
    SAY ~You need 200 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_6~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI613~
    SAY ~Scribe this scroll for 200 gold? This takes 6 hours.~
      IF ~PartyGoldGT(199)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(200) AdvanceTime(1800) GiveItemCreate("SCRL7Q",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(199)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI613~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_6~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI613~
    SAY ~You need 200 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_6~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI614~
    SAY ~Scribe this scroll for 200 gold? This takes 6 hours.~
      IF ~PartyGoldGT(199)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(200) AdvanceTime(1800) GiveItemCreate("SCRL7R",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(199)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI614~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_6~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI614~
    SAY ~You need 200 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_6~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI615~
    SAY ~Scribe this scroll for 200 gold? This takes 6 hours.~
      IF ~PartyGoldGT(199)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(200) AdvanceTime(1800) GiveItemCreate("SCRL7S",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(199)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI615~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_6~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI615~
    SAY ~You need 200 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_6~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI616~
    SAY ~Scribe this scroll for 200 gold? This takes 6 hours.~
      IF ~PartyGoldGT(199)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(200) AdvanceTime(1800) GiveItemCreate("SCRL7T",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(199)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI616~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_6~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI616~
    SAY ~You need 200 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_6~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI617~
    SAY ~Scribe this scroll for 200 gold? This takes 6 hours.~
      IF ~PartyGoldGT(199)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(200) AdvanceTime(1800) GiveItemCreate("SCRL7U",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(199)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI617~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_6~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI617~
    SAY ~You need 200 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_6~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI620~
    SAY ~Scribe this scroll for 200 gold? This takes 6 hours.~
      IF ~PartyGoldGT(199)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(200) AdvanceTime(1800) GiveItemCreate("SCRL7X",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(199)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI620~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_6~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI620~
    SAY ~You need 200 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_6~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI621~
    SAY ~Scribe this scroll for 200 gold? This takes 6 hours.~
      IF ~PartyGoldGT(199)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(200) AdvanceTime(1800) GiveItemCreate("SCRL7Y",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(199)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI621~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_6~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI621~
    SAY ~You need 200 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_6~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI622~
    SAY ~Scribe this scroll for 200 gold? This takes 6 hours.~
      IF ~PartyGoldGT(199)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(200) AdvanceTime(1800) GiveItemCreate("SCRL7Z",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(199)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI622~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_6~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI622~
    SAY ~You need 200 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_6~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI623~
    SAY ~Scribe this scroll for 200 gold? This takes 6 hours.~
      IF ~PartyGoldGT(199)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(200) AdvanceTime(1800) GiveItemCreate("SCRL8A",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(199)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI623~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_6~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI623~
    SAY ~You need 200 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_6~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI626~
    SAY ~Scribe this scroll for 200 gold? This takes 6 hours.~
      IF ~PartyGoldGT(199)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(200) AdvanceTime(1800) GiveItemCreate("CDIA626",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(199)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI626~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_6~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI626~
    SAY ~You need 200 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_6~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI627~
    SAY ~Scribe this scroll for 200 gold? This takes 6 hours.~
      IF ~PartyGoldGT(199)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(200) AdvanceTime(1800) GiveItemCreate("CDIA627",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(199)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI627~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_6~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI627~
    SAY ~You need 200 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_6~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI628~
    SAY ~Scribe this scroll for 200 gold? This takes 6 hours.~
      IF ~PartyGoldGT(199)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(200) AdvanceTime(1800) GiveItemCreate("CDIA628",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(199)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI628~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_6~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI628~
    SAY ~You need 200 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_6~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI629~
    SAY ~Scribe this scroll for 200 gold? This takes 6 hours.~
      IF ~PartyGoldGT(199)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(200) AdvanceTime(1800) GiveItemCreate("CDIA629",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(199)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI629~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_6~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI629~
    SAY ~You need 200 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_6~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI630~
    SAY ~Scribe this scroll for 200 gold? This takes 6 hours.~
      IF ~PartyGoldGT(199)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(200) AdvanceTime(1800) GiveItemCreate("CDIA630",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(199)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI630~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_6~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI630~
    SAY ~You need 200 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_6~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI631~
    SAY ~Scribe this scroll for 200 gold? This takes 6 hours.~
      IF ~PartyGoldGT(199)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(200) AdvanceTime(1800) GiveItemCreate("CDIA631",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(199)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI631~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_6~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI631~
    SAY ~You need 200 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_6~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI632~
    SAY ~Scribe this scroll for 200 gold? This takes 6 hours.~
      IF ~PartyGoldGT(199)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(200) AdvanceTime(1800) GiveItemCreate("CDIA632",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(199)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI632~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_6~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI632~
    SAY ~You need 200 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_6~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI633~
    SAY ~Scribe this scroll for 200 gold? This takes 6 hours.~
      IF ~PartyGoldGT(199)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(200) AdvanceTime(1800) GiveItemCreate("CDIA633",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(199)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI633~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_6~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI633~
    SAY ~You need 200 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_6~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI701~
    SAY ~Scribe this scroll for 100 gold? This takes 7 hours.~
      IF ~PartyGoldGT(99)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(100) AdvanceTime(2100) GiveItemCreate("SCRL7V",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(99)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI701~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_7~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI701~
    SAY ~You need 100 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_7~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI702~
    SAY ~Scribe this scroll for 300 gold? This takes 7 hours.~
      IF ~PartyGoldGT(299)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(300) AdvanceTime(2100) GiveItemCreate("SCRL8E",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(299)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI702~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_7~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI702~
    SAY ~You need 300 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_7~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI703~
    SAY ~Scribe this scroll for 300 gold? This takes 7 hours.~
      IF ~PartyGoldGT(299)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(300) AdvanceTime(2100) GiveItemCreate("SCRL8F",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(299)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI703~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_7~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI703~
    SAY ~You need 300 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_7~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI704~
    SAY ~Scribe this scroll for 300 gold? This takes 7 hours.~
      IF ~PartyGoldGT(299)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(300) AdvanceTime(2100) GiveItemCreate("SCRL8G",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(299)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI704~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_7~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI704~
    SAY ~You need 300 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_7~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI705~
    SAY ~Scribe this scroll for 300 gold? This takes 7 hours.~
      IF ~PartyGoldGT(299)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(300) AdvanceTime(2100) GiveItemCreate("SCRL8H",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(299)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI705~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_7~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI705~
    SAY ~You need 300 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_7~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI706~
    SAY ~Scribe this scroll for 200 gold? This takes 7 hours.~
      IF ~PartyGoldGT(199)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(200) AdvanceTime(2100) GiveItemCreate("SCRL8B",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(199)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI706~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_7~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI706~
    SAY ~You need 200 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_7~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI707~
    SAY ~Scribe this scroll for 300 gold? This takes 7 hours.~
      IF ~PartyGoldGT(299)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(300) AdvanceTime(2100) GiveItemCreate("SCRL8I",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(299)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI707~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_7~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI707~
    SAY ~You need 300 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_7~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI708~
    SAY ~Scribe this scroll for 300 gold? This takes 7 hours.~
      IF ~PartyGoldGT(299)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(300) AdvanceTime(2100) GiveItemCreate("SCRL8J",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(299)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI708~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_7~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI708~
    SAY ~You need 300 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_7~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI709~
    SAY ~Scribe this scroll for 300 gold? This takes 7 hours.~
      IF ~PartyGoldGT(299)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(300) AdvanceTime(2100) GiveItemCreate("CDIA709",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(299)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI709~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_7~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI709~
    SAY ~You need 300 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_7~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI710~
    SAY ~Scribe this scroll for 300 gold? This takes 7 hours.~
      IF ~PartyGoldGT(299)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(300) AdvanceTime(2100) GiveItemCreate("SCRL8L",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(299)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI710~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_7~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI710~
    SAY ~You need 300 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_7~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI711~
    SAY ~Scribe this scroll for 300 gold? This takes 7 hours.~
      IF ~PartyGoldGT(299)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(300) AdvanceTime(2100) GiveItemCreate("SCRL8M",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(299)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI711~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_7~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI711~
    SAY ~You need 300 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_7~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI712~
    SAY ~Scribe this scroll for 300 gold? This takes 7 hours.~
      IF ~PartyGoldGT(299)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(300) AdvanceTime(2100) GiveItemCreate("SCRL8N",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(299)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI712~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_7~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI712~
    SAY ~You need 300 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_7~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI713~
    SAY ~Scribe this scroll for 300 gold? This takes 7 hours.~
      IF ~PartyGoldGT(299)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(300) AdvanceTime(2100) GiveItemCreate("SCRL8O",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(299)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI713~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_7~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI713~
    SAY ~You need 300 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_7~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI714~
    SAY ~Scribe this scroll for 300 gold? This takes 7 hours.~
      IF ~PartyGoldGT(299)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(300) AdvanceTime(2100) GiveItemCreate("SCRL8P",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(299)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI714~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_7~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI714~
    SAY ~You need 300 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_7~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI715~
    SAY ~Scribe this scroll for 300 gold? This takes 7 hours.~
      IF ~PartyGoldGT(299)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(300) AdvanceTime(2100) GiveItemCreate("SCRL8Q",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(299)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI715~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_7~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI715~
    SAY ~You need 300 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_7~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI716~
    SAY ~Scribe this scroll for 300 gold? This takes 7 hours.~
      IF ~PartyGoldGT(299)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(300) AdvanceTime(2100) GiveItemCreate("SCRL8R",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(299)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI716~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_7~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI716~
    SAY ~You need 300 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_7~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI717~
    SAY ~Scribe this scroll for 300 gold? This takes 7 hours.~
      IF ~PartyGoldGT(299)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(300) AdvanceTime(2100) GiveItemCreate("SCRL8S",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(299)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI717~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_7~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI717~
    SAY ~You need 300 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_7~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI718~
    SAY ~Scribe this scroll for 300 gold? This takes 7 hours.~
      IF ~PartyGoldGT(299)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(300) AdvanceTime(2100) GiveItemCreate("SCRL8T",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(299)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI718~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_7~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI718~
    SAY ~You need 300 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_7~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI719~
    SAY ~Scribe this scroll for 300 gold? This takes 7 hours.~
      IF ~PartyGoldGT(299)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(300) AdvanceTime(2100) GiveItemCreate("SCRL8U",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(299)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI719~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_7~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI719~
    SAY ~You need 300 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_7~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI720~
    SAY ~Scribe this scroll for 300 gold? This takes 7 hours.~
      IF ~PartyGoldGT(299)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(300) AdvanceTime(2100) GiveItemCreate("SCRL8V",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(299)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI720~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_7~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI720~
    SAY ~You need 300 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_7~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI721~
    SAY ~Scribe this scroll for 300 gold? This takes 7 hours.~
      IF ~PartyGoldGT(299)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(300) AdvanceTime(2100) GiveItemCreate("SCRL8W",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(299)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI721~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_7~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI721~
    SAY ~You need 300 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_7~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI722~
    SAY ~Scribe this scroll for 300 gold? This takes 7 hours.~
      IF ~PartyGoldGT(299)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(300) AdvanceTime(2100) GiveItemCreate("SCRLA4",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(299)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI722~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_7~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI722~
    SAY ~You need 300 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_7~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI724~
    SAY ~Scribe this scroll for 300 gold? This takes 7 hours.~
      IF ~PartyGoldGT(299)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(300) AdvanceTime(2100) GiveItemCreate("CDIA724",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(299)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI724~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_7~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI724~
    SAY ~You need 300 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_7~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI725~
    SAY ~Scribe this scroll for 300 gold? This takes 7 hours.~
      IF ~PartyGoldGT(299)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(300) AdvanceTime(2100) GiveItemCreate("CDIA725",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(299)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI725~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_7~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI725~
    SAY ~You need 300 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_7~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI726~
    SAY ~Scribe this scroll for 300 gold? This takes 7 hours.~
      IF ~PartyGoldGT(299)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(300) AdvanceTime(2100) GiveItemCreate("CDIA726",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(299)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI726~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_7~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI726~
    SAY ~You need 300 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_7~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI727~
    SAY ~Scribe this scroll for 300 gold? This takes 7 hours.~
      IF ~PartyGoldGT(299)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(300) AdvanceTime(2100) GiveItemCreate("CDIA727",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(299)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI727~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_7~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI727~
    SAY ~You need 300 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_7~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI801~
    SAY ~Scribe this scroll for 500 gold? This takes 8 hours.~
      IF ~PartyGoldGT(499)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(500) AdvanceTime(2400) GiveItemCreate("SCRLW801",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(499)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI801~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_8~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI801~
    SAY ~You need 500 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_8~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI802~
    SAY ~Scribe this scroll for 500 gold? This takes 8 hours.~
      IF ~PartyGoldGT(499)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(500) AdvanceTime(2400) GiveItemCreate("SCRL8D",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(499)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI802~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_8~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI802~
    SAY ~You need 500 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_8~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI803~
    SAY ~Scribe this scroll for 500 gold? This takes 8 hours.~
      IF ~PartyGoldGT(499)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(500) AdvanceTime(2400) GiveItemCreate("SCRL8Y",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(499)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI803~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_8~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI803~
    SAY ~You need 500 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_8~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI804~
    SAY ~Scribe this scroll for 500 gold? This takes 8 hours.~
      IF ~PartyGoldGT(499)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(500) AdvanceTime(2400) GiveItemCreate("SCRL8Z",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(499)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI804~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_8~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI804~
    SAY ~You need 500 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_8~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI805~
    SAY ~Scribe this scroll for 500 gold? This takes 8 hours.~
      IF ~PartyGoldGT(499)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(500) AdvanceTime(2400) GiveItemCreate("SCRL9A",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(499)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI805~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_8~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI805~
    SAY ~You need 500 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_8~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI806~
    SAY ~Scribe this scroll for 500 gold? This takes 8 hours.~
      IF ~PartyGoldGT(499)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(500) AdvanceTime(2400) GiveItemCreate("SCRL8C",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(499)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI806~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_8~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI806~
    SAY ~You need 500 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_8~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI807~
    SAY ~Scribe this scroll for 500 gold? This takes 8 hours.~
      IF ~PartyGoldGT(499)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(500) AdvanceTime(2400) GiveItemCreate("SCRL9B",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(499)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI807~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_8~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI807~
    SAY ~You need 500 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_8~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI808~
    SAY ~Scribe this scroll for 500 gold? This takes 8 hours.~
      IF ~PartyGoldGT(499)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(500) AdvanceTime(2400) GiveItemCreate("SCRL9C",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(499)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI808~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_8~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI808~
    SAY ~You need 500 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_8~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI809~
    SAY ~Scribe this scroll for 500 gold? This takes 8 hours.~
      IF ~PartyGoldGT(499)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(500) AdvanceTime(2400) GiveItemCreate("SCRL9D",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(499)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI809~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_8~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI809~
    SAY ~You need 500 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_8~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI810~
    SAY ~Scribe this scroll for 500 gold? This takes 8 hours.~
      IF ~PartyGoldGT(499)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(500) AdvanceTime(2400) GiveItemCreate("SCRL9E",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(499)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI810~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_8~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI810~
    SAY ~You need 500 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_8~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI811~
    SAY ~Scribe this scroll for 500 gold? This takes 8 hours.~
      IF ~PartyGoldGT(499)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(500) AdvanceTime(2400) GiveItemCreate("SCRL9F",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(499)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI811~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_8~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI811~
    SAY ~You need 500 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_8~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI812~
    SAY ~Scribe this scroll for 500 gold? This takes 8 hours.~
      IF ~PartyGoldGT(499)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(500) AdvanceTime(2400) GiveItemCreate("SCRL9G",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(499)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI812~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_8~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI812~
    SAY ~You need 500 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_8~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI813~
    SAY ~Scribe this scroll for 300 gold? This takes 8 hours.~
      IF ~PartyGoldGT(299)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(300) AdvanceTime(2400) GiveItemCreate("SCRL9H",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(299)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI813~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_8~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI813~
    SAY ~You need 300 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_8~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI814~
    SAY ~Scribe this scroll for 500 gold? This takes 8 hours.~
      IF ~PartyGoldGT(499)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(500) AdvanceTime(2400) GiveItemCreate("CDIA814",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(499)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI814~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_8~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI814~
    SAY ~You need 500 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_8~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI815~
    SAY ~Scribe this scroll for 500 gold? This takes 8 hours.~
      IF ~PartyGoldGT(499)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(500) AdvanceTime(2400) GiveItemCreate("SCRL9J",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(499)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI815~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_8~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI815~
    SAY ~You need 500 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_8~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI816~
    SAY ~Scribe this scroll for 500 gold? This takes 8 hours.~
      IF ~PartyGoldGT(499)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(500) AdvanceTime(2400) GiveItemCreate("SCRLAP",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(499)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI816~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_8~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI816~
    SAY ~You need 500 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_8~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI817~
    SAY ~Scribe this scroll for 500 gold? This takes 8 hours.~
      IF ~PartyGoldGT(499)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(500) AdvanceTime(2400) GiveItemCreate("SCRLAO",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(499)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI817~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_8~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI817~
    SAY ~You need 500 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_8~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI818~
    SAY ~Scribe this scroll for 500 gold? This takes 8 hours.~
      IF ~PartyGoldGT(499)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(500) AdvanceTime(2400) GiveItemCreate("SCRLB1",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(499)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI818~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_8~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI818~
    SAY ~You need 500 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_8~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI819~
    SAY ~Scribe this scroll for 500 gold? This takes 8 hours.~
      IF ~PartyGoldGT(499)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(500) AdvanceTime(2400) GiveItemCreate("CDIA819",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(499)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI819~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_8~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI819~
    SAY ~You need 500 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_8~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI901~
    SAY ~Scribe this scroll for 1000 gold? This takes 9 hours.~
      IF ~PartyGoldGT(999)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(1000) AdvanceTime(2700) GiveItemCreate("CDIA901",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(999)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI901~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_9~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI901~
    SAY ~You need 1000 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_9~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI902~
    SAY ~Scribe this scroll for 600 gold? This takes 9 hours.~
      IF ~PartyGoldGT(599)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(600) AdvanceTime(2700) GiveItemCreate("SCRL9L",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(599)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI902~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_9~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI902~
    SAY ~You need 600 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_9~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI903~
    SAY ~Scribe this scroll for 600 gold? This takes 9 hours.~
      IF ~PartyGoldGT(599)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(600) AdvanceTime(2700) GiveItemCreate("SCRL9M",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(599)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI903~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_9~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI903~
    SAY ~You need 600 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_9~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI905~
    SAY ~Scribe this scroll for 600 gold? This takes 9 hours.~
      IF ~PartyGoldGT(599)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(600) AdvanceTime(2700) GiveItemCreate("SCRL9N",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(599)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI905~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_9~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI905~
    SAY ~You need 600 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_9~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI907~
    SAY ~Scribe this scroll for 600 gold? This takes 9 hours.~
      IF ~PartyGoldGT(599)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(600) AdvanceTime(2700) GiveItemCreate("SCRL9P",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(599)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI907~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_9~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI907~
    SAY ~You need 600 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_9~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI908~
    SAY ~Scribe this scroll for 600 gold? This takes 9 hours.~
      IF ~PartyGoldGT(599)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(600) AdvanceTime(2700) GiveItemCreate("SCRL9Q",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(599)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI908~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_9~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI908~
    SAY ~You need 600 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_9~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI909~
    SAY ~Scribe this scroll for 600 gold? This takes 9 hours.~
      IF ~PartyGoldGT(599)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(600) AdvanceTime(2700) GiveItemCreate("SCRL9R",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(599)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI909~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_9~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI909~
    SAY ~You need 600 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_9~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI910~
    SAY ~Scribe this scroll for 500 gold? This takes 9 hours.~
      IF ~PartyGoldGT(499)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(500) AdvanceTime(2700) GiveItemCreate("SCRL9S",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(499)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI910~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_9~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI910~
    SAY ~You need 500 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_9~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI911~
    SAY ~Scribe this scroll for 600 gold? This takes 9 hours.~
      IF ~PartyGoldGT(599)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(600) AdvanceTime(2700) GiveItemCreate("SCRL9T",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(599)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI911~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_9~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI911~
    SAY ~You need 600 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_9~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI912~
    SAY ~Scribe this scroll for 600 gold? This takes 9 hours.~
      IF ~PartyGoldGT(599)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(600) AdvanceTime(2700) GiveItemCreate("SCRL9U",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(599)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI912~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_9~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI912~
    SAY ~You need 600 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_9~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI913~
    SAY ~Scribe this scroll for 600 gold? This takes 9 hours.~
      IF ~PartyGoldGT(599)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(600) AdvanceTime(2700) GiveItemCreate("SCRL9V",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(599)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI913~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_9~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI913~
    SAY ~You need 600 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_9~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI914~
    SAY ~Scribe this scroll for 600 gold? This takes 9 hours.~
      IF ~PartyGoldGT(599)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(600) AdvanceTime(2700) GiveItemCreate("SCRL9W",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(599)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI914~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_9~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI914~
    SAY ~You need 600 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_9~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI915~
    SAY ~Scribe this scroll for 600 gold? This takes 9 hours.~
      IF ~PartyGoldGT(599)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(600) AdvanceTime(2700) GiveItemCreate("SCRL9X",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(599)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI915~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_9~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI915~
    SAY ~You need 600 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_9~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI916~
    SAY ~Scribe this scroll for 600 gold? This takes 9 hours.~
      IF ~PartyGoldGT(599)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(600) AdvanceTime(2700) GiveItemCreate("SCRL9Y",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(599)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI916~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_9~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI916~
    SAY ~You need 600 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_9~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI917~
    SAY ~Scribe this scroll for 50 gold? This takes 9 hours.~
      IF ~PartyGoldGT(49)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(50) AdvanceTime(2700) GiveItemCreate("SCRL9Z",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(49)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI917~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_9~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI917~
    SAY ~You need 50 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_9~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI918~
    SAY ~Scribe this scroll for 500 gold? This takes 9 hours.~
      IF ~PartyGoldGT(499)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(500) AdvanceTime(2700) GiveItemCreate("SCRLB2",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(499)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI918~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_9~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI918~
    SAY ~You need 500 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_9~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPWI919~
    SAY ~Scribe this scroll for 500 gold? This takes 9 hours.~
      IF ~PartyGoldGT(499)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(500) AdvanceTime(2700) GiveItemCreate("SCRLB4",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(499)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPWI919~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_9~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPWI919~
    SAY ~You need 500 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_9~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR101~
    SAY ~Scribe this scroll for 30 gold? This takes 1 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(300) GiveItemCreate("BMPR101",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR101~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_1~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR101~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_1~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR102~
    SAY ~Scribe this scroll for 30 gold? This takes 1 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(300) GiveItemCreate("BMPR102",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR102~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_1~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR102~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_1~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR103~
    SAY ~Scribe this scroll for 30 gold? This takes 1 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(300) GiveItemCreate("BMPR103",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR103~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_1~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR103~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_1~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR104~
    SAY ~Scribe this scroll for 30 gold? This takes 1 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(300) GiveItemCreate("BMPR104",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR104~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_1~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR104~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_1~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR105~
    SAY ~Scribe this scroll for 30 gold? This takes 1 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(300) GiveItemCreate("BMPR105",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR105~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_1~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR105~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_1~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR106~
    SAY ~Scribe this scroll for 30 gold? This takes 1 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(300) GiveItemCreate("BMPR106",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR106~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_1~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR106~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_1~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR107~
    SAY ~Scribe this scroll for 30 gold? This takes 1 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(300) GiveItemCreate("BMPR107",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR107~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_1~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR107~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_1~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR108~
    SAY ~Scribe this scroll for 30 gold? This takes 1 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(300) GiveItemCreate("BMPR108",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR108~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_1~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR108~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_1~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR109~
    SAY ~Scribe this scroll for 30 gold? This takes 1 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(300) GiveItemCreate("BMPR109",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR109~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_1~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR109~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_1~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR110~
    SAY ~Scribe this scroll for 30 gold? This takes 1 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(300) GiveItemCreate("BMPR110",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR110~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_1~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR110~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_1~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR111~
    SAY ~Scribe this scroll for 30 gold? This takes 1 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(300) GiveItemCreate("BMPR111",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR111~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_1~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR111~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_1~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR112~
    SAY ~Scribe this scroll for 30 gold? This takes 1 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(300) GiveItemCreate("BMPR112",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR112~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_1~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR112~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_1~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR113~
    SAY ~Scribe this scroll for 30 gold? This takes 1 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(300) GiveItemCreate("BMPR113",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR113~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_1~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR113~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_1~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR114~
    SAY ~Scribe this scroll for 30 gold? This takes 1 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(300) GiveItemCreate("BMPR114",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR114~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_1~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR114~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_1~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR115~
    SAY ~Scribe this scroll for 30 gold? This takes 1 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(300) GiveItemCreate("BMPR115",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR115~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_1~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR115~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_1~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR116~
    SAY ~Scribe this scroll for 30 gold? This takes 1 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(300) GiveItemCreate("BMPR116",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR116~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_1~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR116~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_1~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR117~
    SAY ~Scribe this scroll for 30 gold? This takes 1 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(300) GiveItemCreate("BMPR117",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR117~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_1~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR117~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_1~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR118~
    SAY ~Scribe this scroll for 30 gold? This takes 1 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(300) GiveItemCreate("BMPR118",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR118~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_1~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR118~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_1~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR119~
    SAY ~Scribe this scroll for 30 gold? This takes 1 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(300) GiveItemCreate("BMPR119",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR119~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_1~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR119~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_1~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR120~
    SAY ~Scribe this scroll for 30 gold? This takes 1 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(300) GiveItemCreate("BMPR120",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR120~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_1~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR120~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_1~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR121~
    SAY ~Scribe this scroll for 30 gold? This takes 1 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(300) GiveItemCreate("BMPR121",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR121~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_1~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR121~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_1~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR201~
    SAY ~Scribe this scroll for 30 gold? This takes 2 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(600) GiveItemCreate("BMPR201",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR201~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_2~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR201~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_2~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR202~
    SAY ~Scribe this scroll for 30 gold? This takes 2 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(600) GiveItemCreate("BMPR202",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR202~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_2~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR202~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_2~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR203~
    SAY ~Scribe this scroll for 20 gold? This takes 2 hours.~
      IF ~PartyGoldGT(19)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(20) AdvanceTime(600) GiveItemCreate("CDID203",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(19)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR203~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_2~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR203~
    SAY ~You need 20 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_2~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR204~
    SAY ~Scribe this scroll for 30 gold? This takes 2 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(600) GiveItemCreate("BMPR204",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR204~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_2~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR204~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_2~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR205~
    SAY ~Scribe this scroll for 30 gold? This takes 2 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(600) GiveItemCreate("BMPR205",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR205~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_2~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR205~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_2~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR206~
    SAY ~Scribe this scroll for 30 gold? This takes 2 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(600) GiveItemCreate("BMPR206",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR206~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_2~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR206~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_2~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR207~
    SAY ~Scribe this scroll for 30 gold? This takes 2 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(600) GiveItemCreate("BMPR207",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR207~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_2~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR207~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_2~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR208~
    SAY ~Scribe this scroll for 30 gold? This takes 2 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(600) GiveItemCreate("BMPR208",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR208~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_2~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR208~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_2~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR209~
    SAY ~Scribe this scroll for 30 gold? This takes 2 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(600) GiveItemCreate("BMPR209",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR209~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_2~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR209~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_2~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR210~
    SAY ~Scribe this scroll for 30 gold? This takes 2 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(600) GiveItemCreate("BMPR210",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR210~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_2~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR210~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_2~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR211~
    SAY ~Scribe this scroll for 30 gold? This takes 2 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(600) GiveItemCreate("BMPR211",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR211~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_2~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR211~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_2~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR212~
    SAY ~Scribe this scroll for 30 gold? This takes 2 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(600) GiveItemCreate("BMPR212",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR212~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_2~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR212~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_2~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR213~
    SAY ~Scribe this scroll for 30 gold? This takes 2 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(600) GiveItemCreate("BMPR213",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR213~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_2~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR213~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_2~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR214~
    SAY ~Scribe this scroll for 30 gold? This takes 2 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(600) GiveItemCreate("BMPR214",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR214~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_2~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR214~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_2~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR215~
    SAY ~Scribe this scroll for 30 gold? This takes 2 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(600) GiveItemCreate("BMPR215",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR215~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_2~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR215~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_2~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR216~
    SAY ~Scribe this scroll for 30 gold? This takes 2 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(600) GiveItemCreate("BMPR216",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR216~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_2~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR216~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_2~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR217~
    SAY ~Scribe this scroll for 30 gold? This takes 2 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(600) GiveItemCreate("BMPR217",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR217~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_2~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR217~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_2~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR218~
    SAY ~Scribe this scroll for 30 gold? This takes 2 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(600) GiveItemCreate("BMPR218",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR218~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_2~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR218~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_2~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR219~
    SAY ~Scribe this scroll for 30 gold? This takes 2 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(600) GiveItemCreate("BMPR219",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR219~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_2~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR219~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_2~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR220~
    SAY ~Scribe this scroll for 30 gold? This takes 2 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(600) GiveItemCreate("BMPR220",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR220~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_2~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR220~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_2~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR221~
    SAY ~Scribe this scroll for 20 gold? This takes 2 hours.~
      IF ~PartyGoldGT(19)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(20) AdvanceTime(600) GiveItemCreate("CDID221",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(19)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR221~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_2~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR221~
    SAY ~You need 20 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_2~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR222~
    SAY ~Scribe this scroll for 20 gold? This takes 2 hours.~
      IF ~PartyGoldGT(19)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(20) AdvanceTime(600) GiveItemCreate("CDID222",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(19)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR222~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_2~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR222~
    SAY ~You need 20 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_2~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR301~
    SAY ~Scribe this scroll for 30 gold? This takes 3 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(900) GiveItemCreate("BMPR301",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR301~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_3~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR301~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_3~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR302~
    SAY ~Scribe this scroll for 30 gold? This takes 3 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(900) GiveItemCreate("BMPR302",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR302~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_3~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR302~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_3~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR303~
    SAY ~Scribe this scroll for 30 gold? This takes 3 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(900) GiveItemCreate("BMPR303",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR303~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_3~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR303~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_3~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR304~
    SAY ~Scribe this scroll for 30 gold? This takes 3 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(900) GiveItemCreate("BMPR304",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR304~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_3~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR304~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_3~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR305~
    SAY ~Scribe this scroll for 30 gold? This takes 3 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(900) GiveItemCreate("BMPR305",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR305~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_3~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR305~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_3~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR306~
    SAY ~Scribe this scroll for 30 gold? This takes 3 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(900) GiveItemCreate("BMPR306",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR306~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_3~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR306~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_3~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR307~
    SAY ~Scribe this scroll for 30 gold? This takes 3 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(900) GiveItemCreate("BMPR307",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR307~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_3~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR307~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_3~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR308~
    SAY ~Scribe this scroll for 30 gold? This takes 3 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(900) GiveItemCreate("BMPR308",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR308~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_3~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR308~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_3~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR309~
    SAY ~Scribe this scroll for 30 gold? This takes 3 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(900) GiveItemCreate("BMPR309",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR309~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_3~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR309~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_3~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR310~
    SAY ~Scribe this scroll for 30 gold? This takes 3 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(900) GiveItemCreate("BMPR310",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR310~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_3~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR310~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_3~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR311~
    SAY ~Scribe this scroll for 30 gold? This takes 3 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(900) GiveItemCreate("BMPR311",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR311~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_3~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR311~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_3~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR312~
    SAY ~Scribe this scroll for 30 gold? This takes 3 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(900) GiveItemCreate("BMPR312",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR312~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_3~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR312~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_3~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR313~
    SAY ~Scribe this scroll for 30 gold? This takes 3 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(900) GiveItemCreate("BMPR313",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR313~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_3~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR313~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_3~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR314~
    SAY ~Scribe this scroll for 30 gold? This takes 3 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(900) GiveItemCreate("BMPR314",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR314~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_3~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR314~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_3~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR315~
    SAY ~Scribe this scroll for 40 gold? This takes 3 hours.~
      IF ~PartyGoldGT(39)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(40) AdvanceTime(900) GiveItemCreate("SCRL56",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(39)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR315~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_3~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR315~
    SAY ~You need 40 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_3~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR316~
    SAY ~Scribe this scroll for 30 gold? This takes 3 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(900) GiveItemCreate("BMPR316",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR316~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_3~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR316~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_3~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR317~
    SAY ~Scribe this scroll for 30 gold? This takes 3 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(900) GiveItemCreate("BMPR317",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR317~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_3~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR317~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_3~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR318~
    SAY ~Scribe this scroll for 30 gold? This takes 3 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(900) GiveItemCreate("BMPR318",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR318~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_3~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR318~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_3~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR319~
    SAY ~Scribe this scroll for 30 gold? This takes 3 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(900) GiveItemCreate("BMPR319",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR319~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_3~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR319~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_3~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR320~
    SAY ~Scribe this scroll for 30 gold? This takes 3 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(900) GiveItemCreate("BMPR320",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR320~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_3~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR320~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_3~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR321~
    SAY ~Scribe this scroll for 30 gold? This takes 3 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(900) GiveItemCreate("BMPR321",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR321~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_3~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR321~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_3~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR322~
    SAY ~Scribe this scroll for 30 gold? This takes 3 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(900) GiveItemCreate("BMPR322",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR322~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_3~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR322~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_3~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR323~
    SAY ~Scribe this scroll for 30 gold? This takes 3 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(900) GiveItemCreate("BMPR323",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR323~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_3~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR323~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_3~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR324~
    SAY ~Scribe this scroll for 30 gold? This takes 3 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(900) GiveItemCreate("BMPR324",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR324~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_3~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR324~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_3~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR325~
    SAY ~Scribe this scroll for 30 gold? This takes 3 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(900) GiveItemCreate("BMPR325",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR325~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_3~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR325~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_3~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR326~
    SAY ~Scribe this scroll for 30 gold? This takes 3 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(900) GiveItemCreate("BMPR326",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR326~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_3~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR326~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_3~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR327~
    SAY ~Scribe this scroll for 30 gold? This takes 3 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(900) GiveItemCreate("CDID327",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR327~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_3~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR327~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_3~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR328~
    SAY ~Scribe this scroll for 30 gold? This takes 3 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(900) GiveItemCreate("CDID328",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR328~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_3~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR328~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_3~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR329~
    SAY ~Scribe this scroll for 30 gold? This takes 3 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(900) GiveItemCreate("CDID329",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR329~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_3~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR329~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_3~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR330~
    SAY ~Scribe this scroll for 30 gold? This takes 3 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(900) GiveItemCreate("CDID330",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR330~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_3~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR330~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_3~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR331~
    SAY ~Scribe this scroll for 30 gold? This takes 3 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(900) GiveItemCreate("CDID331",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR331~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_3~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR331~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_3~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR332~
    SAY ~Scribe this scroll for 30 gold? This takes 3 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(900) GiveItemCreate("BMPR332",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR332~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_3~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR332~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_3~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR333~
    SAY ~Scribe this scroll for 30 gold? This takes 3 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(900) GiveItemCreate("CDID333",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR333~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_3~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR333~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_3~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR334~
    SAY ~Scribe this scroll for 30 gold? This takes 3 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(900) GiveItemCreate("CDID334",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR334~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_3~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR334~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_3~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR335~
    SAY ~Scribe this scroll for 30 gold? This takes 3 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(900) GiveItemCreate("CDID335",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR335~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_3~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR335~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_3~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR401~
    SAY ~Scribe this scroll for 30 gold? This takes 4 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(1200) GiveItemCreate("BMPR401",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR401~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_4~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR401~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_4~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR402~
    SAY ~Scribe this scroll for 30 gold? This takes 4 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(1200) GiveItemCreate("BMPR402",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR402~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_4~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR402~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_4~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR403~
    SAY ~Scribe this scroll for 40 gold? This takes 4 hours.~
      IF ~PartyGoldGT(39)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(40) AdvanceTime(1200) GiveItemCreate("SCRL58",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(39)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR403~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_4~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR403~
    SAY ~You need 40 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_4~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR404~
    SAY ~Scribe this scroll for 30 gold? This takes 4 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(1200) GiveItemCreate("BMPR404",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR404~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_4~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR404~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_4~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR405~
    SAY ~Scribe this scroll for 40 gold? This takes 4 hours.~
      IF ~PartyGoldGT(39)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(40) AdvanceTime(1200) GiveItemCreate("SCRL5A",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(39)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR405~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_4~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR405~
    SAY ~You need 40 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_4~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR406~
    SAY ~Scribe this scroll for 40 gold? This takes 4 hours.~
      IF ~PartyGoldGT(39)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(40) AdvanceTime(1200) GiveItemCreate("SCRL5B",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(39)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR406~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_4~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR406~
    SAY ~You need 40 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_4~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR407~
    SAY ~Scribe this scroll for 40 gold? This takes 4 hours.~
      IF ~PartyGoldGT(39)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(40) AdvanceTime(1200) GiveItemCreate("SCRL5C",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(39)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR407~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_4~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR407~
    SAY ~You need 40 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_4~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR408~
    SAY ~Scribe this scroll for 40 gold? This takes 4 hours.~
      IF ~PartyGoldGT(39)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(40) AdvanceTime(1200) GiveItemCreate("SCRL5D",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(39)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR408~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_4~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR408~
    SAY ~You need 40 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_4~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR409~
    SAY ~Scribe this scroll for 30 gold? This takes 4 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(1200) GiveItemCreate("BMPR409",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR409~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_4~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR409~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_4~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR410~
    SAY ~Scribe this scroll for 30 gold? This takes 4 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(1200) GiveItemCreate("BMPR410",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR410~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_4~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR410~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_4~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR411~
    SAY ~Scribe this scroll for 30 gold? This takes 4 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(1200) GiveItemCreate("BMPR411",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR411~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_4~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR411~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_4~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR412~
    SAY ~Scribe this scroll for 30 gold? This takes 4 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(1200) GiveItemCreate("BMPR412",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR412~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_4~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR412~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_4~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR413~
    SAY ~Scribe this scroll for 30 gold? This takes 4 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(1200) GiveItemCreate("BMPR413",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR413~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_4~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR413~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_4~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR414~
    SAY ~Scribe this scroll for 30 gold? This takes 4 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(1200) GiveItemCreate("BMPR414",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR414~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_4~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR414~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_4~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR415~
    SAY ~Scribe this scroll for 30 gold? This takes 4 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(1200) GiveItemCreate("BMPR415",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR415~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_4~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR415~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_4~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR416~
    SAY ~Scribe this scroll for 30 gold? This takes 4 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(1200) GiveItemCreate("BMPR416",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR416~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_4~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR416~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_4~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR417~
    SAY ~Scribe this scroll for 75 gold? This takes 4 hours.~
      IF ~PartyGoldGT(74)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(75) AdvanceTime(1200) GiveItemCreate("RESTORE",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(74)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR417~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_4~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR417~
    SAY ~You need 75 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_4~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR418~
    SAY ~Scribe this scroll for 30 gold? This takes 4 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(1200) GiveItemCreate("BMPR418",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR418~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_4~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR418~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_4~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR419~
    SAY ~Scribe this scroll for 30 gold? This takes 4 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(1200) GiveItemCreate("BMPR419",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR419~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_4~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR419~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_4~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR420~
    SAY ~Scribe this scroll for 30 gold? This takes 4 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(1200) GiveItemCreate("BMPR420",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR420~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_4~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR420~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_4~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR421~
    SAY ~Scribe this scroll for 40 gold? This takes 4 hours.~
      IF ~PartyGoldGT(39)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(40) AdvanceTime(1200) GiveItemCreate("CDID421",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(39)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR421~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_4~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR421~
    SAY ~You need 40 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_4~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR422~
    SAY ~Scribe this scroll for 40 gold? This takes 4 hours.~
      IF ~PartyGoldGT(39)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(40) AdvanceTime(1200) GiveItemCreate("CDID422",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(39)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR422~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_4~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR422~
    SAY ~You need 40 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_4~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR423~
    SAY ~Scribe this scroll for 40 gold? This takes 4 hours.~
      IF ~PartyGoldGT(39)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(40) AdvanceTime(1200) GiveItemCreate("CDID423",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(39)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR423~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_4~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR423~
    SAY ~You need 40 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_4~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR424~
    SAY ~Scribe this scroll for 30 gold? This takes 4 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(1200) GiveItemCreate("BMPR424",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR424~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_4~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR424~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_4~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR425~
    SAY ~Scribe this scroll for 40 gold? This takes 4 hours.~
      IF ~PartyGoldGT(39)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(40) AdvanceTime(1200) GiveItemCreate("CDID425",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(39)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR425~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_4~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR425~
    SAY ~You need 40 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_4~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR426~
    SAY ~Scribe this scroll for 40 gold? This takes 4 hours.~
      IF ~PartyGoldGT(39)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(40) AdvanceTime(1200) GiveItemCreate("CDID426",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(39)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR426~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_4~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR426~
    SAY ~You need 40 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_4~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR427~
    SAY ~Scribe this scroll for 30 gold? This takes 4 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(1200) GiveItemCreate("BMPR427",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR427~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_4~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR427~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_4~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR428~
    SAY ~Scribe this scroll for 30 gold? This takes 4 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(1200) GiveItemCreate("BMPR428",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR428~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_4~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR428~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_4~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR429~
    SAY ~Scribe this scroll for 30 gold? This takes 4 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(1200) GiveItemCreate("BMPR429",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR429~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_4~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR429~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_4~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR430~
    SAY ~Scribe this scroll for 30 gold? This takes 4 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(1200) GiveItemCreate("BMPR430",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR430~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_4~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR430~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_4~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR501~
    SAY ~Scribe this scroll for 30 gold? This takes 5 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(1500) GiveItemCreate("BMPR501",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR501~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_5~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR501~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_5~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR502~
    SAY ~Scribe this scroll for 50 gold? This takes 5 hours.~
      IF ~PartyGoldGT(49)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(50) AdvanceTime(1500) GiveItemCreate("SCRL61",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(49)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR502~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_5~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR502~
    SAY ~You need 50 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_5~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR503~
    SAY ~Scribe this scroll for 50 gold? This takes 5 hours.~
      IF ~PartyGoldGT(49)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(50) AdvanceTime(1500) GiveItemCreate("SCRL62",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(49)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR503~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_5~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR503~
    SAY ~You need 50 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_5~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR504~
    SAY ~Scribe this scroll for 350 gold? This takes 5 hours.~
      IF ~PartyGoldGT(349)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(350) AdvanceTime(1500) GiveItemCreate("SCRL63",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(349)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR504~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_5~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR504~
    SAY ~You need 350 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_5~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR505~
    SAY ~Scribe this scroll for 30 gold? This takes 5 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(1500) GiveItemCreate("BMPR505",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR505~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_5~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR505~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_5~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR506~
    SAY ~Scribe this scroll for 30 gold? This takes 5 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(1500) GiveItemCreate("BMPR506",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR506~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_5~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR506~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_5~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR507~
    SAY ~Scribe this scroll for 50 gold? This takes 5 hours.~
      IF ~PartyGoldGT(49)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(50) AdvanceTime(1500) GiveItemCreate("SCRL5E",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(49)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR507~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_5~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR507~
    SAY ~You need 50 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_5~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR508~
    SAY ~Scribe this scroll for 50 gold? This takes 5 hours.~
      IF ~PartyGoldGT(49)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(50) AdvanceTime(1500) GiveItemCreate("SCRL5F",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(49)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR508~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_5~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR508~
    SAY ~You need 50 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_5~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR509~
    SAY ~Scribe this scroll for 30 gold? This takes 5 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(1500) GiveItemCreate("BMPR509",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR509~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_5~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR509~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_5~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR510~
    SAY ~Scribe this scroll for 30 gold? This takes 5 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(1500) GiveItemCreate("BMPR510",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR510~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_5~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR510~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_5~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR511~
    SAY ~Scribe this scroll for 30 gold? This takes 5 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(1500) GiveItemCreate("BMPR511",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR511~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_5~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR511~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_5~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR512~
    SAY ~Scribe this scroll for 30 gold? This takes 5 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(1500) GiveItemCreate("BMPR512",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR512~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_5~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR512~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_5~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR513~
    SAY ~Scribe this scroll for 30 gold? This takes 5 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(1500) GiveItemCreate("BMPR513",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR513~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_5~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR513~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_5~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR514~
    SAY ~Scribe this scroll for 30 gold? This takes 5 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(1500) GiveItemCreate("BMPR514",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR514~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_5~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR514~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_5~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR515~
    SAY ~Scribe this scroll for 30 gold? This takes 5 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(1500) GiveItemCreate("BMPR515",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR515~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_5~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR515~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_5~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR516~
    SAY ~Scribe this scroll for 30 gold? This takes 5 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(1500) GiveItemCreate("BMPR516",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR516~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_5~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR516~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_5~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR517~
    SAY ~Scribe this scroll for 30 gold? This takes 5 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(1500) GiveItemCreate("BMPR517",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR517~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_5~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR517~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_5~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR518~
    SAY ~Scribe this scroll for 30 gold? This takes 5 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(1500) GiveItemCreate("BMPR518",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR518~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_5~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR518~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_5~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR519~
    SAY ~Scribe this scroll for 30 gold? This takes 5 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(1500) GiveItemCreate("BMPR519",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR519~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_5~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR519~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_5~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR520~
    SAY ~Scribe this scroll for 30 gold? This takes 5 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(1500) GiveItemCreate("BMPR520",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR520~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_5~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR520~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_5~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR521~
    SAY ~Scribe this scroll for 30 gold? This takes 5 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(1500) GiveItemCreate("BMPR521",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR521~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_5~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR521~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_5~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR522~
    SAY ~Scribe this scroll for 30 gold? This takes 5 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(1500) GiveItemCreate("BMPR522",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR522~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_5~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR522~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_5~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR523~
    SAY ~Scribe this scroll for 30 gold? This takes 5 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(1500) GiveItemCreate("BMPR523",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR523~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_5~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR523~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_5~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR524~
    SAY ~Scribe this scroll for 30 gold? This takes 5 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(1500) GiveItemCreate("BMPR524",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR524~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_5~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR524~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_5~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR525~
    SAY ~Scribe this scroll for 50 gold? This takes 5 hours.~
      IF ~PartyGoldGT(49)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(50) AdvanceTime(1500) GiveItemCreate("CDID525",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(49)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR525~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_5~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR525~
    SAY ~You need 50 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_5~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR526~
    SAY ~Scribe this scroll for 30 gold? This takes 5 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(1500) GiveItemCreate("BMPR526",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR526~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_5~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR526~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_5~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR527~
    SAY ~Scribe this scroll for 50 gold? This takes 5 hours.~
      IF ~PartyGoldGT(49)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(50) AdvanceTime(1500) GiveItemCreate("CDID527",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(49)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR527~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_5~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR527~
    SAY ~You need 50 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_5~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR528~
    SAY ~Scribe this scroll for 50 gold? This takes 5 hours.~
      IF ~PartyGoldGT(49)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(50) AdvanceTime(1500) GiveItemCreate("CDID528",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(49)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR528~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_5~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR528~
    SAY ~You need 50 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_5~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR529~
    SAY ~Scribe this scroll for 50 gold? This takes 5 hours.~
      IF ~PartyGoldGT(49)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(50) AdvanceTime(1500) GiveItemCreate("CDID529",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(49)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR529~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_5~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR529~
    SAY ~You need 50 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_5~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR530~
    SAY ~Scribe this scroll for 50 gold? This takes 5 hours.~
      IF ~PartyGoldGT(49)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(50) AdvanceTime(1500) GiveItemCreate("CDID530",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(49)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR530~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_5~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR530~
    SAY ~You need 50 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_5~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR531~
    SAY ~Scribe this scroll for 50 gold? This takes 5 hours.~
      IF ~PartyGoldGT(49)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(50) AdvanceTime(1500) GiveItemCreate("CDID531",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(49)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR531~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_5~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR531~
    SAY ~You need 50 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_5~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR601~
    SAY ~Scribe this scroll for 30 gold? This takes 6 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(1800) GiveItemCreate("BMPR601",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR601~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_6~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR601~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_6~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR602~
    SAY ~Scribe this scroll for 30 gold? This takes 6 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(1800) GiveItemCreate("BMPR602",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR602~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_6~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR602~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_6~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR603~
    SAY ~Scribe this scroll for 30 gold? This takes 6 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(1800) GiveItemCreate("BMPR603",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR603~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_6~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR603~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_6~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR604~
    SAY ~Scribe this scroll for 30 gold? This takes 6 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(1800) GiveItemCreate("BMPR604",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR604~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_6~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR604~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_6~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR605~
    SAY ~Scribe this scroll for 30 gold? This takes 6 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(1800) GiveItemCreate("BMPR605",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR605~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_6~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR605~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_6~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR606~
    SAY ~Scribe this scroll for 30 gold? This takes 6 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(1800) GiveItemCreate("BMPR606",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR606~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_6~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR606~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_6~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR607~
    SAY ~Scribe this scroll for 30 gold? This takes 6 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(1800) GiveItemCreate("BMPR607",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR607~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_6~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR607~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_6~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR608~
    SAY ~Scribe this scroll for 30 gold? This takes 6 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(1800) GiveItemCreate("BMPR608",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR608~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_6~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR608~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_6~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR609~
    SAY ~Scribe this scroll for 30 gold? This takes 6 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(1800) GiveItemCreate("BMPR609",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR609~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_6~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR609~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_6~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR610~
    SAY ~Scribe this scroll for 30 gold? This takes 6 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(1800) GiveItemCreate("BMPR610",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR610~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_6~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR610~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_6~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR611~
    SAY ~Scribe this scroll for 30 gold? This takes 6 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(1800) GiveItemCreate("BMPR611",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR611~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_6~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR611~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_6~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR612~
    SAY ~Scribe this scroll for 30 gold? This takes 6 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(1800) GiveItemCreate("BMPR612",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR612~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_6~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR612~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_6~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR614~
    SAY ~Scribe this scroll for 30 gold? This takes 6 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(1800) GiveItemCreate("BMPR614",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR614~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_6~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR614~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_6~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR615~
    SAY ~Scribe this scroll for 30 gold? This takes 6 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(1800) GiveItemCreate("BMPR615",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR615~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_6~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR615~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_6~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR616~
    SAY ~Scribe this scroll for 30 gold? This takes 6 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(1800) GiveItemCreate("BMPR616",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR616~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_6~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR616~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_6~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR617~
    SAY ~Scribe this scroll for 30 gold? This takes 6 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(1800) GiveItemCreate("BMPR617",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR617~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_6~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR617~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_6~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR618~
    SAY ~Scribe this scroll for 30 gold? This takes 6 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(1800) GiveItemCreate("BMPR618",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR618~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_6~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR618~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_6~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR619~
    SAY ~Scribe this scroll for 30 gold? This takes 6 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(1800) GiveItemCreate("BMPR619",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR619~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_6~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR619~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_6~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR620~
    SAY ~Scribe this scroll for 100 gold? This takes 6 hours.~
      IF ~PartyGoldGT(99)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(100) AdvanceTime(1800) GiveItemCreate("CDID620",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(99)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR620~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_6~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR620~
    SAY ~You need 100 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_6~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR621~
    SAY ~Scribe this scroll for 30 gold? This takes 6 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(1800) GiveItemCreate("BMPR621",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR621~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_6~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR621~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_6~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR622~
    SAY ~Scribe this scroll for 30 gold? This takes 6 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(1800) GiveItemCreate("BMPR622",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR622~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_6~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR622~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_6~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR698~
    SAY ~Scribe this scroll for 30 gold? This takes 6 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(1800) GiveItemCreate("BMPR698",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR698~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_6~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR698~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_6~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR699~
    SAY ~Scribe this scroll for 30 gold? This takes 6 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(1800) GiveItemCreate("BMPR699",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR699~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_6~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR699~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_6~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR701~
    SAY ~Scribe this scroll for 30 gold? This takes 7 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(2100) GiveItemCreate("BMPR701",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR701~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_7~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR701~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_7~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR702~
    SAY ~Scribe this scroll for 30 gold? This takes 7 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(2100) GiveItemCreate("BMPR702",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR702~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_7~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR702~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_7~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR703~
    SAY ~Scribe this scroll for 30 gold? This takes 7 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(2100) GiveItemCreate("BMPR703",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR703~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_7~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR703~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_7~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR704~
    SAY ~Scribe this scroll for 30 gold? This takes 7 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(2100) GiveItemCreate("BMPR704",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR704~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_7~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR704~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_7~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR705~
    SAY ~Scribe this scroll for 30 gold? This takes 7 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(2100) GiveItemCreate("BMPR705",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR705~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_7~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR705~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_7~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR706~
    SAY ~Scribe this scroll for 30 gold? This takes 7 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(2100) GiveItemCreate("BMPR706",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR706~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_7~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR706~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_7~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR707~
    SAY ~Scribe this scroll for 30 gold? This takes 7 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(2100) GiveItemCreate("BMPR707",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR707~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_7~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR707~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_7~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR708~
    SAY ~Scribe this scroll for 30 gold? This takes 7 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(2100) GiveItemCreate("BMPR708",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR708~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_7~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR708~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_7~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR709~
    SAY ~Scribe this scroll for 30 gold? This takes 7 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(2100) GiveItemCreate("BMPR709",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR709~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_7~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR709~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_7~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR710~
    SAY ~Scribe this scroll for 30 gold? This takes 7 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(2100) GiveItemCreate("BMPR710",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR710~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_7~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR710~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_7~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR711~
    SAY ~Scribe this scroll for 30 gold? This takes 7 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(2100) GiveItemCreate("BMPR711",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR711~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_7~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR711~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_7~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR712~
    SAY ~Scribe this scroll for 30 gold? This takes 7 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(2100) GiveItemCreate("BMPR712",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR712~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_7~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR712~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_7~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR713~
    SAY ~Scribe this scroll for 30 gold? This takes 7 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(2100) GiveItemCreate("BMPR713",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR713~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_7~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR713~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_7~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR714~
    SAY ~Scribe this scroll for 200 gold? This takes 7 hours.~
      IF ~PartyGoldGT(199)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(200) AdvanceTime(2100) GiveItemCreate("CDID714",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(199)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR714~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_7~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR714~
    SAY ~You need 200 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_7~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR715~
    SAY ~Scribe this scroll for 30 gold? This takes 7 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(2100) GiveItemCreate("BMPR715",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR715~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_7~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR715~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_7~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR716~
    SAY ~Scribe this scroll for 30 gold? This takes 7 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(2100) GiveItemCreate("BMPR716",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR716~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_7~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR716~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_7~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR717~
    SAY ~Scribe this scroll for 30 gold? This takes 7 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(2100) GiveItemCreate("BMPR717",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR717~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_7~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR717~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_7~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR718~
    SAY ~Scribe this scroll for 30 gold? This takes 7 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(2100) GiveItemCreate("BMPR718",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR718~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_7~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR718~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_7~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR719~
    SAY ~Scribe this scroll for 30 gold? This takes 7 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(2100) GiveItemCreate("BMPR719",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR719~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_7~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR719~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_7~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR720~
    SAY ~Scribe this scroll for 30 gold? This takes 7 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(2100) GiveItemCreate("BMPR720",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR720~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_7~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR720~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_7~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR733~
    SAY ~Scribe this scroll for 30 gold? This takes 7 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(2100) GiveItemCreate("BMPR733",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR733~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_7~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR733~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_7~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR734~
    SAY ~Scribe this scroll for 30 gold? This takes 7 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(2100) GiveItemCreate("BMPR734",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR734~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_7~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR734~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_7~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR735~
    SAY ~Scribe this scroll for 200 gold? This takes 7 hours.~
      IF ~PartyGoldGT(199)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(200) AdvanceTime(2100) GiveItemCreate("CDID735",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(199)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR735~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_7~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR735~
    SAY ~You need 200 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_7~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR736~
    SAY ~Scribe this scroll for 200 gold? This takes 7 hours.~
      IF ~PartyGoldGT(199)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(200) AdvanceTime(2100) GiveItemCreate("CDID736",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(199)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR736~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_7~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR736~
    SAY ~You need 200 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_7~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR737~
    SAY ~Scribe this scroll for 200 gold? This takes 7 hours.~
      IF ~PartyGoldGT(199)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(200) AdvanceTime(2100) GiveItemCreate("CDID737",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(199)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR737~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_7~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR737~
    SAY ~You need 200 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_7~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR738~
    SAY ~Scribe this scroll for 30 gold? This takes 7 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(2100) GiveItemCreate("BMPR738",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR738~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_7~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR738~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_7~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR739~
    SAY ~Scribe this scroll for 200 gold? This takes 7 hours.~
      IF ~PartyGoldGT(199)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(200) AdvanceTime(2100) GiveItemCreate("CDID739",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(199)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR739~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_7~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR739~
    SAY ~You need 200 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_7~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR751~
    SAY ~Scribe this scroll for 30 gold? This takes 7 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(2100) GiveItemCreate("BMPR751",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR751~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_7~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR751~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_7~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR984~
    SAY ~Scribe this scroll for 30 gold? This takes 9 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(2700) GiveItemCreate("BMPR984",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR984~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_9~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR984~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_9~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR986~
    SAY ~Scribe this scroll for 30 gold? This takes 9 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(2700) GiveItemCreate("BMPR986",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR986~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_9~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR986~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_9~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR987~
    SAY ~Scribe this scroll for 30 gold? This takes 9 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(2700) GiveItemCreate("BMPR987",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR987~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_9~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR987~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_9~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
IF ~~ THEN BEGIN ~bm_scrollkit_confirm_SPPR999~
    SAY ~Scribe this scroll for 30 gold? This takes 9 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(2700) GiveItemCreate("BMPR999",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_SPPR999~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_9~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_SPPR999~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_9~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

IF ~~ THEN BEGIN ~bm_scrollkit_confirm_MEWI151~
    SAY ~Scribe this scroll for 30 gold? This takes 1 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(300) GiveItemCreate("MEWI151X",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_MEWI151~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_1~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_MEWI151~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_1~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

IF ~~ THEN BEGIN ~bm_scrollkit_confirm_MEWI152~
    SAY ~Scribe this scroll for 30 gold? This takes 1 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(300) GiveItemCreate("MEWI152X",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_MEWI152~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_1~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_MEWI152~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_1~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

IF ~~ THEN BEGIN ~bm_scrollkit_confirm_MEWI160~
    SAY ~Scribe this scroll for 30 gold? This takes 1 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(300) GiveItemCreate("MEWI160X",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_MEWI160~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_1~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_MEWI160~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_1~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

IF ~~ THEN BEGIN ~bm_scrollkit_confirm_MEWI251~
    SAY ~Scribe this scroll for 30 gold? This takes 2 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(600) GiveItemCreate("MEWI251X",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_MEWI251~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_2~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_MEWI251~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_2~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

IF ~~ THEN BEGIN ~bm_scrollkit_confirm_MEWI253~
    SAY ~Scribe this scroll for 30 gold? This takes 2 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(600) GiveItemCreate("MEWI253X",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_MEWI253~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_2~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_MEWI253~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_2~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

IF ~~ THEN BEGIN ~bm_scrollkit_confirm_MEWI254~
    SAY ~Scribe this scroll for 30 gold? This takes 2 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(600) GiveItemCreate("MEWI254X",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_MEWI254~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_2~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_MEWI254~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_2~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

IF ~~ THEN BEGIN ~bm_scrollkit_confirm_MEWI255~
    SAY ~Scribe this scroll for 30 gold? This takes 2 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(600) GiveItemCreate("MEWI255X",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_MEWI255~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_2~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_MEWI255~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_2~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

IF ~~ THEN BEGIN ~bm_scrollkit_confirm_MEWI258~
    SAY ~Scribe this scroll for 30 gold? This takes 2 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(600) GiveItemCreate("MEWI258X",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_MEWI258~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_2~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_MEWI258~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_2~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

IF ~~ THEN BEGIN ~bm_scrollkit_confirm_MEWI351~
    SAY ~Scribe this scroll for 30 gold? This takes 3 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(900) GiveItemCreate("MEWI351X",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_MEWI351~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_3~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_MEWI351~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_3~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

IF ~~ THEN BEGIN ~bm_scrollkit_confirm_MEWI353~
    SAY ~Scribe this scroll for 30 gold? This takes 3 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(900) GiveItemCreate("MEWI353X",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_MEWI353~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_3~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_MEWI353~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_3~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

IF ~~ THEN BEGIN ~bm_scrollkit_confirm_MEWI354~
    SAY ~Scribe this scroll for 60 gold? This takes 3 hours.~
      IF ~PartyGoldGT(59)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(60) AdvanceTime(900) GiveItemCreate("MEWI354X",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(59)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_MEWI354~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_3~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_MEWI354~
    SAY ~You need 60 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_3~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

IF ~~ THEN BEGIN ~bm_scrollkit_confirm_MEWI356~
    SAY ~Scribe this scroll for 30 gold? This takes 3 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(900) GiveItemCreate("MEWI356X",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_MEWI356~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_3~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_MEWI356~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_3~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

IF ~~ THEN BEGIN ~bm_scrollkit_confirm_MEWI357~
    SAY ~Scribe this scroll for 60 gold? This takes 3 hours.~
      IF ~PartyGoldGT(59)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(60) AdvanceTime(900) GiveItemCreate("MEWI357X",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(59)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_MEWI357~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_3~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_MEWI357~
    SAY ~You need 60 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_3~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

IF ~~ THEN BEGIN ~bm_scrollkit_confirm_MEWI361~
    SAY ~Scribe this scroll for 30 gold? This takes 3 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(900) GiveItemCreate("MEWI361X",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_MEWI361~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_3~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_MEWI361~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_3~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

IF ~~ THEN BEGIN ~bm_scrollkit_confirm_MEWI451~
    SAY ~Scribe this scroll for 50 gold? This takes 4 hours.~
      IF ~PartyGoldGT(49)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(50) AdvanceTime(1200) GiveItemCreate("MEWI451X",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(49)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_MEWI451~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_4~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_MEWI451~
    SAY ~You need 50 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_4~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

IF ~~ THEN BEGIN ~bm_scrollkit_confirm_MEWI452~
    SAY ~Scribe this scroll for 50 gold? This takes 4 hours.~
      IF ~PartyGoldGT(49)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(50) AdvanceTime(1200) GiveItemCreate("MEWI452X",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(49)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_MEWI452~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_4~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_MEWI452~
    SAY ~You need 50 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_4~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

IF ~~ THEN BEGIN ~bm_scrollkit_confirm_MEWI453~
    SAY ~Scribe this scroll for 50 gold? This takes 4 hours.~
      IF ~PartyGoldGT(49)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(50) AdvanceTime(1200) GiveItemCreate("MEWI453X",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(49)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_MEWI453~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_4~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_MEWI453~
    SAY ~You need 50 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_4~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

IF ~~ THEN BEGIN ~bm_scrollkit_confirm_MEWI454~
    SAY ~Scribe this scroll for 50 gold? This takes 4 hours.~
      IF ~PartyGoldGT(49)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(50) AdvanceTime(1200) GiveItemCreate("MEWI454X",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(49)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_MEWI454~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_4~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_MEWI454~
    SAY ~You need 50 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_4~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

IF ~~ THEN BEGIN ~bm_scrollkit_confirm_MEWI457~
    SAY ~Scribe this scroll for 75 gold? This takes 4 hours.~
      IF ~PartyGoldGT(74)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(75) AdvanceTime(1200) GiveItemCreate("MEWI457X",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(74)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_MEWI457~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_4~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_MEWI457~
    SAY ~You need 75 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_4~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

IF ~~ THEN BEGIN ~bm_scrollkit_confirm_MEWI551~
    SAY ~Scribe this scroll for 100 gold? This takes 5 hours.~
      IF ~PartyGoldGT(99)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(100) AdvanceTime(1500) GiveItemCreate("MEWI551X",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(99)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_MEWI551~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_5~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_MEWI551~
    SAY ~You need 100 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_5~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

IF ~~ THEN BEGIN ~bm_scrollkit_confirm_MEWI554~
    SAY ~Scribe this scroll for 100 gold? This takes 5 hours.~
      IF ~PartyGoldGT(99)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(100) AdvanceTime(1500) GiveItemCreate("MEWI554X",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(99)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_MEWI554~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_5~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_MEWI554~
    SAY ~You need 100 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_5~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

IF ~~ THEN BEGIN ~bm_scrollkit_confirm_MEWI555~
    SAY ~Scribe this scroll for 100 gold? This takes 5 hours.~
      IF ~PartyGoldGT(99)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(100) AdvanceTime(1500) GiveItemCreate("MEWI555X",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(99)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_MEWI555~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_5~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_MEWI555~
    SAY ~You need 100 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_5~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

IF ~~ THEN BEGIN ~bm_scrollkit_confirm_MEWI556~
    SAY ~Scribe this scroll for 150 gold? This takes 5 hours.~
      IF ~PartyGoldGT(149)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(150) AdvanceTime(1500) GiveItemCreate("MEWI556X",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(149)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_MEWI556~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_5~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_MEWI556~
    SAY ~You need 150 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_5~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

IF ~~ THEN BEGIN ~bm_scrollkit_confirm_MEWI557~
    SAY ~Scribe this scroll for 50 gold? This takes 5 hours.~
      IF ~PartyGoldGT(49)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(50) AdvanceTime(1500) GiveItemCreate("MEWI557X",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(49)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_MEWI557~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_5~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_MEWI557~
    SAY ~You need 50 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_5~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

IF ~~ THEN BEGIN ~bm_scrollkit_confirm_MEWI558~
    SAY ~Scribe this scroll for 150 gold? This takes 5 hours.~
      IF ~PartyGoldGT(149)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(150) AdvanceTime(1500) GiveItemCreate("MEWI558X",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(149)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_MEWI558~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_5~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_MEWI558~
    SAY ~You need 150 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_5~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

IF ~~ THEN BEGIN ~bm_scrollkit_confirm_MEWI560~
    SAY ~Scribe this scroll for 150 gold? This takes 5 hours.~
      IF ~PartyGoldGT(149)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(150) AdvanceTime(1500) GiveItemCreate("MEWI560X",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(149)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_MEWI560~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_5~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_MEWI560~
    SAY ~You need 150 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_5~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

IF ~~ THEN BEGIN ~bm_scrollkit_confirm_MEWI563~
    SAY ~Scribe this scroll for 100 gold? This takes 5 hours.~
      IF ~PartyGoldGT(99)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(100) AdvanceTime(1500) GiveItemCreate("MEWI563X",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(99)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_MEWI563~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_5~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_MEWI563~
    SAY ~You need 100 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_5~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

IF ~~ THEN BEGIN ~bm_scrollkit_confirm_MEWI565~
    SAY ~Scribe this scroll for 100 gold? This takes 5 hours.~
      IF ~PartyGoldGT(99)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(100) AdvanceTime(1500) GiveItemCreate("MEWI565X",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(99)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_MEWI565~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_5~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_MEWI565~
    SAY ~You need 100 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_5~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

IF ~~ THEN BEGIN ~bm_scrollkit_confirm_MEWI566~
    SAY ~Scribe this scroll for 100 gold? This takes 5 hours.~
      IF ~PartyGoldGT(99)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(100) AdvanceTime(1500) GiveItemCreate("MEWI566X",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(99)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_MEWI566~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_5~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_MEWI566~
    SAY ~You need 100 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_5~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

IF ~~ THEN BEGIN ~bm_scrollkit_confirm_MEWI651~
    SAY ~Scribe this scroll for 200 gold? This takes 6 hours.~
      IF ~PartyGoldGT(199)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(200) AdvanceTime(1800) GiveItemCreate("MEWI651X",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(199)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_MEWI651~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_6~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_MEWI651~
    SAY ~You need 200 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_6~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

IF ~~ THEN BEGIN ~bm_scrollkit_confirm_MEWI652~
    SAY ~Scribe this scroll for 200 gold? This takes 6 hours.~
      IF ~PartyGoldGT(199)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(200) AdvanceTime(1800) GiveItemCreate("MEWI652X",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(199)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_MEWI652~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_6~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_MEWI652~
    SAY ~You need 200 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_6~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

IF ~~ THEN BEGIN ~bm_scrollkit_confirm_MEWI653~
    SAY ~Scribe this scroll for 200 gold? This takes 6 hours.~
      IF ~PartyGoldGT(199)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(200) AdvanceTime(1800) GiveItemCreate("MEWI653X",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(199)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_MEWI653~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_6~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_MEWI653~
    SAY ~You need 200 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_6~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

IF ~~ THEN BEGIN ~bm_scrollkit_confirm_MEWI656~
    SAY ~Scribe this scroll for 200 gold? This takes 6 hours.~
      IF ~PartyGoldGT(199)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(200) AdvanceTime(1800) GiveItemCreate("MEWI656X",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(199)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_MEWI656~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_6~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_MEWI656~
    SAY ~You need 200 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_6~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

IF ~~ THEN BEGIN ~bm_scrollkit_confirm_MEWI657~
    SAY ~Scribe this scroll for 200 gold? This takes 6 hours.~
      IF ~PartyGoldGT(199)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(200) AdvanceTime(1800) GiveItemCreate("MEWI657X",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(199)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_MEWI657~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_6~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_MEWI657~
    SAY ~You need 200 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_6~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

IF ~~ THEN BEGIN ~bm_scrollkit_confirm_MEWI658~
    SAY ~Scribe this scroll for 200 gold? This takes 6 hours.~
      IF ~PartyGoldGT(199)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(200) AdvanceTime(1800) GiveItemCreate("MEWI658X",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(199)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_MEWI658~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_6~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_MEWI658~
    SAY ~You need 200 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_6~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

IF ~~ THEN BEGIN ~bm_scrollkit_confirm_MEWI754~
    SAY ~Scribe this scroll for 300 gold? This takes 7 hours.~
      IF ~PartyGoldGT(299)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(300) AdvanceTime(2100) GiveItemCreate("MEWI754X",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(299)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_MEWI754~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_7~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_MEWI754~
    SAY ~You need 300 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_7~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

IF ~~ THEN BEGIN ~bm_scrollkit_confirm_MEWI756~
    SAY ~Scribe this scroll for 300 gold? This takes 7 hours.~
      IF ~PartyGoldGT(299)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(300) AdvanceTime(2100) GiveItemCreate("MEWI756X",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(299)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_MEWI756~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_7~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_MEWI756~
    SAY ~You need 300 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_7~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

IF ~~ THEN BEGIN ~bm_scrollkit_confirm_MEWI759~
    SAY ~Scribe this scroll for 300 gold? This takes 7 hours.~
      IF ~PartyGoldGT(299)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(300) AdvanceTime(2100) GiveItemCreate("MEWI759X",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(299)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_MEWI759~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_7~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_MEWI759~
    SAY ~You need 300 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_7~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

IF ~~ THEN BEGIN ~bm_scrollkit_confirm_MEWI760~
    SAY ~Scribe this scroll for 300 gold? This takes 7 hours.~
      IF ~PartyGoldGT(299)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(300) AdvanceTime(2100) GiveItemCreate("MEWI760X",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(299)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_MEWI760~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_7~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_MEWI760~
    SAY ~You need 300 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_7~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

IF ~~ THEN BEGIN ~bm_scrollkit_confirm_MEWI762~
    SAY ~Scribe this scroll for 300 gold? This takes 7 hours.~
      IF ~PartyGoldGT(299)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(300) AdvanceTime(2100) GiveItemCreate("MEWI762X",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(299)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_MEWI762~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_7~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_MEWI762~
    SAY ~You need 300 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_7~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

IF ~~ THEN BEGIN ~bm_scrollkit_confirm_MEWI851~
    SAY ~Scribe this scroll for 400 gold? This takes 8 hours.~
      IF ~PartyGoldGT(399)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(400) AdvanceTime(2400) GiveItemCreate("MEWI851X",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(399)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_MEWI851~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_8~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_MEWI851~
    SAY ~You need 400 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_8~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

IF ~~ THEN BEGIN ~bm_scrollkit_confirm_MEWI852~
    SAY ~Scribe this scroll for 300 gold? This takes 8 hours.~
      IF ~PartyGoldGT(299)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(300) AdvanceTime(2400) GiveItemCreate("MEWI852X",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(299)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_MEWI852~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_8~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_MEWI852~
    SAY ~You need 300 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_8~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

IF ~~ THEN BEGIN ~bm_scrollkit_confirm_MEWI855~
    SAY ~Scribe this scroll for 600 gold? This takes 8 hours.~
      IF ~PartyGoldGT(599)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(600) AdvanceTime(2400) GiveItemCreate("MEWI855X",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(599)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_MEWI855~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_8~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_MEWI855~
    SAY ~You need 600 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_8~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

IF ~~ THEN BEGIN ~bm_scrollkit_confirm_MEWI857~
    SAY ~Scribe this scroll for 400 gold? This takes 8 hours.~
      IF ~PartyGoldGT(399)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(400) AdvanceTime(2400) GiveItemCreate("MEWI857X",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(399)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_MEWI857~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_8~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_MEWI857~
    SAY ~You need 400 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_8~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

IF ~~ THEN BEGIN ~bm_scrollkit_confirm_MEWI859~
    SAY ~Scribe this scroll for 400 gold? This takes 8 hours.~
      IF ~PartyGoldGT(399)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(400) AdvanceTime(2400) GiveItemCreate("MEWI859X",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(399)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_MEWI859~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_8~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_MEWI859~
    SAY ~You need 400 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_8~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

IF ~~ THEN BEGIN ~bm_scrollkit_confirm_MEWI860~
    SAY ~Scribe this scroll for 400 gold? This takes 8 hours.~
      IF ~PartyGoldGT(399)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(400) AdvanceTime(2400) GiveItemCreate("MEWI860X",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(399)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_MEWI860~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_8~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_MEWI860~
    SAY ~You need 400 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_8~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

IF ~~ THEN BEGIN ~bm_scrollkit_confirm_MEWI861~
    SAY ~Scribe this scroll for 400 gold? This takes 8 hours.~
      IF ~PartyGoldGT(399)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(400) AdvanceTime(2400) GiveItemCreate("MEWI861X",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(399)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_MEWI861~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_8~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_MEWI861~
    SAY ~You need 400 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_8~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

IF ~~ THEN BEGIN ~bm_scrollkit_confirm_MEWI862~
    SAY ~Scribe this scroll for 400 gold? This takes 8 hours.~
      IF ~PartyGoldGT(399)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(400) AdvanceTime(2400) GiveItemCreate("MEWI862X",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(399)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_MEWI862~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_8~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_MEWI862~
    SAY ~You need 400 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_8~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

IF ~~ THEN BEGIN ~bm_scrollkit_confirm_MEWI863~
    SAY ~Scribe this scroll for 400 gold? This takes 8 hours.~
      IF ~PartyGoldGT(399)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(400) AdvanceTime(2400) GiveItemCreate("MEWI863X",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(399)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_MEWI863~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_8~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_MEWI863~
    SAY ~You need 400 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_8~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

IF ~~ THEN BEGIN ~bm_scrollkit_confirm_MEWI951~
    SAY ~Scribe this scroll for 500 gold? This takes 9 hours.~
      IF ~PartyGoldGT(499)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(500) AdvanceTime(2700) GiveItemCreate("MEWI951X",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(499)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_MEWI951~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_9~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_MEWI951~
    SAY ~You need 500 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_9~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

IF ~~ THEN BEGIN ~bm_scrollkit_confirm_MEWI952~
    SAY ~Scribe this scroll for 500 gold? This takes 9 hours.~
      IF ~PartyGoldGT(499)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(500) AdvanceTime(2700) GiveItemCreate("MEWI952X",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(499)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_MEWI952~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_9~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_MEWI952~
    SAY ~You need 500 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_9~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

IF ~~ THEN BEGIN ~bm_scrollkit_confirm_MEWI953~
    SAY ~Scribe this scroll for 500 gold? This takes 9 hours.~
      IF ~PartyGoldGT(499)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(500) AdvanceTime(2700) GiveItemCreate("MEWI953X",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(499)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_MEWI953~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_9~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_MEWI953~
    SAY ~You need 500 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_9~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

IF ~~ THEN BEGIN ~bm_scrollkit_confirm_MEWI954~
    SAY ~Scribe this scroll for 500 gold? This takes 9 hours.~
      IF ~PartyGoldGT(499)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(500) AdvanceTime(2700) GiveItemCreate("MEWI954X",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(499)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_MEWI954~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_9~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_MEWI954~
    SAY ~You need 500 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_9~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

IF ~~ THEN BEGIN ~bm_scrollkit_confirm_MEWI955~
    SAY ~Scribe this scroll for 750 gold? This takes 9 hours.~
      IF ~PartyGoldGT(749)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(750) AdvanceTime(2700) GiveItemCreate("MEWI955X",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(749)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_MEWI955~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_9~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_MEWI955~
    SAY ~You need 750 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_9~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

IF ~~ THEN BEGIN ~bm_scrollkit_confirm_MEWI957~
    SAY ~Scribe this scroll for 500 gold? This takes 9 hours.~
      IF ~PartyGoldGT(499)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(500) AdvanceTime(2700) GiveItemCreate("MEWI957X",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(499)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_MEWI957~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_9~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_MEWI957~
    SAY ~You need 500 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_9~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

IF ~~ THEN BEGIN ~bm_scrollkit_confirm_MEWI958~
    SAY ~Scribe this scroll for 500 gold? This takes 9 hours.~
      IF ~PartyGoldGT(499)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(500) AdvanceTime(2700) GiveItemCreate("MEWI958X",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(499)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_MEWI958~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_9~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_MEWI958~
    SAY ~You need 500 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_9~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

IF ~~ THEN BEGIN ~bm_scrollkit_confirm_MEWI959~
    SAY ~Scribe this scroll for 500 gold? This takes 9 hours.~
      IF ~PartyGoldGT(499)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(500) AdvanceTime(2700) GiveItemCreate("MEWI959X",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(499)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_MEWI959~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_9~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_MEWI959~
    SAY ~You need 500 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_9~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

IF ~~ THEN BEGIN ~bm_scrollkit_confirm_MEWI966~
    SAY ~Scribe this scroll for 500 gold? This takes 9 hours.~
      IF ~PartyGoldGT(499)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(500) AdvanceTime(2700) GiveItemCreate("MEWI966X",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(499)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_MEWI966~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_9~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_MEWI966~
    SAY ~You need 500 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_arcane_circle_9~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_arcane_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

IF ~~ THEN BEGIN ~bm_scrollkit_confirm_MEPR151~
    SAY ~Scribe this scroll for 30 gold? This takes 1 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(300) GiveItemCreate("BMPR151",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_MEPR151~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_1~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_MEPR151~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_1~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

IF ~~ THEN BEGIN ~bm_scrollkit_confirm_MEPR153~
    SAY ~Scribe this scroll for 30 gold? This takes 1 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(300) GiveItemCreate("BMPR153",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_MEPR153~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_1~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_MEPR153~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_1~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

IF ~~ THEN BEGIN ~bm_scrollkit_confirm_MEPR154~
    SAY ~Scribe this scroll for 30 gold? This takes 1 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(300) GiveItemCreate("BMPR154",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_MEPR154~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_1~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_MEPR154~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_1~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

IF ~~ THEN BEGIN ~bm_scrollkit_confirm_MEPR155~
    SAY ~Scribe this scroll for 30 gold? This takes 1 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(300) GiveItemCreate("BMPR155",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_MEPR155~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_1~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_MEPR155~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_1~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

IF ~~ THEN BEGIN ~bm_scrollkit_confirm_MEPR156~
    SAY ~Scribe this scroll for 30 gold? This takes 1 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(300) GiveItemCreate("BMPR156",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_MEPR156~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_1~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_MEPR156~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_1~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

IF ~~ THEN BEGIN ~bm_scrollkit_confirm_MEPR157~
    SAY ~Scribe this scroll for 30 gold? This takes 1 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(300) GiveItemCreate("BMPR157",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_MEPR157~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_1~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_MEPR157~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_1~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

IF ~~ THEN BEGIN ~bm_scrollkit_confirm_MEPR251~
    SAY ~Scribe this scroll for 30 gold? This takes 2 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(600) GiveItemCreate("BMPR251",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_MEPR251~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_2~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_MEPR251~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_2~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

IF ~~ THEN BEGIN ~bm_scrollkit_confirm_MEPR252~
    SAY ~Scribe this scroll for 30 gold? This takes 2 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(600) GiveItemCreate("BMPR252",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_MEPR252~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_2~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_MEPR252~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_2~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

IF ~~ THEN BEGIN ~bm_scrollkit_confirm_MEPR253~
    SAY ~Scribe this scroll for 30 gold? This takes 2 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(600) GiveItemCreate("BMPR253",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_MEPR253~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_2~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_MEPR253~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_2~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

IF ~~ THEN BEGIN ~bm_scrollkit_confirm_MEPR254~
    SAY ~Scribe this scroll for 30 gold? This takes 2 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(600) GiveItemCreate("BMPR254",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_MEPR254~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_2~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_MEPR254~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_2~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

IF ~~ THEN BEGIN ~bm_scrollkit_confirm_MEPR257~
    SAY ~Scribe this scroll for 30 gold? This takes 2 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(600) GiveItemCreate("BMPR257",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_MEPR257~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_2~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_MEPR257~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_2~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

IF ~~ THEN BEGIN ~bm_scrollkit_confirm_MEPR351~
    SAY ~Scribe this scroll for 30 gold? This takes 3 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(900) GiveItemCreate("BMPR351",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_MEPR351~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_3~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_MEPR351~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_3~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

IF ~~ THEN BEGIN ~bm_scrollkit_confirm_MEPR354~
    SAY ~Scribe this scroll for 30 gold? This takes 3 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(900) GiveItemCreate("BMPR354",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_MEPR354~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_3~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_MEPR354~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_3~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

IF ~~ THEN BEGIN ~bm_scrollkit_confirm_MEPR356~
    SAY ~Scribe this scroll for 30 gold? This takes 3 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(900) GiveItemCreate("BMPR356",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_MEPR356~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_3~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_MEPR356~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_3~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

IF ~~ THEN BEGIN ~bm_scrollkit_confirm_MEPR359~
    SAY ~Scribe this scroll for 30 gold? This takes 3 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(900) GiveItemCreate("BMPR359",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_MEPR359~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_3~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_MEPR359~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_3~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

IF ~~ THEN BEGIN ~bm_scrollkit_confirm_MEPR451~
    SAY ~Scribe this scroll for 30 gold? This takes 4 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(1200) GiveItemCreate("BMPR451",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_MEPR451~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_4~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_MEPR451~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_4~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

IF ~~ THEN BEGIN ~bm_scrollkit_confirm_MEPR452~
    SAY ~Scribe this scroll for 30 gold? This takes 4 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(1200) GiveItemCreate("BMPR452",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_MEPR452~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_4~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_MEPR452~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_4~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

IF ~~ THEN BEGIN ~bm_scrollkit_confirm_MEPR453~
    SAY ~Scribe this scroll for 30 gold? This takes 4 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(1200) GiveItemCreate("BMPR453",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_MEPR453~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_4~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_MEPR453~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_4~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

IF ~~ THEN BEGIN ~bm_scrollkit_confirm_MEPR457~
    SAY ~Scribe this scroll for 30 gold? This takes 4 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(1200) GiveItemCreate("BMPR457",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_MEPR457~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_4~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_MEPR457~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_4~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

IF ~~ THEN BEGIN ~bm_scrollkit_confirm_MEPR557~
    SAY ~Scribe this scroll for 30 gold? This takes 5 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(1500) GiveItemCreate("BMPR557",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_MEPR557~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_5~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_MEPR557~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_5~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

IF ~~ THEN BEGIN ~bm_scrollkit_confirm_MEPR558~
    SAY ~Scribe this scroll for 30 gold? This takes 5 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(1500) GiveItemCreate("BMPR558",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_MEPR558~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_5~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_MEPR558~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_5~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

IF ~~ THEN BEGIN ~bm_scrollkit_confirm_MEPR652~
    SAY ~Scribe this scroll for 30 gold? This takes 6 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(1800) GiveItemCreate("BMPR652",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_MEPR652~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_6~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_MEPR652~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_6~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

IF ~~ THEN BEGIN ~bm_scrollkit_confirm_MEPR653~
    SAY ~Scribe this scroll for 30 gold? This takes 6 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(1800) GiveItemCreate("BMPR653",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_MEPR653~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_6~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_MEPR653~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_6~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

IF ~~ THEN BEGIN ~bm_scrollkit_confirm_MEPR654~
    SAY ~Scribe this scroll for 30 gold? This takes 6 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(1800) GiveItemCreate("BMPR654",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_MEPR654~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_6~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_MEPR654~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_6~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

IF ~~ THEN BEGIN ~bm_scrollkit_confirm_MEPR656~
    SAY ~Scribe this scroll for 30 gold? This takes 6 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(1800) GiveItemCreate("BMPR656",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_MEPR656~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_6~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_MEPR656~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_6~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

IF ~~ THEN BEGIN ~bm_scrollkit_confirm_MEPR657~
    SAY ~Scribe this scroll for 30 gold? This takes 6 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(1800) GiveItemCreate("BMPR657",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_MEPR657~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_6~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_MEPR657~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_6~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

IF ~~ THEN BEGIN ~bm_scrollkit_confirm_MEPR658~
    SAY ~Scribe this scroll for 30 gold? This takes 6 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(1800) GiveItemCreate("BMPR658",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_MEPR658~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_6~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_MEPR658~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_6~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

IF ~~ THEN BEGIN ~bm_scrollkit_confirm_MEPR751~
    SAY ~Scribe this scroll for 30 gold? This takes 7 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(2100) GiveItemCreate("BMPR751",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_MEPR751~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_7~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_MEPR751~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_7~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

IF ~~ THEN BEGIN ~bm_scrollkit_confirm_MEPR753~
    SAY ~Scribe this scroll for 30 gold? This takes 7 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(2100) GiveItemCreate("BMPR753",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_MEPR753~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_7~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_MEPR753~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_7~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

IF ~~ THEN BEGIN ~bm_scrollkit_confirm_MEPR755~
    SAY ~Scribe this scroll for 30 gold? This takes 7 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(2100) GiveItemCreate("BMPR755",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_MEPR755~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_7~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_MEPR755~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_7~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

IF ~~ THEN BEGIN ~bm_scrollkit_confirm_MEPR759~
    SAY ~Scribe this scroll for 30 gold? This takes 7 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(2100) GiveItemCreate("BMPR759",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_MEPR759~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_7~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_MEPR759~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_7~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

IF ~~ THEN BEGIN ~bm_scrollkit_confirm_MEPR760~
    SAY ~Scribe this scroll for 30 gold? This takes 7 hours.~
      IF ~PartyGoldGT(29)~ THEN REPLY ~Scribe the scroll.~ DO ~TakePartyGold(30) AdvanceTime(2100) GiveItemCreate("BMPR760",LastTalkedToBy(Myself),1,0,0)~ EXIT
      IF ~!PartyGoldGT(29)~ THEN REPLY ~You do not have enough gold.~ GOTO ~bm_scrollkit_nogold_MEPR760~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_7~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END

  IF ~~ THEN BEGIN ~bm_scrollkit_nogold_MEPR760~
    SAY ~You need 30 gold to scribe this scroll.~
      IF ~~ THEN REPLY ~Choose another spell.~ GOTO ~bm_scrollkit_divine_circle_7~
      IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_divine_menu~
      IF ~~ THEN REPLY ~Put the kit away.~ EXIT
  END
