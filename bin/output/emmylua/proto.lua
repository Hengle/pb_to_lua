
---@class SoldierData 
---@field public soldierType integer 
---@field public soldierCid integer 
---@field public techId integer[] 
---@field public techPointCount integer 
local SoldierData = {}

---@class SpeMailInfo 
---@field public mailTime integer 
---@field public mailContent ServerWordData 
---@field public userId integer 
---@field public avatarCId integer 
local SpeMailInfo = {}

---@class TaxViewInfo 
---@field public curTaxCityNum integer 
---@field public curTaxNPCNum integer 
---@field public LastTaxTime integer 
---@field public taxInfoList TaxInfo[] 
local TaxViewInfo = {}

---@class DraftEvent 
---@field public uId integer 
---@field public type DraftEventType 
---@field public startTime integer 
---@field public endTime integer 
---@field public userId integer 
---@field public cityId integer 
---@field public squadId integer 
---@field public num integer 
---@field public troopId integer 
local DraftEvent = {}

---@class TaxInfo 
---@field public IndexTag integer 
---@field public taxNum integer 
---@field public taxTime integer 
local TaxInfo = {}

---@class MonsterSpeedItemNotice 
---@field public info MonsterSpeedItemInfo 
local MonsterSpeedItemNotice = {}

---@class ReqRefineHero 
---@field public heroId integer 
---@field public level integer 
---@field public type integer 
local ReqRefineHero = {}

---@class HeroEveryLvRefineInfo 
---@field public heroRefineList HeroRefineInfo[] 
---@field public level integer 
local HeroEveryLvRefineInfo = {}

---@class HeroResetPropertyResultData 
---@field public res integer 
---@field public heroUId integer 
---@field public oldAttributeInfo HeroAttributeInfo[] 
local HeroResetPropertyResultData = {}

---@class tildStatus 
---@field public endTime integer 
---@field public type TiledStatusType 
local tildStatus = {}

---@class ReqDeleteSkill 
---@field public skillUId integer 
local ReqDeleteSkill = {}

---@class ResRecruitHeroNew 
---@field public itemList ItemInfo[] 
---@field public isMail boolean 
local ResRecruitHeroNew = {}

---@class TipInfo 
---@field public type integer 
---@field public needTip boolean 
local TipInfo = {}

---@class ReqUseSpeedItem 
---@field public itemID integer 
---@field public eventID integer 
---@field public itemNum integer 
local ReqUseSpeedItem = {}

---@class HeroAttributeInfo 
---@field public attribute HeroAttribute 
---@field public count integer 
local HeroAttributeInfo = {}

---@class PropItemInfo 
---@field public id integer 
---@field public num integer 
---@field public overflow boolean 
local PropItemInfo = {}

---@class SoldierEvent 
---@field public uId integer 
---@field public startTime integer 
---@field public endTime integer 
---@field public soldierData SoldierData 
---@field public userId integer 
---@field public type SoldierEventHandleType 
local SoldierEvent = {}

---@class MarchHero 
---@field public heroId integer 
---@field public statusList HeroStatus[] 
---@field public military VLimit 
---@field public hurtSoldier integer 
---@field public exp integer 
---@field public power integer 
local MarchHero = {}

---@class Item 
---@field public itemID integer 
---@field public count integer 
local Item = {}

---@class UnionMarkInfo 
---@field public starId integer 
---@field public point Point 
---@field public markTime integer 
---@field public userName string 
---@field public markName string 
---@field public markDes string 
---@field public type UnionJobType 
local UnionMarkInfo = {}

---@class SkillUpgradeNotice 
---@field public res integer 
local SkillUpgradeNotice = {}

---@class Hero 
---@field public uId integer 
---@field public cId integer 
---@field public exp integer 
---@field public statusList HeroStatus[] 
---@field public power integer 
---@field public fristSkillId integer 
---@field public secondSkillId integer 
---@field public thirdSkillId integer 
---@field public starLev integer 
---@field public troopId integer 
---@field public position integer 
---@field public military integer 
---@field public hurtSoldier integer 
---@field public lastCountPwoerTime integer 
---@field public attributeInfo HeroAttributeInfo[] 
---@field public attributeLeft integer 
---@field public resetCountLeft integer 
---@field public heroRefineList HeroEveryLvRefineInfo[] 
---@field public toRefineList HeroEveryLvRefineInfo[] 
---@field public risePowerTimes integer 
local Hero = {}

---@class HeroEvolveResultData 
---@field public res integer 
---@field public heroUId integer 
local HeroEvolveResultData = {}

---@class ReqResetHeroAttribute 
---@field public heroId integer 
local ReqResetHeroAttribute = {}

---@class ReqUseMonsterSpeedItem 
---@field public propId integer 
local ReqUseMonsterSpeedItem = {}

---@class HeroHandleResultNotice 
---@field public studySkill HeroStudySkillResultData 
---@field public starUp HeroEvolveResultData 
---@field public lvUp HeroLvUpResultData 
---@field public resetHere HeroResetResultData 
---@field public configProperty HeroConfigPropertyResultData 
---@field public resetProperty HeroResetPropertyResultData 
local HeroHandleResultNotice = {}

---@class PushNotifItem 
---@field public cId integer 
---@field public isOpen integer 
local PushNotifItem = {}

---@class MapTileInfo 
---@field public starId integer 
---@field public coord Point 
---@field public elementType integer 
---@field public playerId integer 
---@field public unionId integer 
---@field public status integer 
---@field public buildingName string 
---@field public isBuilding boolean 
---@field public durability VLimit 
---@field public statusList tildStatus[] 
---@field public supUnionId integer 
---@field public supUnionName string 
---@field public unionName string 
---@field public declareWar DeclareWar 
---@field public MapTradeCId integer 
---@field public ZhujidiProtectType integer 
---@field public optionNum integer 
---@field public newBieUserID integer 
---@field public pirateCId integer 
---@field public refugeeId integer 
---@field public randomData RandomData[] 
---@field public isJihuo boolean 
local MapTileInfo = {}

---@class MarchEvent 
---@field public uId integer 
---@field public type MarchEvtType 
---@field public starId integer 
---@field public startPoint Point 
---@field public endPoint Point 
---@field public startTime integer 
---@field public endTime integer 
---@field public userId integer 
---@field public userName string 
---@field public unionId integer 
---@field public troopId integer 
---@field public filedType EnumFieldType 
---@field public handleType MarchEventHandleType 
---@field public cData MarchClientData 
local MarchEvent = {}

---@class RectPoint 
---@field public leftTop Point 
---@field public rightBottom Point 
local RectPoint = {}

---@class ReqSkillHandle 
---@field public curSkillId integer 
local ReqSkillHandle = {}

---@class ReqRecruitHeroNew 
---@field public isOnce boolean  @  required int64 bagUId = 1 ; / / 卡包服务器id  
---@field public type integer 
---@field public isUseXingJuan boolean 
local ReqRecruitHeroNew = {}

---@class City 
---@field public uId integer 
---@field public starId integer 
---@field public coord Point 
---@field public elementType integer 
---@field public recruit integer 
---@field public military integer 
---@field public defense VLimit 
---@field public cost integer 
---@field public armyList Army[] 
---@field public buildingList Building[] 
---@field public name string 
---@field public level integer 
local City = {}

---@class StarInfo 
---@field public starId integer 
---@field public bronPointInfo VLimit 
---@field public status integer 
local StarInfo = {}

---@class CityBuildEvent 
---@field public uId integer 
---@field public startTime integer 
---@field public endTime integer 
---@field public userId integer 
---@field public cityId integer 
---@field public curCityBuildCId integer 
---@field public type CityBuildEvtType 
---@field public isFreeQueue boolean 
local CityBuildEvent = {}

---@class ReqSpeedUpItemList 
local ReqSpeedUpItemList = {}

---@class HeroResetResultData 
---@field public res integer 
---@field public heroUId integer 
---@field public oldHeroLv integer 
local HeroResetResultData = {}

---@class MarchClientData 
---@field public endAction integer 
---@field public endResult integer 
---@field public nextTrainStep integer 
local MarchClientData = {}

---@class HeroStatus 
---@field public heroStatus integer 
---@field public recoveryTime integer 
local HeroStatus = {}

---@class RecruitNotice 
---@field public recruitInfo RecruitInfo 
local RecruitNotice = {}

---@class OccupyUnion 
---@field public unionId integer 
---@field public unionName string 
local OccupyUnion = {}

---@class StrItem 
---@field public id integer 
---@field public value string 
local StrItem = {}

---@class ReqCreatHero 
---@field public heroCid integer 
local ReqCreatHero = {}

---@class ReqAllotHeroAttribute 
---@field public heroId integer 
---@field public attributeInfo HeroAttributeInfo[] 
local ReqAllotHeroAttribute = {}

---@class Army 
---@field public uid integer 
---@field public troopid integer 
local Army = {}

---@class Mininuke 
---@field public decree_limit VLimit 
---@field public decreeRecoveTime integer 
---@field public buyDecreeRemainCount integer 
local Mininuke = {}

---@class HeroConfigPropertyResultData 
---@field public res integer 
---@field public heroUId integer 
---@field public handelAttributeInfo HeroAttributeInfo[] 
local HeroConfigPropertyResultData = {}

---@class HeroLvUpResultData 
---@field public res integer 
---@field public heroUId integer 
local HeroLvUpResultData = {}

---@class HeroRefineInfo 
---@field public id integer 
---@field public value integer 
local HeroRefineInfo = {}

---@class MonsterSpeedItemInfo 
---@field public propId integer 
---@field public endTime integer 
local MonsterSpeedItemInfo = {}

---@class ItemInfo 
---@field public itemId integer 
---@field public count integer 
---@field public isTranslated boolean 
local ItemInfo = {}

---@class PieceNotice 
---@field public pieceList PieceInfo[] 
---@field public type DataHandleType 
local PieceNotice = {}

---@class Troop 
---@field public uId integer 
---@field public cityId integer 
---@field public curCityId integer 
---@field public HeroIdList integer[] 
local Troop = {}

---@class ReqMailGetAward 
---@field public mailId integer 
---@field public type EnumMailType 
local ReqMailGetAward = {}

---@class MapBuildEvent 
---@field public uId integer 
---@field public startTime integer 
---@field public endTime integer 
---@field public starId integer 
---@field public point Point 
---@field public userId integer 
---@field public cityId integer 
---@field public buildId integer 
---@field public buildCId integer 
---@field public type MapBuildIngStatus 
---@field public elementType integer 
---@field public filedType EnumFieldType 
---@field public handleType MapBuildHandleType 
---@field public preType MapBuildIngStatus 
---@field public rebuildType integer 
local MapBuildEvent = {}

---@class ResSpeedUpItemList 
---@field public list Item[] 
local ResSpeedUpItemList = {}

---@class ReqUpHeroLv 
---@field public heroId integer 
---@field public targetLv integer 
local ReqUpHeroLv = {}

---@class ReqResetHero 
---@field public heroId integer 
local ReqResetHero = {}

---@class ResDeleteSkill 
---@field public skillCId integer 
local ResDeleteSkill = {}

---@class RecruitInfo 
---@field public lastRefreshTime integer 
---@field public isFreeUsed boolean 
---@field public isDiscountUsed boolean 
---@field public leftCount integer 
local RecruitInfo = {}

---@class HeroStudySkillResultData 
---@field public res integer 
---@field public heroUId integer 
local HeroStudySkillResultData = {}

---@class ReqHandleHeroSkill 
---@field public heroId integer 
---@field public skillPos integer 
---@field public skillUId integer 
---@field public type integer 
local ReqHandleHeroSkill = {}

---@class VLimit 
---@field public value integer 
---@field public limit integer 
local VLimit = {}

---@class MyUnion 
---@field public unionId integer 
---@field public unionName string 
---@field public cdRemainTime integer 
---@field public unionJobType UnionJobType 
---@field public isSuccessor boolean 
---@field public friendUnionIdList integer[] 
---@field public badUnionIdList integer[] 
---@field public markInfoList UnionMarkInfo[] 
---@field public unionType integer 
local MyUnion = {}

---@class ResUseSpeedItem 
---@field public res integer 
---@field public restCount integer 
---@field public itemID integer 
local ResUseSpeedItem = {}

---@class MapMark 
---@field public uId integer 
---@field public type MapMarkTypeEnum 
---@field public starId integer 
---@field public pos Point 
---@field public name string 
local MapMark = {}

---@class Building 
---@field public uId integer 
---@field public cId integer 
---@field public level integer 
---@field public status MapBuildIngStatus 
---@field public starId integer 
---@field public point Point 
---@field public rebuildReason integer 
local Building = {}

---@class ServerWordData 
---@field public content string 
---@field public languageId integer 
---@field public parms LanguageParmDate[] 
local ServerWordData = {}

---@class ReqConfirmRefine 
---@field public heroId integer 
---@field public level integer 
---@field public isSave boolean 
local ReqConfirmRefine = {}

---@class Point 
---@field public x integer 
---@field public y integer 
---@field public starId integer 
local Point = {}

---@class ResSendMail 
---@field public res integer 
local ResSendMail = {}

---@class LongItem 
---@field public id integer 
---@field public value integer 
local LongItem = {}

---@class ReqSendMail 
---@field public userName string 
---@field public unionId integer 
---@field public content string 
local ReqSendMail = {}

---@class DeclareWar 
---@field public attackUnionId integer 
---@field public defendUnionId integer 
---@field public attackUnionName string 
---@field public defendUnionName string 
---@field public endTime integer 
---@field public isDeclareWar boolean 
local DeclareWar = {}

---@class SkillInfo 
---@field public uId integer 
---@field public cId integer 
---@field public exp integer 
---@field public learnHeroId integer 
local SkillInfo = {}

---@class LanguageParmDate 
---@field public type integer 
---@field public parm string 
---@field public serverWordData ServerWordData 
local LanguageParmDate = {}

---@class PieceInfo 
---@field public pieceId integer 
---@field public count integer 
local PieceInfo = {}

---@class ReqViewMail 
---@field public mailId integer 
---@field public type EnumMailType 
local ReqViewMail = {}

---@class CityReBuild 
---@field public type integer 
---@field public titleStr ServerWordData 
---@field public contentStr ServerWordData 
local CityReBuild = {}

---@class ReqTakeAllMailReward 
local ReqTakeAllMailReward = {}

---@class RandomData 
---@field public randomCid integer 
---@field public userId integer 
---@field public orgPoint Point 
---@field public dstPoint Point 
local RandomData = {}

---@class MailInfo 
---@field public uId integer 
---@field public userName string 
---@field public type EnumMailType 
---@field public isRead boolean 
---@field public isGet boolean 
---@field public mailList SpeMailInfo[] 
---@field public items PropItemInfo[] 
local MailInfo = {}

---@class ReqEvolveHero 
---@field public heroUId integer 
local ReqEvolveHero = {}
