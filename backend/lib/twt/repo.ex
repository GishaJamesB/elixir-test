defmodule Twt.Repo do
  use Ecto.Repo,
    otp_app: :twt,
    adapter: Ecto.Adapters.Postgres
end
