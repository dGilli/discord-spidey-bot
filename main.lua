require("socket")
local https = require("ssl.https")
local ltn12 = require("ltn12")
local res, code, headers, status = https.request {
    url = string.format("%s/%s/%s",
        "https://discord.com/api/webhooks",
        os.getenv("DISCORD_WEBHOOK_ID"),
        os.getenv("DISCORD_WEBHOOK_TOKEN")
    ),
    method = "POST",
    headers = {
        ["Content-Type"] = "application/json",
    },
    source = ltn12.source.string('{"content": "Foobar is my name!"}'),
    sink = ltn12.sink.table({})
}
print(status)

