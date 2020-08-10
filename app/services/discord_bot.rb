class DiscordBot
  @@discord_bot = nil

  def self.run
    return 'Déjà réveillé :)' unless @@discord_bot.nil?

    @@discord_bot = Discordrb::Commands::CommandBot.new token: ENV['DISCORD_BOT_TOKEN'],
                                                        client_id: ENV['DISCORD_CLIENT_ID'],
                                                        prefix: '$',
                                                        advanced_functionality: true
    bot = @@discord_bot

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

    'On a réveillé le bot, merci'
  end
end
