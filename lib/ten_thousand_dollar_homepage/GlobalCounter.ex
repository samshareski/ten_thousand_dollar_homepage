defmodule TenThousandDollarHomepage.GlobalCounter do
  use GenServer

  alias TenThousandDollarHomepageWeb.Endpoint

  @topic "counter"

  @spec start_link(any) :: :ignore | {:error, any} | {:ok, pid}
  def start_link(_) do
    GenServer.start_link(__MODULE__, 0, name: __MODULE__)
  end

  def init(count) do
    {:ok, count}
  end

  def register() do
    Endpoint.subscribe(@topic)
    GenServer.call(__MODULE__, :current_count)
  end

  def unregister() do
    Endpoint.unsubscribe(@topic)
  end

  def increment() do
    GenServer.cast(__MODULE__, :increment)
  end

  def handle_call(:current_count, _from, state) do
    {:reply, state, state}
  end

  def handle_cast(:increment, state) do
    new_state = state + 1
    Endpoint.broadcast(@topic, "increment", %{count: new_state})
    {:noreply, new_state}
  end
end
