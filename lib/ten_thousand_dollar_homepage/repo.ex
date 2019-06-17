defmodule TenThousandDollarHomepage.Repo do
  use Ecto.Repo,
    otp_app: :ten_thousand_dollar_homepage,
    adapter: Ecto.Adapters.Postgres
end
