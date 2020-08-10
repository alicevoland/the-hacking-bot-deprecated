class User < ApplicationRecord
  enum status: %i[work_in_progress need_help can_help]

  def name
    discord_username
  end
end
