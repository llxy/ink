defmodule Ink.Application do
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      Ink.Repo,
      InkWeb.Endpoint
    ]

    opts = [strategy: :one_for_one, name: Ink.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def config_change(changed, _new, removed) do
    InkWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
