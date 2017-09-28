defmodule Neko.UserRate.Store.Supervisor do
  @moduledoc """
  Used to group stores.
  """

  use Supervisor

  def start_link do
    Supervisor.start_link(__MODULE__, :ok, name: __MODULE__)
  end

  def init(:ok) do
    children = [
      worker(Neko.UserRate.Store, [], restart: :temporary)
    ]

    supervise(children, strategy: :simple_one_for_one)
  end

  def start_store do
    Supervisor.start_child(__MODULE__, [])
  end
end
