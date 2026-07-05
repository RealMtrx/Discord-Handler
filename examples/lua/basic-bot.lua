local discordia = require('discordia')
local client = discordia.Client()

-- Load .env manually
local env = {}
local file = io.open('.env', 'r')
if file then
  for line in file:lines() do
    local key, val = line:match('^([^=]+)=(.*)$')
    if key then env[key] = val end
  end
  file:close()
end

local token = env.TOKEN
local prefix = env.PREFIX or '!'

client:on('ready', function()
  print('Logged in as ' .. client.user.username)

  -- Register slash command via REST API
  local https = require('ssl.https')
  local ltn12 = require('ltn12')
  local json = require('dkjson')

  local payload = json.encode({ name = 'ping', description = 'Replies with Pong!' })
  local url = 'https://discord.com/api/v10/applications/' .. client.application.id .. '/commands'

  local resp = {}
  https.request({
    url = url,
    method = 'POST',
    headers = {
      ['Content-Type'] = 'application/json',
      ['Authorization'] = 'Bot ' .. token,
      ['Content-Length'] = #payload,
    },
    source = ltn12.source.string(payload),
    sink = ltn12.sink.table(resp),
  })
  print('Slash command registered')
end)

client:on('interactionCreate', function(interaction)
  if interaction.type == 2 and interaction.data.name == 'ping' then
    interaction:reply({ content = 'Pong!' })
  end
end)

client:on('messageCreate', function(msg)
  if msg.author.bot then return end

  local content = msg.content
  if content:find(prefix, 1, true) ~= 1 then return end

  local args = {}
  for word in content:sub(#prefix + 1):gmatch('%S+') do
    table.insert(args, word)
  end

  if #args > 0 and args[1] == 'ping' then
    msg:reply('Pong!')
  end
end)

client:run('Bot ' .. token)
