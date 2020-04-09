defmodule Spectre.Repo do
  use Ecto.Repo,
    otp_app: :spectre,
    adapter: Ecto.Adapters.Postgres
end
