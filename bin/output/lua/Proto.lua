---@class Proto
local Proto = {
Schema = [[
syntax = "proto3"



//英雄强化、遗忘skill
//返回HeroDataNotice
message ReqHandleHeroSkill {
	required int64 heroId = 1;						//英雄id
	required int32 skillPos = 2;					//技能位置（默认技能-->1,第二技能-->2,觉醒技能-->3）
	required int64 skillUId=3;						//技能ID （type=2 时有用，默认0）
	required int32 type = 4;						//操作类型（0:解锁，1：遗忘，2：学习）
}


//请求招募，返回获得的道具//(请求招募某个卡包英雄，返回资源notice,英雄notice，战法经验notice(基础数据通知)，ResRecruitHeroNew)
message ReqRecruitHeroNew{
	//required int64 bagUId =1;   	//卡包服务器id
	required bool isOnce=2; 		//是否是单次
}

//返回抽到的道具（没有转化前）
message ResRecruitHeroNew{
	repeated ItemInfo itemList =1;	//抽到的道具
	required bool isMail = 2;		//是否要提示显示邮件查收
}

message ItemInfo{
	required int32 itemId = 1;
	required int32 count = 2;
	required bool isTranslated = 3;//是否转化
}

//碎片
message PieceInfo{
	required int32 pieceId = 1;
	required int32 count = 2;
}

//碎片消息
message PieceNotice{
	repeated PieceInfo pieceList = 1;
	required DataHandleType type = 2;
}

//请求技能吃技能
message ReqSkillHandle{
	required int64 curSkillId=1;	
}

//请求碎片合成英雄
message ReqCreatHero{
	required int32 heroCid=1; //请求合成的英雄配置id,对应的碎片及数量读取配置表
}

//请求英雄升星
message ReqEvolveHero {
	required int64 heroUId = 1;
}

 

//发送抽奖倒计时等信息的消息
message RecruitNotice {
	required RecruitInfo recruitInfo = 1;
}

message RecruitInfo {
	required int64 lastRefreshTime = 1;		//上次获得免费抽奖机会的时间
	required bool isFreeUsed = 2;			//免费机会是否使用了，false没有使用
	required bool isDiscountUsed = 3;		//打折机会是否使用了，false没有使用
	required int32 leftCount = 4;			//还剩x次获得蓝色物品
}

//技能升级返回消息（只返回成功or 失败，数据走其他消息）
message SkillUpgradeNotice{
	required int32 res=1; //状态 0： 成功， 其他：失败
}

 

//英雄配点
message ReqAllotHeroAttribute {
	required int64 heroId = 1;							//英雄id
	repeated HeroAttributeInfo attributeInfo = 2;		//英雄属性
}

//重置英雄属性点(洗点)
message ReqResetHeroAttribute {
	required int64 heroId = 1;
}

//重置英雄
message ReqResetHero {
	required int64 heroId = 1;
}

//请求英雄升级
message ReqUpHeroLv{
	required int64 heroId = 1;  
	required int32 targetLv=2;		//目标等级
}


//对英雄各种操作结果通知（必须是客户端主动请求操作）（只有状态 0： 成功， 其他：失败）
message HeroHandleResultNotice{
}



//英雄学习技能返回结果（HeroStudySkillNotice）
message HeroStudySkillResultData{
	required int32 res = 1;							//状态 0： 成功， 其他：失败
	required int64 heroUId=2;
}
//英雄升星操作返回结构（ResEvolveHero）
message HeroEvolveResultData{
	required int32 res = 1;							//状态 0： 成功， 1：失败
	required int64 heroUId=2;
}

//英雄升级操作返回结构
message HeroLvUpResultData{
	required int32 res = 1;							//状态 0： 成功， 其他：失败
	required int64 heroUId=2;
}

//英雄重置操作返回结构
message HeroResetResultData{
	required int32 res = 1;							//状态 0： 成功， 其他：失败
	required int64 heroUId=2;
	required int32 oldHeroLv=3;						//重置前的英雄等级	
} 

//英雄配点操作返回结构
message HeroConfigPropertyResultData{
	required int32 res = 1;							//状态 0： 成功， 其他：失败
	required int64 heroUId=2;
	repeated HeroAttributeInfo handelAttributeInfo = 3;		//配点的属性 
}

//英雄洗点操作返回结构
message HeroResetPropertyResultData{
	required int32 res = 1;							//状态 0： 成功， 其他：失败
	required int64 heroUId=2;
	repeated HeroAttributeInfo oldAttributeInfo = 3;		//洗点前的英雄属性 
}

//请求改良，返回HeroNotice
message ReqRefineHero { 
	required int64 heroId = 1;
	required int32 level = 2;
	required int32 type = 3;//类型：1道具改良，2钻石改良
}

//确认保存改良结果
message ReqConfirmRefine { 
	required int64 heroId = 1;
	required int32 level = 2;
	required bool isSave = 3;//true是保存，false是取消
}

//删除技能，返回技能通知消息和下面的消息
message ReqDeleteSkill { 
	required int64 skillUId = 1;
}

//删除技能的返回消息
message ResDeleteSkill { 
	required int32 skillCId = 1;
}







//请求加速道具列表
message ReqSpeedUpItemList { 
}

//加速道具列表
message ResSpeedUpItemList { 
	repeated Item list = 1;
}

//道具结构
message Item{
	required int32 itemID = 1;//道具ID
	required int32 count = 2;//道具数量
}

//请求使用加速道具
message ReqUseSpeedItem{ 
	required int32 itemID = 1;//要使用的道具ID 如果是免费加速该字段是-1
	required int64 eventID = 2;//用来加速的事件id
	required int32 itemNum = 3;//要使用的道具的数量 -1则是免费加速的时候
}

//使用加速度道具结果
message ResUseSpeedItem{ 
	required int32 res = 1;//0 成功 1 道具数量不够 2 找不到事件 3 事件类型错误 4 指不到建筑配置 5 事件类型不对
}

//请求使用打怪物加速道具
message ReqUseMonsterSpeedItem { 
	required int32 propId = 1;
}

//使用怪物加速道具通知消息
message MonsterSpeedItemNotice { 
	required MonsterSpeedItemInfo info = 1;	
}

message MonsterSpeedItemInfo {
	required int32 propId = 1;		//使用的加速道具id
	required int64 endTime = 2;		//效果截止时间
}

/// 消息号：105XXX

//查看某邮件，返回MailStatusNotice
message ReqViewMail
{ 
	required int64 mailId=1;		//uid，个人邮件指
	required EnumMailType type = 2;
}

//请求领取附件，返回资源更新，ResMailGetAward和MailStatusNotice
message ReqMailGetAward
{ 
	required int64 mailId=1;
	required EnumMailType type = 2;
}



//请求发送邮件
message ReqSendMail
{ 
	required string userName=1; //收件人名称
	required int64 unionId =2; //收件联盟
	required string content=3; //内容	
}

message ResSendMail
{ 
	required int32 res=1; //0：发送成功，其他发送失败
}

//请求领取所有邮件的附件，返回资源更新，ResMailGetAward和MailStatusNotice
message ReqTakeAllMailReward
{ 
}





//星球信息
message StarInfo
{
	required int32 starId = 1;//星球id
	required VLimit bronPointInfo = 2;//该星球可容纳玩家数量
}

//当前，和上限值共存的结构
message VLimit
{
	required int64 value = 1;//当前值
	required int64 limit = 2;//限制值
}

//坐标点
message Point 
{
	required int32 x=1;//X 坐标
	required int32 y=2;//Y 坐标
}

//坐标范围
message RectPoint
{
	required Point leftTop=1;//左上坐标
	required Point rightBottom=2;//右下坐标
}

message MyUnion{
	required int64 unionId=1;  //我的联盟Id (没有为0)
	required string unionName=2;
	required int64 cdRemainTime=3 ; 
	required UnionJobType unionJobType=4; //我在联盟中的职位
	required bool isSuccessor = 5;//是不是继承者
	repeated int64 friendUnionIdList=6; //友好联盟列表
	repeated int64 badUnionIdList=7; //敌对关系联盟列表
	repeated UnionMarkInfo markInfoList=8; //联盟标记
}

//返回联盟标记列表
message UnionMarkInfo{
	required int32 starId=1;
	required Point point=2;
	required int64 markTime=3;	
	required string userName=4;
	required string markName=5;
	required string markDes=6;	
	required UnionJobType type=7;
}

message OccupyUnion
{
	required int64 unionId=1;//如果被沦陷，上级联盟id,默认0
	required string unionName=2; 
}

//联盟职位
enum UnionJobType
{
	leader=1;  //盟主
	secondLeader=2; //副盟主
	officer=3; //官员
	loser=4;  //平民
}

//联盟关系类型枚举
enum UnionRelationType
{
	peace=1; //没有关系
	good=2;  //友好
	bad=3;   //敌对
}


 

//英雄
message Hero 
{
	required int64 uId=1;								//归属玩家唯一标识id
	required int32 cId=2;								//英雄ID配置表读取
	required int64 exp=3;								//经验值 （读取配置表可获得等级）
	repeated HeroStatus statusList=4;					//英雄状态（根据优先级可确定一个状态）
	required int32 power=5;								//体力
	required int64 fristSkillId=6;						//第一技能（未解锁：-1，没学习 ：0(这里实际上不存在没学习的状态)）
	required int64 secondSkillId=7;						//第二技能 （未解锁：-1，没学习 ：0）
	required int64 thirdSkillId=8;						//第三技能 （未解锁：-1，没学习 ：0）
	required int32 starLev=9; 							//星级（默认0）
	required int32 troopId=10;  						//所在部队ID 默认0
	required int32 position=11;  						//区分前锋,中锋等,1:大营，2：中锋，3：前锋位置（在部队中，有意义） 默认0
	required int32 military=12; 						//带兵数量  默认0
	required int32 hurtSoldier=13; 						//伤病数量  默认0
	repeated HeroAttributeInfo attributeInfo = 15;		//英雄属性
	required int32 attributeLeft = 16;					//剩余点数
	required int32 resetCountLeft = 17;					//剩余免费重置次数
	repeated HeroEveryLvRefineInfo heroRefineList = 18;	//英雄洗练属性
	repeated HeroEveryLvRefineInfo toRefineList = 19;	//待确定的洗练属性
}

//英雄属性
enum HeroAttribute {
	HERO_ATTACK = 1;	//攻击
	HERO_DEFFEND = 2;	//防御
	HERO_SKILL = 3;		//能量
	HERO_SPEED = 4;		//速度
	HERO_CITY = 5;		//攻城
}

//英雄属性信息
message HeroAttributeInfo {
	required HeroAttribute attribute = 1;
	required int32 count = 2;
}

//英雄每一级洗练的info
message HeroEveryLvRefineInfo {
	repeated HeroRefineInfo heroRefineList = 1;
	required int32 level = 2;
}

//英雄洗练的每一条info
message HeroRefineInfo {
	required int32 id = 1;
	required int32 value = 2;
}

message SkillInfo
{
	required int64 uId=1;//唯一Id
	required int32 cId=2;//技能ID(注意，此Id,是配置表t_id,而不是baseId)
	required int32 exp=3;// 经验值
	required int64 learnHeroId=4; //学习此战法的英雄Id
}

//基地
message City
{
	required int32 uId=1;//城池ID
	required int32 starId=2;//星球Id
	required Point coord=3;//坐标
	required int32 elementType=4;//1-主城 2-分城 3-要塞
	required int32 recruit=5;//预备役
	required int32 military=6;//总兵力
	required VLimit defense=7;//耐久度
	required int32 cost=8;//COST值
	repeated Army armyList=9;//城市部队
	repeated Building buildingList=10;//建筑列表
	required string name=11;//城池名字
	required int32 level=12; //等级
}

// 某个城市的一只军队
message Army 
{
	required int32 uid=1;//部队编号id
	required int32 troopid=2;//部队id （可能没有部队，没有部队为：-1）
}

//一个军队中的部队
message Troop
{
	required int32 uId=1;//部队Id
	required int32 cityId=2;//所属城池id（出生地）
	required int32 curCityId=3; //当前所在城池（可能是城池，要塞）
	repeated int64 HeroIdList=4; //分队列表
}


//英雄状态
message HeroStatus
{
	required int32 heroStatus=1;//英雄状态(0：待命，1：征兵，2：疲倦，3：出征，4：重伤，5：不在部队，6：驻扎，7：返回，8：调动，9：采集，10，演习,11:平局,12:侦察CD,13:集结准备中)
	required int64 recoveryTime=2;//恢复时间
}

//建筑
message Building
{
    required int64 uId=1;//建筑唯一ID
	required int32 cId=2;//建筑类型ID
	required int32 level=3;//等级
	required MapBuildIngStatus status=4;
}





//地图标记
message MapMark
{
	required int32 uId=1;
	required MapMarkTypeEnum type =2; //标记类型
	required int32 starId=3;//星球Id
	required Point pos=4;//标记坐标
	required string name=5;//标记名字
}
enum MapMarkTypeEnum
{
	MarkTypeNormal=0;
	MarkTypeGood=1;
	MarkTypeBad=2;
}

///地图相关

//随机事件数据
message RandomData{
   required int32 randomCid=1; //随机事件cid
}


//地图块信息
message MapTileInfo 
{
	required int32 starId=1;//星球Id
	required Point coord=2;//坐标
	required int32 elementType=3;//加载资源类型
	required int64 playerId=4;//玩家id
	required int64 unionId=5;//联盟id
	required int32 status=6;//状态: 1-沦陷
	repeated tildStatus statusList=10;//状态类型列表
	
	repeated RandomData randomData = 21;//随机事件数据
}


message DeclareWar
{
	required int64 attackUnionId =1; // 宣战联盟id
	required  int64 defendUnionId=2;  //被宣战联盟id	
	required string attackUnionName=3;
	required string defendUnionName=4;	
	required int64	endTime=5;
	required bool isDeclareWar=6 ;// 是不是宣战中 （不然就是盟战ing）
}


//出征相关操作类型 
enum MarchHandleType{	
	mapExpedition=1;//占领（出征）
	mapRetreat=2;//撤退（取消）
	mapExercise=3;//军演 （练兵）
	mapCollect=4;//采集（屯田）
	mapFight=5;//镇压 （扫荡）
	mapDefend=6;//驻守
	mapDispatch=7;//派遣 （调动）
	mapComplete=8;// 返回时，立即完成
	mapLoot=9;//截获星际商队
	mapScout=10;//侦察
	mapAttackPirate=11;//攻击星际海盗
	mapExpelRefugee=12;//驱逐难民
	mapHelpRefugee=13;//救济难民
	mapExplore=14;// 探索（新版随机事件专属）
	mapAssemble=15;//响应集结部队
	mapCancelAssemble=16;//取消集结部队	
}

enum EnumFieldType
{
	noField=1;
	normalField=2;
	warnField=3;
}


//行军事件类型 出发（部队信息英雄状态），撤退（部队英雄信息，城池数据），战平（战斗数据，战报），返回（战斗结果，经验，仓库数据），结束（城池数据），屯田（开始屯田，（返回---）屯田结束），
//练兵，扫荡（资源改变的跟新消息），驻守，调动（城池英雄数据改变），集结准备中（部队还是处于城池中）
enum MarchEvtType
{
	evtGoOut=1; //出发
	evtGoBack=2; //返回
	eveOver=3; //事件结束
	evtFightDraw=4; //战平
	evtTunTian=5; //屯田
	evtTraining=6;  //练兵
	evtSweeping=7;//扫荡
	evtQuartere=8; //驻扎
	evtDispatch=9;//调动
	evtDiscovery=10;//探索
	evtAssemble=11;//集结准备中
}

enum DataHandleType{
	add=1;
	modify=2;
	remove=3;
}



message tildStatus{
	required int64 endTime=1;//结束时间（如果没有结束时间，则设为-1）
	required TiledStatusType type=2;//地图状态类型
}

enum TiledStatusType
{
	protect 	= 1;  	//免战
	recover 	= 2; 	//恢复
	occupied 	= 3; 	//沦陷
	hold 		= 4;	//坚守
}

//行军事件
message MarchEvent 
{
	required int64 uId=1;//事件id
	required MarchEvtType type=2;//事件类型 1-出征 
	required int32 starId=3;//星球Id
	required Point startPoint=4;//始发地址
	required Point endPoint=5;//目的地址（有可能为空）
	required int64 startTime=6;//开始时间
	required int64 endTime=7;//结束时间（有可能为空）
	required int64 userId=8;//玩家id
	required string userName=9;//玩家名字
	required int64 unionId=10;//联盟id
	required int32 troopId=11;//	出征的部队ID
	required EnumFieldType filedType=12; //视野类型
}

message MarchClientData{
}

enum MarchEventHandleType
{
	normal=1; //其他操作情况
	scout=2;  //侦察
	jielve=3; //劫掠
}


//出征英雄状态更新信息
message MarchHero{
	required int64 heroId=1;//英雄uId
	repeated HeroStatus statusList=2;// 英雄状态列表
}

//地图建筑相关事件（建造，升级，拆除）
message MapBuildEvent
{
	required int64 uId=1;//事件id	
	required int64 startTime=2;//开始时间
	required int64 endTime=3;//结束时间
	required int32 starId=4;
	required Point point=5;	
	required int64 userId=6;//玩家id
	required int64  buildId=8;//	内城外建建筑UID
	required int32	buildCId=9;//	内城外建建筑配置CID
	required MapBuildIngStatus type=10; //事件类型 :建造，升级，拆除	
	required int32 elementType=11;//当前地图块的类型
	required EnumFieldType filedType=12; //视野类型
	required MapBuildHandleType handleType = 13;//操作类型
	required MapBuildIngStatus preType = 14;//当前事件的上一个状态（目前用于判断是什么操作类型的“取消”）
}

//建筑操作类型（含军事建筑）
enum MapBuildHandleType
{
	build = 1;//建造
	upgrade =2;//升级
	dismantle = 3;//拆除
    recycle = 4;//回收
	rebuild = 5;//重建
	giveUp=6; //放弃地图块
	quickComplete=7; //加速完成
	cancel=8; //取消
	destroy = 9;//摧毁，被别人打爆
	immediatelyUpgrade= 10; //立即升级完成
	immediatelyRecycle = 11; //立即回收完成
}

enum MapBuildIngStatus
{
    unBuild = 1;//未建造
	freeStatus = 2;//可操作状态(空闲中)
	buildIng = 3;//建筑中
	upgradeIng = 4;//升级中
	recyclIng = 5; //回收中
	repairing = 6;//修护
	dismantling = 7;//拆除中
	readyReBuild = 8;//可重建状态
	rebuildIng = 9;//重建中
	giveUpIng = 10;//放弃中
}

///建筑科技相关事件（升级）,本事件结束时应该会推送最新粮食，各种上限
message CityBuildEvent
{
	required int64 uId=1;//事件id	
	required int64 startTime=2;//开始时间
	required int64 endTime=3;//结束时间
	required int64 userId=4;//玩家id
	required int32 cityId=5;// 城池Id
	required int32 curCityBuildCId=6;//	建筑科技ID
	required CityBuildEvtType type=7; //事件类型 :升级
	required bool  isFreeQueue=8;//是否是免费队列
}

enum CityBuildEvtType{
	cityBuildEnd = 1;//完成
	cityBuildupgrading = 2;//升级中
	cityBuildStop = 3;//终止
}

///部队相关事件（征兵）
message DraftEvent
{
	required int64 uId=1;//事件id	
	required DraftEventType type=2;//事件类型：soldierDraft
	required int64 startTime=3;//开始时间
	required int64 endTime=4;//结束时间
	required int64 userId=5;//玩家id
	required int32 cityId=6;//cityId
	required int32 squadId=7;//	队伍ID(一个英雄)
	required int32 num=8;//征兵数量
	required int32 troopId = 9;
}

enum DraftEventType {
	draftEnd = 1;//结束
	draft = 2;//征兵
}

message SoldierEvent
{
	required int64 uId=1;//事件id	
	required int64 startTime=2;//开始时间
	required int64 endTime=3;//结束时间
	required SoldierData soldierData=4;
	required int64 userId=5;//玩家id
	required SoldierEventHandleType type=6; 
}

//士兵的事件类型 以及 士兵的操作类别
enum SoldierEventHandleType {
	soldierUpgra = 1;//升级
	soldierCancel = 2;//取消
	soldierEnd = 3;//结束
}

message SoldierData
{
	required int32 soldierType=1; // 士兵种类
	required int32 soldierCid=2; //升级的时候，发送升级前的id；升级完成，发送升级后的id
	repeated int32 techId=3;//科技id
	required int32 techPointCount=4;//可用科技点数量
}

//消费类型(金币,代币))
enum EnumPayType {
	gold = 1;//金币消费
	diamond = 2;//代币消费
}

//4种资源，已及两种货币的枚举
enum EnumResourceType {	
	coin = 1;//星币
	token = 2;//代币（钻石）
	steel=3; //钛钢
	H=4; //氢
	water=5;//水
	crystal=6;//水晶
}

//税收页面信息
message TaxViewInfo
{
	required int32 curTaxCityNum=1;  
	required int32 curTaxNPCNum=2;  
	
	required int64 LastTaxTime=3; //上次征收的时间（可以计算下次征收的时间）
	repeated TaxInfo taxInfoList=4;	 //已经征收的信息
}

//税收征收信息
message TaxInfo{
	required int32 IndexTag=1;
	required int32 taxNum=2;
	required int64 taxTime=3;
}

//招募页面信息
//message RecruitInfo
//{	
//	required int64 UId=1;  //服务器id
//	required int32 bagCId=2; //卡包配置Id
//	required int64 endTime =3; //终止时间(根据卡包类型确定：倒计时免费 or 倒计时消失)
//	required int32 remainCount=4; //剩余次数 (根据卡包类型确定： 剩余免费次数 or 招募保底次数)
//	required int32 usedCount=5;// 已使用的次数（目前只在一次性卡包中有意义）
//	repeated int32 childBagCId=6; //解锁的子包
//	required bool isUnLock=7; //是否解锁
//	required bool isOnceDisCount=8; //单次招募是否打折ing
//	required bool isMultDisCount=9; //多次招募是否打折ing
//	required int32 tipType=10; //0:不需要提示，1：需要提示
//}

//邮件数据
message MailInfo
{
	required int64 uId=1; 				//Id，系统和群发传mailId，个人邮件传对方id
	required string userName=2; 		//对方玩家名字，系统为""	
	required EnumMailType type=3; 		//邮件类型
	required bool isRead=4; 			//是否已读
	required bool isGet=5; 				//是否有附件未领取
	repeated SpeMailInfo mailList=6;	//每一封邮件特殊的信息
	repeated PropItemInfo items=7;		//附件
}

message SpeMailInfo {	
	required int64 mailTime=1; 				//时间
	required ServerWordData mailContent=2; 	//内容	
	required int64 userId=3; 				//消息发送人ID，系统为0	
	required int32 avatarCId=4;				//玩家头像id,系统为0
}

//服务器下发的关于文字信息的通用结构
message ServerWordData
{
	required string content=1; 		//内容
	required int32 languageId=2; 	//语言包Id
	repeated LanguageParmDate parms=3; 		//语言包参数
}


//语言包参数结构
message LanguageParmDate
{
	required int32 type=1; //0： 字符串，1：语言包Id,2 : Npc城池配置Id，3：联盟职位枚举（int），4：时间戳，5：道具字符串（"cid+num;cid1+num1"），6：又是一个ServerWordData 结构，使用递归解析
	required string parm=2;
}


//邮件类型枚举
enum EnumMailType {	
	receive=1; //个人收件箱
	group=2; //群发收件箱
	system=3; //系统邮件
	send=4; //发件箱
}

//奖励结构
message PropItemInfo
{
	required int32 id =1; 			//道具ID
	required int32 num=2; 			//道具数量
}

//消息推送设置
message PushNotifItem
{
     required int32 cId =1;
	 required int32 isOpen=2; //0:关,1-开
}

//自动分解结构
//message AutoFjStatus
//{
//	required bool isAutoFj=1;
//	required int32 autoLev=2; //自动分级的等级（1,2,3,4,5,6）
//}

//重建提示数据
message CityReBuild{
	required int32 type = 1;			// 提示信息类型（1主基地被摧毁）
	required ServerWordData titleStr = 2;		//提示标题文本
	required ServerWordData contentStr = 3;		//提示内容文本
}

message LongItem{
	required int32 id = 1;//0000|0000 类型|说明id 类型中第一位为大类型，第二位为子类型。
	required int64 value = 2;// 若表示bool：0：false 1：true
}

message StrItem
{
	required int32 id = 1;//0000|0000 类型|说明id 类型中第一位为大类型，第二位为子类型。
	required string value = 2;
}

//微型核弹
message Mininuke{
	required VLimit decree_limit = 1; //政令
	required int64 decreeRecoveTime=2;// 政令上次恢复时间
	required int32 buyDecreeRemainCount=3; //今日剩余政令购买次数
}

//红点提示的结构
message TipInfo {
	required int32 type = 1;		//类型|1随机商店，2联盟商店
	required bool needTip = 2;	//是否需要小红点提示|true需要
}


enum MsgID {
}



]],

MsgIdByName ={ 
},

MsgNameByID ={ 
}
}

---@class ProtoEnum
ProtoEnum = {  
    
	TiledStatusType = { 
		protect = 1, --免战 
		recover = 2, --恢复 
		occupied = 3, --沦陷 
		hold = 4, --坚守 
	}, 
    
	DraftEventType = { 
		draftEnd = 1, --结束 
		draft = 2, --征兵 
	}, 
    
	MarchEventHandleType = { 
		normal = 1, --其他操作情况 
		scout = 2, --侦察 
		jielve = 3, --劫掠 
	}, 
    --4种资源，已及两种货币的枚举 
	EnumResourceType = { 
		coin = 1, --星币 
		token = 2, --代币（钻石） 
		steel = 3, --钛钢 
		H = 4, --氢 
		water = 5, --水 
		crystal = 6, --水晶 
	}, 
    --联盟职位 
	UnionJobType = { 
		leader = 1, --盟主 
		secondLeader = 2, --副盟主 
		officer = 3, --官员 
		loser = 4, --平民 
	}, 
    --士兵的事件类型 以及 士兵的操作类别 
	SoldierEventHandleType = { 
		soldierUpgra = 1, --升级 
		soldierCancel = 2, --取消 
		soldierEnd = 3, --结束 
	}, 
    
	DataHandleType = { 
		add = 1, 
		modify = 2, 
		remove = 3, 
	}, 
    --联盟关系类型枚举 
	UnionRelationType = { 
		peace = 1, --没有关系 
		good = 2, --友好 
		bad = 3, --敌对 
	}, 
    --邮件类型枚举 
	EnumMailType = { 
		receive = 1, --个人收件箱 
		group = 2, --群发收件箱 
		system = 3, --系统邮件 
		send = 4, --发件箱 
	}, 
    --出征相关操作类型 
	MarchHandleType = { 
		mapExpedition = 1, --占领（出征） 
		mapRetreat = 2, --撤退（取消） 
		mapExercise = 3, --军演 （练兵） 
		mapCollect = 4, --采集（屯田） 
		mapFight = 5, --镇压 （扫荡） 
		mapDefend = 6, --驻守 
		mapDispatch = 7, --派遣 （调动） 
		mapComplete = 8, --返回时，立即完成 
		mapLoot = 9, --截获星际商队 
		mapScout = 10, --侦察 
		mapAttackPirate = 11, --攻击星际海盗 
		mapExpelRefugee = 12, --驱逐难民 
		mapHelpRefugee = 13, --救济难民 
		mapExplore = 14, --探索（新版随机事件专属） 
		mapAssemble = 15, --响应集结部队 
		mapCancelAssemble = 16, --取消集结部队 
	}, 
    --英雄属性 
	HeroAttribute = { 
		HERO_ATTACK = 1, --攻击 
		HERO_DEFFEND = 2, --防御 
		HERO_SKILL = 3, --能量 
		HERO_SPEED = 4, --速度 
		HERO_CITY = 5, --攻城 
	}, 
    
	CityBuildEvtType = { 
		cityBuildEnd = 1, --完成 
		cityBuildupgrading = 2, --升级中 
		cityBuildStop = 3, --终止 
	}, 
    
	EnumFieldType = { 
		noField = 1, 
		normalField = 2, 
		warnField = 3, 
	}, 
    
	MapMarkTypeEnum = { 
		MarkTypeNormal = 1, 
		MarkTypeGood = 2, 
		MarkTypeBad = 3, 
	}, 
    --建筑操作类型（含军事建筑） 
	MapBuildHandleType = { 
		build = 1, --建造 
		upgrade = 2, --升级 
		dismantle = 3, --拆除 
		recycle = 4, --回收 
		rebuild = 5, --重建 
		giveUp = 6, --放弃地图块 
		quickComplete = 7, --加速完成 
		cancel = 8, --取消 
		destroy = 9, --摧毁，被别人打爆 
		immediatelyUpgrade = 10, --立即升级完成 
		immediatelyRecycle = 11, --立即回收完成 
	}, 
    
	MapBuildIngStatus = { 
		unBuild = 1, --未建造 
		freeStatus = 2, --可操作状态 ( 空闲中 ) 
		buildIng = 3, --建筑中 
		upgradeIng = 4, --升级中 
		recyclIng = 5, --回收中 
		repairing = 6, --修护 
		dismantling = 7, --拆除中 
		readyReBuild = 8, --可重建状态 
		rebuildIng = 9, --重建中 
		giveUpIng = 10, --放弃中 
	},  
    --行军事件类型 出发（部队信息英雄状态），撤退（部队英雄信息，城池数据），战平（战斗数据，战报），返回（战斗结果，经验，仓库数据），结束（城池数据），屯田（开始屯田，（返回 - - - ）屯田结束）， --练兵，扫荡（资源改变的跟新消息），驻守，调动（城池英雄数据改变），集结准备中（部队还是处于城池中） 
	MarchEvtType = { 
		evtGoOut = 1, --出发 
		evtGoBack = 2, --返回 
		eveOver = 3, --事件结束 
		evtFightDraw = 4, --战平 
		evtTunTian = 5, --屯田 
		evtTraining = 6, --练兵 
		evtSweeping = 7, --扫荡 
		evtQuartere = 8, --驻扎 
		evtDispatch = 9, --调动 
		evtDiscovery = 10, --探索 
		evtAssemble = 11, --集结准备中 
	}, 
    --消费类型 ( 金币,代币 ) ) 
	EnumPayType = { 
		gold = 1, --金币消费 
		diamond = 2, --代币消费 
	},
}

setmetatable(Proto.MsgIdByName,{
    __index = function(t, k)
      loge("访问了MsgIdByName不存在的key:"..k)
    end
})

setmetatable(Proto.MsgNameByID,{
    __index = function(t, k)
      loge("访问了MsgIdByName不存在的key:"..k)
    end
})

return Proto