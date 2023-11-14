defmodule Telbookbot.Repo do
  use Ecto.Repo,
    otp_app: :telbookbot,
    adapter: Ecto.Adapters.Postgres
end
