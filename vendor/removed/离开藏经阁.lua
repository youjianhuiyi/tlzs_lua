--城市 - 苏州
--城市 - 大理
--城市 - 洛阳

--并不是用于一般的藏经阁副本，而是有时上线后角色在藏经阁
while GetSceneID() == 171 do
    RunTo(31, 40, 3, 5000)
    TalkNpc("无名老僧")
    Sleep(500)
    QuestFrameOptionClicked_Item("城市 - 大理", 1)
    PushDebugMessage("离开藏经阁中...")
end
