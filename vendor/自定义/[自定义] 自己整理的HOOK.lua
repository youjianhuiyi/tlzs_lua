--���ļ���������ִ�е�,���Լ��༭�ű�ʱ�õ���һЩ�ӿ�˵����
--�Լ�Ҫ�༭�µĽű�ʱ,�½�һ���ı��ĵ�(.txt) �ļ�,�༭���׺������Ϊ .lua 
--����±༭����˽ű�,Ҫ�ڿ���̨���¼���һ�β���ˢ�¿�����


--���������ִ�Сд,��Ҫ���,���Ŷ���Ӣ��״̬�µ�����,��Ҫ�������
--�������������󹫿�,����Ҫʲô���Ľӿ�����ϵ�ͷ�����
--�ٷ������в��ֿ�Դ�Ľű��ļ�����Ҳο�����Ҫ����ϵ�ͷ�����

--���̻���

--����һ���̻�ID(֧�ֶ���̻�,�ո�ֿ������ȴ���ڿ�ǰ��)
--�����������뿪�Ź�̨��Ʒ����Ʒ֮���Կո�ֿ��������ֺ�����̻�,��Ʒ�������|���������֧�ֲ�������ͳ�ƣ����б�ʯ ��Ůװ��  ����װ�� (����װ��ֻ��75��1�ǵ�)
--��������������ȹ�̨��Ʒ��ͬ��
--������:�Ƿ�Ӳֿ�ȡ����Ʒ������̻ᡣ��true��ֿ�ȡ������false��ȡ.
--ʾ��
SHCW_OnStart("101 202", " ��Ʒ1|1  ����װ�� ��Ʒ3|2 ", "", true)        --���̻���ʾ��1�� �Ӳֿ�ȡ��ֻ���뿪�Ź�̨
SHCW_OnStart("232", "", " ������Ʒһ ������Ʒ�� ", false)               --���̻���ʾ��2�� ���Ӳֿ�ȡ��ֻ������ȹ�̨
SHCW_OnStart("135 256 358", " ����һ ���Ŷ� ", " ����һ ���ȶ� ", true) --���̻���ʾ��3�� �Ӳֿ�ȡ�����뿪�źʹ��ȹ�̨

--����ȡ����
--local nIndex, idMission, idScript = GetPlayerMission_Item("��������������") --���������
local nIndex, idMission, idScript = GetPlayerMission_Item("#{XSHYH_150211_2}") --������������ħ ����

if nIndex ~= -1 then --nIndex�����,-1��ʾû�нӴ�����
    QuestFrameMissionAbnegate(idScript) --����������
end

--��NPC�Ի��������,����ȡ����,��������ƷID�����Բ��
QuestFrameMissionComplete(idItem)

--[[  

--��ַ�ʽ1������2ģʽĿǰ��Чֵ -1,0,1,2,3,4,5 �� ���������պ�˵
AI_Start(����id,ģʽ)
    

--��ַ�ʽ2���÷�ʽ��������һЩ����

--��һ�������ʼ��,����һЩĬ�ϲ���
DG_OnInit()  
--���µĲ����������������ã���ʵ�����Ѿ���Ĭ��ֵ�������ظ�����
--��ѡһ
DG_SetParam("��ַ�ʽ", "�Ⱥ����")
DG_SetParam("��ַ�ʽ", "���̺��")
DG_SetParam("��ַ�ʽ", "�Ƚ���Զ")
--��ѡһ
DG_SetParam("����ģʽ", "�����̹�")
DG_SetParam("����ģʽ", "���޵�ˢ")
--��ѡһ
DG_SetParam("Ŀ��","����")
DG_SetParam("Ŀ��","���","Ľ�ݲ� ��Զɽ")
--Ŀ������  1��ֻ��ָ�����ƵĹ������2��ֻ��ָ����������Ĺ���
DG_SetParam("Ŀ������", 1)
--�Ƿ�ѡ��Ҫ������Ŀ��
DG_SetParam("�Ƿ�ѡ�й�", true) --false
--��������ɫ�Ĺ��� ������� �����
DG_SetParam("�������", "�����")
DG_SetParam("�������", "����")
--������Χ
DG_SetParam("��ַ�Χ", 5)
--���긳ֵ��ʽֻ����2ѡ1
DG_SetParam("����", "��ֵ", { { x = 135, y = 183 }, { x = 125, y = 180 }})
DG_SetParam("����", "���", 12, 34);DG_SetParam("����", "���", 56, 78)
--���ô�ֵ�ͼ��Ĭ��-1
DG_SetParam("��ͼ", sceneID)
--�Ƿ��֣���������
DG_SetParam("�Ƿ񹥻�", true) --false
--usehorse:ʹ�����usepet:ʹ������ dxys:��Ѫ����
DG_SetParam("��������", { usehorse = false, usepet = true, dxys = false })


--DG_OnAction()��ʼ��֣���һ������������Ϊ�գ��ò�����һ���ص�������Ϊ��ֹѰ·������ѭ��,����ԭ�ͣ�
function callback(x,y,scene)
    if GetActiveSceneName() ~= "ˮ��" then 
        --����Ѱ·
        return false
    end
    return true
end
DG_OnAction(callback)
--��ַ�ʽ2˵������





--������ -1:ȫ����0:��������� 1:��������� 2:�������Ʒ
DelBagItem(0)

--�򿪵����
CallFun(2,id)
--�Ի�npc
CallFun(3,id)
--ѡ��
CallFun(4,id)
--���ٱ���ָ��λ����Ʒ idx:0-59
CallFun(5,idx)
--�Ṧ
CallFun(6,x,y)


bUse = UseSkill("���Ĺ���", -1)
UsePetSkill("����ѩ��")
UsePetSkill2("�߼�����")


--���
    PickUp()


--�̻�����Ʒ
ShangH_BuyItem("��Ʒ����", ����, ��߼�Ǯ,����ƥ��ģʽ)
    ����ƥ��ģʽ  0�Ǿ�ȷƥ��
                 1ģ��ƥ�䣬����Ҫ�������ɫ�Ķ�λ�� ��1�Ϳ���

--ʹ�ñ�����Ʒ
UseItem(����1��"����2")
����1������ Ŀǰ���� 0��1��2��8��10(��ͬ�����ִ���ʵ�ַ�����ͬ������ʹ�ø���ʵ����Ʒ)
����2�ı��� ����Ʒ������ 

--GetLuaValue() ����Ǹ����ܽӿڣ���ʵ�ֺܶ๦�ܣ������õĻ����ע�������ű�.lua���м�����
local ����ֵ1,����ֵ2,����ֵn = GetLuaValue("��Ϸ��lua�ִ�","����ֵ����",����ֵ����)    
    ���� "s"  �ı���
    ���� "n"  ������
    "sns" ��ʾ3������ֵ����һ���ı��ͣ��ڶ��������ͣ��������ı��͡���Ӧ����ֵ������3

--���ٱ����̵깺����Ʒ�������1����ʼ��Ʒλ�ã����Լ��Ķ�
GetLuaValue("setmetatable(_G, {__index=BangHui_Shop_Env});BangHui_Shop_GoodButton_Clicked(1);","",0);

--����ս���̵깺����Ʒ�������0����ʼ��Ʒλ�ã����Լ��Ķ�
GetLuaValue("setmetatable(_G, {__index=JueweiShop_Env});JueweiShop_BuyItem(0);","",0);

local �����ҵ�����ID = GetLuaValue("return Player:GetData('MEMPAI');", "n", 1)
    id=0������     id=1������     id=2��ؤ�� 

local �����ı����� = GetMenpaiName(������ID)

local ��ǰ��ͼ�� = GetActiveSceneName()

local ��ǰ��ͼID = GetSceneID()

--ȡ�������
local x����,y���� = Player_GetPos()

--ȡ�����Ϣ
local ����ֵ = GetPlayerInfo("����")
    ���� "NAME"       �����������
    ���� "LEVEL"      ������ҵȼ�
    ���� "GUID"       �������GUID
    ���� "OtherName"  ���ر��������������
    ���� "FPGUID"     ���س�ս������GUID

local ��� = GetMoney(1)
local ���� = GetMoney(2)

local ��ǰѪ�ٷֱ� =  GetHPPercent()

local ��ǰ���ٷֱ� = GetMPPercent()

local ��ǰѪ =  GetCurrentHP()

local ��ǰ�� = GetCurrentMP()

local ��ǰɱ��ֵ = Player_GetPK()

--����Ա��״̬
GiveTeamState("�������")

--������Ѫ
LuoYangRestore(�ٷֱ�) 

--�õ�ͼidȡ��ͼ��
local ��ͼ��= GetSceneNameByID(��ͼID)

--��������� 
CityToGuild()

--�뿪�����в��� 0��1��2��3
GuildToCity(1)

--�ӳ�����1����Ա����0
local �Ƿ�ӳ� = IsLeader()

--û�����ﷵ��-1
local ����״̬ = Player_GetMountID()

--�Ի�npc  
TalkNpc("NPC����")

--�Ի��� ���ѡ�� 0��ģ��ƥ�䣬1�Ǿ�ȷƥ��
QuestFrameOptionClicked("ѡ������",��0��1)

--�Ի��� �������
QuestFrameAcceptClicked()

--�Ի��� �������
QuestFrameNextClicked()

--�Ի��� ������
QuestFrameMissionComplete()

--����ȷ�� ��ͼѰ·ȷ����������Ʒȷ����...
MessageBox_Self_OK_Clicked()

--ȡ����ɫ��״̬
Player_DispelBuffByName("buff״̬����")


��ͼѰ·("������",159,123)

������()

ʹ����Ʒ("��Ʒ��")

�ȴ�(���ʱ��)             ���� �ȴ�(1000) //�ȴ�1��
    ����1  ������           //����1�ĵ�λ�Ǻ���,�����롣1000���� = 1��
    ����ֵ ��

�ȴ���ָ��ʱ��(ʱ���ı�)    ���� �ȴ���ָ��ʱ��("20:05") //һֱ�ȵ�����8��05�� ������Ӣ��״̬��ð�ţ�
    ����1  �ı���           //�ı��Ͳ�����Ҫ��Ӣ������
    ����ֵ ��

�ȴ���������(����,��������) ���� �ȴ���������(4,"75++ ¥����������,��4�˾ͽ���")
    ����1  ������           //��Ҫ�ȴ��Ķ�������
    ����2  �ı���(�ɿ�)     //��������
    ����ֵ ��

ִ�нű�(�ű���)           ���� ִ�нű�("ʦ������")
    ����1  �ı���             
    ����ֵ ��

��Ӹ���()
    ����1  ��
    ����ֵ ��

ȡ������()
    ����1  ��
    ����ֵ ��

������Ļ�ı�(�ı�����)     //������1���뵽��Ϸ��Ļ       
    ����1  �ı���             
    ����ֵ ��


���ֱ���()

��˸����()

















]]--






















--���õķ��ţ�
--  ע�ͷ���ע�;�������������,���ᱻִ�� ������ע��(2������) ��--
--  ����ע�� ������
--[[
  
  ����Ͳ��ᱻִ��

]]--


--�ֿ�������Ʒ
local Obj = Bank:EnumAllObj()  

--������һ���NPC
local Obj = Enum2XAllObj()
for i = 1, 10 do
    -- id name class title x y dst hp guid menpai state level target
    MessageBox(Obj[i].name);Sleep(200)
    MessageBox(Obj[i].class);Sleep(200)
MessageBox(Obj[i].title);Sleep(200)
MessageBox(Obj[i].x);Sleep(200)
MessageBox(Obj[i].y);Sleep(200)
MessageBox(Obj[i].dst);Sleep(200)
MessageBox(Obj[i].hp);Sleep(200)
MessageBox(Obj[i].guid);Sleep(200)
MessageBox(Obj[i].menpai);Sleep(200)
MessageBox(Obj[i].state);Sleep(200)
MessageBox(Obj[i].level);Sleep(200)
MessageBox(Obj[i].target);Sleep(200)
end

--������Ʒ
local Obj = Bag:EnumAllObj()  
for i = 1, #Obj do 
    --name id count bind lock menpai level xing index
   MessageBox(Obj[i].name);Sleep(200)
MessageBox(Obj[i].id);Sleep(200)
MessageBox(Obj[i].count);Sleep(200)
MessageBox(Obj[i].bind);Sleep(200)
MessageBox(Obj[i].lock);Sleep(200)
MessageBox(Obj[i].menpai);Sleep(200)
MessageBox(Obj[i].level);Sleep(200)
MessageBox(Obj[i].xing);Sleep(200)
end
bind �Ƿ�� 
lock �Ƿ�����
menpai ��������Ʒ���ͷ���



e_IsFollow
PK_Action
Shop_GetNum
LAI_Run
EnumEnvObject
EnumYuanBao
EnumStallList
EnumOtherObj
EnumPosList
EnumOtherList
EnumSHPetList
EnumSHList
EnumTeamInfo
Get_XParam_INT
Get_XParam_Str
Player_UseSkill
TalkNpcEx
AutoRunToTarget
FindTarget
QuestFrameOptionClickedEx
ShortcutMove
e_Player_GetMountID
Player_TeamFollow

--�ȴ�ָ���Ķ�������������ʾ����
Show_Window(strWindowName)
--����Ի�����ֵ������ѡ�����ͺ��ı�����(�����ǲ����������)
GetNPCEventList_Item(index)
--ͬ��,���ݾ�������
GetNPCEventList_Text(index)
--����indexȡ������״̬���������ͨ���ⷽ���������
Player_DispelBuffByIndex(index)
--���Ҿ���ָ�����Ƶ�����
GetPetIndexbyName(petName)
--��ȡ�̵���Ʒ����
GetBoothList_Num()

--Ⱥ����İ���
��ͼѰ·("����",334,224)
TalkNpc("��ï")
Sleep(3000)
local Scene = GetSceneID()
if Scene ~= 2 then
	a = 1
	repeat
	TalkNpc("��ï")
	TalkNpc("����")
	TalkNpc("�޷��")
	QuestFrameOptionClicked("���� - ����",1)
	local SceneR = GetSceneID()
	PushDebugMessage("#e6f00c7#gff99cc".."���Ҽ���ר�ã�"..a.."  ".."")
	a = a + 1
until(SceneR == 2)
	PushDebugMessage("�������")
else
	PushDebugMessage("�����ˣ�")
end



---Ⱥ����İ���1
--Ƶ����"����"�� ����("����","����""���""����""���""�Ŷ�""ս��""����")
function ��������(strPD, strText)
    local pdName
    if strPD == "����" then
	   pdName = "near"
    elseif strPD == "����" then   
	   pdName = "scene"	   
    elseif strPD == "����" then   
	   pdName = "team"
    elseif strPD == "����" then   
	   pdName = "menpai"
    elseif strPD == "���" then 
	   pdName = "guild"	
	elseif strPD == "ͬ��" then 
	   pdName = "guild_league"	
    elseif strPD == "�Ŷ�" then   
	   pdName = "raid"
    elseif strPD == "ս��" then   
	   pdName = "alliance"
    elseif strPD == "����" then   
	   pdName = "zhengyou"
    else
       pdName = "near"	
    end
	
	GetLuaValue(string.format("Talk : SendChatMessage('%s', '%s')", pdName, strText),"",0)
  
end

--�����i�੦<yuan546188287@126.com>  16:45:03
function ����ٱ�����Ʒ(itemName)
	local nCallNum = GetLuaValue("return City:GetGuildShopInfo(0,'total')","n",1)
	for i = 0 ,nCallNum-1 do
		local nIndex, ����, strName, nPrice, itemID = GetLuaValue(string.format([[
		setmetatable(_G, {__index = BangHui_Shop_Env})
		local nIndex = %d
		local num = City:GetGuildShopInfo(nIndex, "MaxNumber")
		local theAction = City:EnumGuildShop(nIndex);	
		local itemID = theAction:GetID()
		if itemID ~= 0 then
			return nIndex, num,theAction:GetName()
		else
			return -1,-1,""
		end
		]], i), "nns",3)
		if strName == itemName then
			GetLuaValue(string.format("City:DoGuildShopBuy(%d,%d);",nIndex,����));Sleep(300)
			return true
		end	
	end
	return false
end

--0(76038898)  23:02:23
function �̻Ṻ��(name)
	TalkNpc("�Ǹ�ʢ");
	�ȴ�(1000);
	QuestFrameOptionClicked("�鿴�����̵�",1)
	�ȴ�(2000);
	GetLuaValue(string.format("setmetatable(_G, {__index = PS_ShopList_Env});PS_ShopList_ChangeTabIndex(3);"));
	�ȴ�(1000);
	GetLuaValue(string.format("setmetatable(_G, {__index = PS_ShopSearch_Env});PS_ShopSearch_ItemMode:SetCurrentSelect(2);PS_ShopSearch_ItemMode_Changed();"));
	�ȴ�(2000);	
	GetLuaValue(string.format("setmetatable(_G, {__index = PS_ShopSearch_Env});PS_ShopSearch_ItemName:SetText(\"%s\");PS_ShopSearch_Clicked();",name));
	�ȴ�(2000);	
	GetLuaValue("setmetatable(_G, {__index = PS_ShopSearch_Env});PlayerShop:SearchPageBuyItem(0, \"item\")");
	�ȴ�(1000);
	return true;
end					

�̻Ṻ��("��ɫ��λ��")


--�����i�੦<yuan546188287@126.com>  15:27:12
function �����鶨λ()    
	local bHave, nNum, nIndex = FindBagItem(-1, "������") 
	if bHave then	
		GetLuaValue(string.format([[
			Clear_XSCRIPT();
				Set_XSCRIPT_Function_Name("SetPosition");
				Set_XSCRIPT_ScriptID(330001);
				Set_XSCRIPT_Parameter(0, %d);
				Set_XSCRIPT_ParamCount(1);
			Send_XSCRIPT();	
		]], nIndex))		
    end
		
end
function ȥ�����鶨λ(��ͼ,����x,����y)
	while true do
	local bHave, nNum, nIndex = FindBagItem(-1, "������")
		if bHave then
			��ͼѰ·(��ͼ,����x,����y)--ĳ����ʹ�ò���λ
			�����鶨λ()
			��ͼѰ·("����",160,148)--��λ֮��ȥһ������xy�ȴ�
			return true
		else
			Bank_GetItem(" ������ ", 1,0)
		end		
	end
end

--��ȡ����ʣ��ո������
local spaceNum, maxNum, nIndex  = GetPacketSpaceNum(0) --0����1����