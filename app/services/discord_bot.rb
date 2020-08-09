class DiscordBot
  @@bot = nil

  def say_hi
    puts 'Hi'
  end

  def self.bot
    @@bot
  end

  def self.run
    return unless @@bot.nil?

    @@bot = Discordrb::Commands::CommandBot.new token: ENV['DISCORD_BOT_TOKEN'], client_id: ENV['DISCORD_CLIENT_ID'], prefix: '$', advanced_functionality: true
    bot.send_message(737_655_830_031_237_232, 'Bonjour! <@693712651687297074> ', tts = false, embed = nil)
    bot.message(with_text: 'Hi') do |event|
      event.respond 'Hey!'
      puts "Said HEY to #{event.user.username}"
    end

    bot.command :hi do |event|
      event.respond "Hi #{event.user.username}"
      puts "Said Hi to #{event.user.username}"
    end

    at_exit { bot.stop }
    bot.run :async
  end

  run
end
