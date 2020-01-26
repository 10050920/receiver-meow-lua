return {--!addadmin
check = function (data)
    return (data.msg:find("！ *addadmin *.+") == 1 or data.msg:find("! *addadmin *.+") == 1) and
    data.qq == Utils.setting.AdminQQ
end,
run = function (data,sendMessage)
    local keyWord = data.msg:match("(%d+)")
    if keyWord and XmlApi.Get("adminList",keyWord) == "admin" then
        sendMessage(Utils.CQCode_At(data.qq).."\r\n"..keyWord.."已经是狗管理了")
    else
        XmlApi.Set("adminList",keyWord,"admin")
        sendMessage(Utils.CQCode_At(data.qq).."\r\n已添加狗管理"..keyWord)
    end
    return true
end,
}
