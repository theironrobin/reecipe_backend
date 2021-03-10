defmodule ReecipeBackend.Repo do
  use Ecto.Repo,
    otp_app: :reecipe_backend,
    adapter: Ecto.Adapters.Postgres
end
