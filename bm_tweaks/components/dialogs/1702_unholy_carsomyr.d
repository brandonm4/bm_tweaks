APPEND ~BOTSMITH~

IF ~  Global("TalkedToBotsmith","GLOBAL",1)
Global("ItemMaker","GLOBAL",0)
InPartySlot(LastTalkedToBy,0)
Global("BMUCAR_TOKEN","GLOBAL",0)
OR(2)
PartyHasItem("sw2h10")
PartyHasItem("sw2h19")
~ THEN BEGIN BM1702_TOKEN
  SAY ~Cespenar can do that, yes. Holy blade gets all sticky with this black muck, and then all the nice holy shine goes bad. Very bad. Here, take the unguent and come back when you want the ritual done proper.~
  IF ~~ THEN REPLY ~Good. Hand it over.~ DO ~SetGlobal("BMUCAR_TOKEN","GLOBAL",1) GiveItemCreate("BMCRPTK",Player1,1,0,0)~ EXIT
  IF ~~ THEN REPLY ~Show me your usual recipes instead.~ GOTO 2
  IF ~~ THEN REPLY ~Not yet.~ EXIT
END

IF ~  Global("TalkedToBotsmith","GLOBAL",1)
Global("ItemMaker","GLOBAL",0)
InPartySlot(LastTalkedToBy,0)
PartyHasItem("bmcrptk")
OR(2)
PartyHasItem("sw2h10")
PartyHasItem("carsomyr")
~ THEN BEGIN BM1702_CORRUPT5
  SAY ~Carsomyr first, yes? Cespenar smears the unguent in all the holy places, says rude things about Tyr, and then the sword stops being so nice.~
  IF ~  PartyHasItem("sw2h10")
PartyHasItem("bmcrptk")
~ THEN REPLY ~Do it.~ DO ~TakePartyItemNum("sw2h10",1) DestroyItem("sw2h10") TakePartyItemNum("bmcrptk",1) DestroyItem("bmcrptk") GiveItemCreate("BMCARS5",Player1,0,0,0)~ EXIT
  IF ~  PartyHasItem("carsomyr")
PartyHasItem("bmcrptk")
~ THEN REPLY ~Do it.~ DO ~TakePartyItemNum("carsomyr",1) DestroyItem("carsomyr") TakePartyItemNum("bmcrptk",1) DestroyItem("bmcrptk") GiveItemCreate("BMCARS5",Player1,0,0,0)~ EXIT
  IF ~~ THEN REPLY ~Show me your usual recipes instead.~ GOTO 2
  IF ~~ THEN REPLY ~Leave it be.~ EXIT
END

IF ~  Global("TalkedToBotsmith","GLOBAL",1)
Global("ItemMaker","GLOBAL",0)
InPartySlot(LastTalkedToBy,0)
PartyHasItem("bmcrptk")
PartyHasItem("sw2h19")
~ THEN BEGIN BM1702_CORRUPT6
  SAY ~Ooo, already improved and everything. Makes a very nasty profanation, that one. Cespenar can do it.~
  IF ~  PartyHasItem("sw2h19")
PartyHasItem("bmcrptk")
~ THEN REPLY ~Corrupt it.~ DO ~TakePartyItemNum("sw2h19",1) DestroyItem("sw2h19") TakePartyItemNum("bmcrptk",1) DestroyItem("bmcrptk") GiveItemCreate("BMCARS6",Player1,0,0,0)~ EXIT
  IF ~~ THEN REPLY ~Show me your usual recipes instead.~ GOTO 2
  IF ~~ THEN REPLY ~Not now.~ EXIT
END

IF ~  Global("TalkedToBotsmith","GLOBAL",1)
Global("ItemMaker","GLOBAL",0)
InPartySlot(LastTalkedToBy,0)
PartyHasItem("compon02")
OR(2)
PartyHasItem("bmcars5")
PartyHasItem("bmcar25")
~ THEN BEGIN BM1702_UPGRADE
  SAY ~Eye of Tyr still bites even in a profaned hilt. Add the jewel, 5,000 gold, and Cespenar can push the corrupted blade to its stronger form.~
  IF ~  PartyGoldLT(5000)
~ THEN REPLY ~I do not have that much gold.~ EXIT
  IF ~  PartyGoldGT(4999)
PartyHasItem("bmcars5")
PartyHasItem("compon02")
~ THEN REPLY ~Upgrade the one-handed blade.~ DO ~TakePartyGold(5000) DestroyGold(5000) TakePartyItemNum("bmcars5",1) DestroyItem("bmcars5") TakePartyItemNum("compon02",1) DestroyItem("compon02") GiveItemCreate("BMCARS6",Player1,0,0,0)~ EXIT
  IF ~  PartyGoldGT(4999)
PartyHasItem("bmcar25")
PartyHasItem("compon02")
~ THEN REPLY ~Upgrade the two-handed blade.~ DO ~TakePartyGold(5000) DestroyGold(5000) TakePartyItemNum("bmcar25",1) DestroyItem("bmcar25") TakePartyItemNum("compon02",1) DestroyItem("compon02") GiveItemCreate("BMCAR26",Player1,0,0,0)~ EXIT
  IF ~~ THEN REPLY ~Show me your usual recipes instead.~ GOTO 2
  IF ~~ THEN REPLY ~Leave it as it is.~ EXIT
END

END
