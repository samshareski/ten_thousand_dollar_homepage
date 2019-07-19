defmodule TenThousandDollarHomepageWeb.Counter do
  use Phoenix.LiveView

  @topic "counter"

  alias TenThousandDollarHomepage.GlobalCounter

  def render(assigns) do
    ~L"""
    <div>
      <h2>The count is <%= @count %></h2>
      <button phx-click="increment">Increment</button>
    </div>
    """
  end

  def mount(_session, socket) do
    if connected?(socket) do
      initial_count = GlobalCounter.register()
      {:ok, put_count(socket, initial_count)}
    else
      {:ok, put_count(socket, 0)}
    end
  end

  def terminate(_, _) do
    GlobalCounter.unregister()
  end

  def handle_event("increment", _, socket) do
    GlobalCounter.increment()
    {:noreply, socket}
  end

  def handle_info(%{topic: @topic, payload: %{count: count}}, socket) do
    {:noreply, put_count(socket, count)}
  end

  def handle_info(msg, socket) do
    IO.inspect(msg)
    {:noreply, socket}
  end

  defp put_count(socket, count) do
    assign(socket, count: count)
  end
end
