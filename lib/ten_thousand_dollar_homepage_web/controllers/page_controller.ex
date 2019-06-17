defmodule TenThousandDollarHomepageWeb.PageController do
  use TenThousandDollarHomepageWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
