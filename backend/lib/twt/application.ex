defmodule Twt.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Twt.Repo,
      # Start the Telemetry supervisor
      TwtWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Twt.PubSub},
      # Start the Endpoint (http/https)
      TwtWeb.Endpoint
      # Start a worker by calling: Twt.Worker.start_link(arg)
      # {Twt.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Twt.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    TwtWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
