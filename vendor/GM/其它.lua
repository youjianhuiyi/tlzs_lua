local strSceneName = GetActiveSceneName() --��ǰ��ͼ��

local nSceneID = GetSceneID() --��ǰ��ͼID

local nHpp = GetHPPercent() --��ǰѪ�ٷֱ�

local nMpp = GetMPPercent() --��ǰ���ٷֱ�

local strSceneName = GetSceneNameByID(1) --�õ�ͼidȡ��ͼ��

local nLeader = IsLeader() --�Ƿ�ӳ� �Ƿ���1�����Ƿ���0

local nFollow = IsFollow() --�Ƿ����  ��1 ����0

--��ȡ״̬������û�з���-1
local nIndex = Player_GetBuff("���")

local bQx = Player_DispelBuffByName("���") --ȡ��ĳ��״̬��ģ��״̬����

local nState = Player_GetMountID() --����id û�����ﷵ��-1

Player_TeamFollow(false) --ȡ����Ӹ���
Player_TeamFollow(true) --��Ӹ���


--������ -1:ȫ����0:��������� 1:��������� 2:�������Ʒ
DelBagItem(0)

--���
PickUpLua()

--������
UseMount()
--������
Dismount()
--�Ի�npc
TalkNpc("NPC����")

--������Χ���ж�������,����������
--id,name ,class ,title,x ,y ,dst ,hp ,guid ,owner ,menpai ,petzrid ,state ,zwType,level ,target ,model ,bhid ,inteam ,leader
--id,���ƣ����ͣ��ƺţ�x���꣬y���꣬���룬Ѫ��GUID,����ӵ����id�����ɣ�����ӵ����id,״̬���������ͣ��ȼ���Ŀ��id,ģ��id�����id,�Ƿ��ڶ��飬�Ƿ�ӳ�
local tObj = Enum2XAllObj()

--�������͡� ����2�����δ��� {NPC,�����ң����ޣ�����} 0�ų���1������
tObj = ObjFilterByClass(tObj, {0, 0, 1, 0, 0})

--�������� ͨ���ı�����(class�ֶ�ֵ)
tObj = ObjFilterByszClass(tObj, "��� ����")

--���˰��id,���ذ��idΪ23��56�Ķ���
tObj = ObjFilterByBHID(tObj, " 23 56 ")

--���� ���̰׹֣����"���̰�"
tObj = ObjFilterByColor(tObj, "����")

--���˾��� ,����С�ڵ���15���뷶Χ��
tObj = ObjFilterByDst(tObj, 15)

--����Ѫֵ�ٷֱȣ�����2���ٷֱȣ�����3��1���ش��ڰٷֱȵģ�2����С�ڵ��ڰٷֱȵ�
tObj = ObjFilterByHP(tObj, 80, 1)

--���˵ȼ�������2���ȼ�������3����1����С�ڵ��ڵȼ��ģ�2���ش��ڵȼ���
tObj = ObjFilterByLevel(tObj, 89, 1)

--�������֣�name�ֶ� ����3��0-5�ֲ���ģʽ
--0������ȫ�Ͳ���2һ�� nameΪ"����"����
--1���ڲ���2��ӵ�м��ɣ�name="��" �� name="��"  �� name="����" ����
--2��ͬ1������ȡ��.�ڲ���2��ӵ�����ų���name="��" �� name="��"  �� name="����" �򲻱�������
--3��������Ʋ��ң�����2ǰ�����ո� ���� ����2= " ����1 ����2 ����3 "��
--4��ͬ3������ȡ��
--5����name�ֲ��Ҳ���2�ִ���(1-4���ǴӲ���2����name�ִ�)
tObj = ObjFilterByName(tObj, "����", 0)

--����id �ų�����2��id
tObj = ObjFilterByTID(tObj, {id = 1, id = 123})

--���˳ƺţ�����3 0-3
--0��ͬ ObjFilterByName  0
--1��ͬ ObjFilterByName  1
--2��ͬ ObjFilterByName  5
--3��ͬ ObjFilterByName  3
tObj = ObjFilterByTitle(tObj, "����Զɽ����˺�", 0)

--���������򣬴�С�����޷���ֵ��ֱ�Ӹı�tObj
BubbleByDst(tObj, 1)
--��Ѫ���򣬴�С�����޷���ֵ��ֱ�Ӹı�tObj
BubbleByHP(tObj, 1)
--���ȼ����򣬴Ӵ�С���޷���ֵ��ֱ�Ӹı�tObj
BubbleByLevel(tObj, 2)

--�����ǶԳ��õ�һЩ��װ
--����ָ������Ŀ¼
--����2 {Ѫ�ٷֱȣ�����} Ѫ0���˵������ģ�����0���ǲ��жϾ���
--����3 ���� 0������ 1����������2�����뽵�� 3��Ѫֵ����4��Ѫ����
local tAll = Enum2XByClass("NPC ����", {0, 0}, 0)
--����Ѫ����80������С��15�� ���
local tAll = Enum2XByClass("���", {80, 15}, 0)

--����ָ�������ƵĶ���
--����2�����͹��� 1.npc 2.���� 3.��� 4.���� 5.���� {1,1,1,1,1},{1,1,0,0,0}
--����3������Ѫ ���� {0,0}
--����4��0.������ 1.�Ƚ���Զ 2.��Զ�����3��Ѫ�ٺ�Ѫ�࣬4��Ѫ���Ѫ��
--����5��ƥ��ģʽ ����ObjFilterByName����3
local tObj = Enum2XByName("�����۵�����", {1, 1, 0, 0}, nil, nil, 0)

--����2�����͹��� 1.npc 2.���� 3.��� 4.���� 5.���� {1,1,1,1,1},{1,1,0,0,0}
--����3������Ѫ ���� {0,0}
--����4��0.������ 1.�Ƚ���Զ 2.��Զ�����3��Ѫ�ٺ�Ѫ�࣬4��Ѫ���Ѫ��
--����5��ƥ��ģʽ ����ObjFilterByTitle����3
local tObj = Enum2XByTitle("ս���ܹ�", {1, 0, 0, 0}, nil, 0, 0)

--�����ֿ�������Ʒ��������Ʒ����
--,obj ,name ,class ,id ,level,index ,menpai ,xing ,count ,bind ,lock
local tObj = Bank:EnumAllObj()

--�ֿ�ȡǮ������2�ɿ�
Bank_GetMoney(10000, "����")

--�ֿ�ȡ��Ʒ,���ֲ����ɿ�
--����1����ȡ������Ʒ���� ���ո�ֿ�
--����2��ȡ��������
--����3����ȡ���İ�״̬ 0����ν 1����� 2�󶨵�
--����4�������� true �� false
--����5����ȡ��������״̬ 0����ν 1����� 2�󶨵�
Bank_GetItem(" Ը��Ȫ �ʻ������� ���� ", -1)

--��ȡ�ֿ���ʣ��ո���
local nSpace = Bank_GetSpaceNum()

--�ֿ����Ʒ
-- ����2���Ƿ��Ǯ
-- ����3����ȡ���İ�״̬
Bank_SaveItem(" �������� �����ָ ���񻤷� ������ ", false, 1)

--�ֿ��Ǯ
Bank_SaveMoney(5000)


