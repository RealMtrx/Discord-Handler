require 'discordrb'
require 'dotenv'

Dotenv.load
token = ENV['TOKEN']
prefix = ENV['PREFIX'] || '!'

bot = Discordrb::Bot.new(token: token, intents: :all)

bot.ready do |event|
  puts "Logged in as #{bot.profile.username}"

  bot.register_application_command(:ping, 'Replies with Pong!')
  puts 'Slash command registered'
end

bot.application_command(:ping) do |event|
  event.respond(content: 'Pong!')
end

bot.message do |event|
  next if event.author.bot_account?

  content = event.content
  next unless content.start_with?(prefix)

  args = content[prefix.length..].split
  next if args.empty?

  if args[0].downcase == 'ping'
    event.respond('Pong!')
  end
end

bot.run
