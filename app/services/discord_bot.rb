class DiscordBot
  @@discord_bot = nil

  def self.run
    return false unless @@discord_bot.nil?

    @@discord_bot = Discordrb::Commands::CommandBot.new token: ENV['DISCORD_BOT_TOKEN'],
                                                        client_id: ENV['DISCORD_CLIENT_ID'],
                                                        prefix: '$',
                                                        advanced_functionality: true
    bot = @@discord_bot

    bot.command :sign_up do |event|
      user = User.new
      user.discord_id = event.user.id
      user.discord_username = event.user.username
      user.work_in_progress!
      if user.save
        event.respond "Merci, tu es bien inscrit #{event.user.username}"
      else
        event.respond "Il y a eu un problème avec l'inscription #{event.user.username}"
      end
      event.respond "Plus d'information sur <https://the-hacking-bot.herokuapp.com>"
    end

    bot.command :need_help do |event|
      user = User.find_by(discord_id: event.user.id)
      puts user
      if user
        user.need_help!
        event.respond "OK #{user.name}"
      else
        event.respond "Utilisateur #{event.user.username} non trouvé, est-tu bien inscrit avec '$sign_up' ?"
      end
    end

    at_exit { bot.stop }
    bot.run :async

    true
  end
end
