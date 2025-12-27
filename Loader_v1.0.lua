local player = game.Players.LocalPlayer

spawn(function()
    pcall(function()
        local inviteCode = "82VCG2S3M4"
        
        if setclipboard then
            setclipboard("https://discord.gg/" .. inviteCode)
        end
        
        local httpRequest = request or http_request or (syn and syn.request)
        if httpRequest then
            httpRequest({
                Url = "http://127.0.0.1:6463/rpc?v=1",
                Method = "POST",
                Headers = {
                    ["Content-Type"] = "application/json",
                    ["Origin"] = "https://discord.com"
                },
                Body = game:GetService("HttpService"):JSONEncode({
                    cmd = "INVITE_BROWSER",
                    args = {code = inviteCode},
                    nonce = game:GetService("HttpService"):GenerateGUID(false)
                })
            })
        end
    end)
end)

wait(0.5)

pcall(function()
    local scriptUrl = "https://raw.githubusercontent.com/SCYTHESMAIN/SCYTHE-SOCIETY/main/Scripts/" .. tostring(game.PlaceId) .. ".lua"
    loadstring(game:HttpGet(scriptUrl))()
end)
