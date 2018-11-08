defmodule ElixirGirls.Repo do
  use Ecto.Repo,
    otp_app: :elixir_girls,
    adapter: Ecto.Adapters.Postgres
end
