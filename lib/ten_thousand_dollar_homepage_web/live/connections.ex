defmodule TenThousandDollarHomepageWeb.Connections do
  use Phoenix.LiveView

  alias TenThousandDollarHomepage.{ConnectionsRegistry}

  def render(assigns) do
    ~L"""
    <div>
      <h2>There are <%= @connections %> connections</h2>
    </div>
    """
  end

  def mount(_session, socket) do
    if connected?(socket), do: ConnectionsRegistry.register()

    {:ok, put_connections(socket, ConnectionsRegistry.count())}
  end

  def terminate(_, _) do
    ConnectionsRegistry.unregister()
  end

  def handle_info({:connections, connections}, socket) do
    {:noreply, put_connections(socket, connections)}
  end

  defp put_connections(socket, connections) do
    assign(socket, connections: connections)
  end
end
