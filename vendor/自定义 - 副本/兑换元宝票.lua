PushDebugMessage("���Ա༭�޸ı���������")

-- Ҫ���������һ���Ԫ��Ʊ��Ԫ������ ======������Ҫ����======
local BaoLiu = 10



local nTick = 0
while true do

    -- ��ȡ��ǰԪ������
    local yuanbao = Player:GetDataInt('YUANBAO')

    -- Ԫ�������˳��һ�
    if yuanbao <= BaoLiu then break end
    
    --ǰ��Ǯׯ
    MoveToNPC(65, 42, 224, "�����"); Sleep(600)
    -- ��ȡ��ʼ�һ�ʱ��
    if nTick == 0 then nTick = GetTickCount() end

    -- ����30���˳��һ�
    if nTick ~= 0 and GetTickCount() - nTick > 30 * 1000 then break end

    -- ������Ҫ�һ�������
    local nNeed = yuanbao - BaoLiu

    -- ÿ�ζһ�������50000Ԫ��
    if nNeed > 50000 then nNeed = 50000 end
    if nNeed <= 0 then break end

    -- ��ʼ�һ�
    Player:YB2Ticket(nNeed)

    Sleep(1000)

end




PushDebugMessage("�һ�������")

-- ��Ԫ���һ���Ԫ��Ʊ FQ_101210_27