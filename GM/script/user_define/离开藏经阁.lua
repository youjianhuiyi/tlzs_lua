--���� - ����
--���� - ����
--���� - ����

--����������һ��Ĳؾ��󸱱���������ʱ���ߺ��ɫ�ڲؾ���
while GetSceneID() == 171 do
    RunTo(31, 40, 3, 5000)
    TalkNpc("������ɮ")
    Sleep(500)
    QuestFrameOptionClicked_Item("���� - ����", 1)
    PushDebugMessage("�뿪�ؾ�����...")
end
