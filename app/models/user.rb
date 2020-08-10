class User < ApplicationRecord
  # See https://www.sitepoint.com/enumerated-types-with-activerecord-and-postgresql/
  enum status: %i[work_in_progress need_help can_help]

  def name
    discord_username
  end
end
