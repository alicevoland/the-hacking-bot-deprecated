class DiscordBot
  @@discord_bot = nil

  def self.bot
    if @@bot.nil?
      @@bot = Discordrb::Commands::CommandBot.new token: ENV['DISCORD_BOT_TOKEN'],
                                                  client_id: ENV['DISCORD_CLIENT_ID'],
                                                  prefix: '$',
                                                  advanced_functionality: true
    end

    @@bot
  end

  def self.run
    return unless @@discord_bot.nil?

    @@discord_bot = Discordrb::Commands::CommandBot.new token: ENV['DISCORD_BOT_TOKEN'],
                                                        client_id: ENV['DISCORD_CLIENT_ID'],
                                                        prefix: '$',
                                                        advanced_functionality: true
    bot = @@discord_bot

    # bot.send_message(737_655_830_031_237_232, 'Waking up', tts = false, embed = nil)

    # bot.message(with_text: 'Hi') do |event|
    #   event.respond 'Hey!'
    #   puts "Said HEY to #{event.user.username}"
    # end

    bot.command :hi do |event|
      event.respond "Hi #{event.user.username}"
      puts "Said Hi to #{event.user.username}"
      puts event.methods
    end

    at_exit { bot.stop }
    bot.run :async
  end
end
