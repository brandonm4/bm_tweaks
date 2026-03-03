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
    IF ~~ THEN REPLY ~Choose a different spell circle.~ GOTO ~bm_scrollkit_arcane_menu~
    IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_main~
    IF ~~ THEN REPLY ~Put the kit away.~ EXIT
END

IF ~~ THEN BEGIN bm_scrollkit_arcane_circle_2
  SAY ~Choose a spell to scribe.~
    IF ~~ THEN REPLY ~Choose a different spell circle.~ GOTO ~bm_scrollkit_arcane_menu~
    IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_main~
    IF ~~ THEN REPLY ~Put the kit away.~ EXIT
END

IF ~~ THEN BEGIN bm_scrollkit_arcane_circle_3
  SAY ~Choose a spell to scribe.~
    IF ~~ THEN REPLY ~Choose a different spell circle.~ GOTO ~bm_scrollkit_arcane_menu~
    IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_main~
    IF ~~ THEN REPLY ~Put the kit away.~ EXIT
END

IF ~~ THEN BEGIN bm_scrollkit_arcane_circle_4
  SAY ~Choose a spell to scribe.~
    IF ~~ THEN REPLY ~Choose a different spell circle.~ GOTO ~bm_scrollkit_arcane_menu~
    IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_main~
    IF ~~ THEN REPLY ~Put the kit away.~ EXIT
END

IF ~~ THEN BEGIN bm_scrollkit_arcane_circle_5
  SAY ~Choose a spell to scribe.~
    IF ~~ THEN REPLY ~Choose a different spell circle.~ GOTO ~bm_scrollkit_arcane_menu~
    IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_main~
    IF ~~ THEN REPLY ~Put the kit away.~ EXIT
END

IF ~~ THEN BEGIN bm_scrollkit_arcane_circle_6
  SAY ~Choose a spell to scribe.~
    IF ~~ THEN REPLY ~Choose a different spell circle.~ GOTO ~bm_scrollkit_arcane_menu~
    IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_main~
    IF ~~ THEN REPLY ~Put the kit away.~ EXIT
END

IF ~~ THEN BEGIN bm_scrollkit_arcane_circle_7
  SAY ~Choose a spell to scribe.~
    IF ~~ THEN REPLY ~Choose a different spell circle.~ GOTO ~bm_scrollkit_arcane_menu~
    IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_main~
    IF ~~ THEN REPLY ~Put the kit away.~ EXIT
END

IF ~~ THEN BEGIN bm_scrollkit_arcane_circle_8
  SAY ~Choose a spell to scribe.~
    IF ~~ THEN REPLY ~Choose a different spell circle.~ GOTO ~bm_scrollkit_arcane_menu~
    IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_main~
    IF ~~ THEN REPLY ~Put the kit away.~ EXIT
END

IF ~~ THEN BEGIN bm_scrollkit_arcane_circle_9
  SAY ~Choose a spell to scribe.~
    IF ~~ THEN REPLY ~Choose a different spell circle.~ GOTO ~bm_scrollkit_arcane_menu~
    IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_main~
    IF ~~ THEN REPLY ~Put the kit away.~ EXIT
END

IF ~~ THEN BEGIN bm_scrollkit_divine_circle_1
  SAY ~Choose a spell to scribe.~
    IF ~~ THEN REPLY ~Choose a different spell circle.~ GOTO ~bm_scrollkit_divine_menu~
    IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_main~
    IF ~~ THEN REPLY ~Put the kit away.~ EXIT
END

IF ~~ THEN BEGIN bm_scrollkit_divine_circle_2
  SAY ~Choose a spell to scribe.~
    IF ~~ THEN REPLY ~Choose a different spell circle.~ GOTO ~bm_scrollkit_divine_menu~
    IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_main~
    IF ~~ THEN REPLY ~Put the kit away.~ EXIT
END

IF ~~ THEN BEGIN bm_scrollkit_divine_circle_3
  SAY ~Choose a spell to scribe.~
    IF ~~ THEN REPLY ~Choose a different spell circle.~ GOTO ~bm_scrollkit_divine_menu~
    IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_main~
    IF ~~ THEN REPLY ~Put the kit away.~ EXIT
END

IF ~~ THEN BEGIN bm_scrollkit_divine_circle_4
  SAY ~Choose a spell to scribe.~
    IF ~~ THEN REPLY ~Choose a different spell circle.~ GOTO ~bm_scrollkit_divine_menu~
    IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_main~
    IF ~~ THEN REPLY ~Put the kit away.~ EXIT
END

IF ~~ THEN BEGIN bm_scrollkit_divine_circle_5
  SAY ~Choose a spell to scribe.~
    IF ~~ THEN REPLY ~Choose a different spell circle.~ GOTO ~bm_scrollkit_divine_menu~
    IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_main~
    IF ~~ THEN REPLY ~Put the kit away.~ EXIT
END

IF ~~ THEN BEGIN bm_scrollkit_divine_circle_6
  SAY ~Choose a spell to scribe.~
    IF ~~ THEN REPLY ~Choose a different spell circle.~ GOTO ~bm_scrollkit_divine_menu~
    IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_main~
    IF ~~ THEN REPLY ~Put the kit away.~ EXIT
END

IF ~~ THEN BEGIN bm_scrollkit_divine_circle_7
  SAY ~Choose a spell to scribe.~
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
    IF ~~ THEN REPLY ~Choose a different spell circle.~ GOTO ~bm_scrollkit_divine_menu~
    IF ~~ THEN REPLY ~Go back.~ GOTO ~bm_scrollkit_main~
    IF ~~ THEN REPLY ~Put the kit away.~ EXIT
END
