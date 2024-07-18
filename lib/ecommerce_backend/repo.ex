defmodule EcommerceBackend.Repo do
  use Ecto.Repo,
    otp_app: :ecommerce_backend,
    adapter: Ecto.Adapters.Postgres
end
