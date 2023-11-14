defmodule Telbookbot.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      TelbookbotWeb.Telemetry,
      Telbookbot.Repo,
      {DNSCluster, query: Application.get_env(:telbookbot, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Telbookbot.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Telbookbot.Finch},
      # Start a worker by calling: Telbookbot.Worker.start_link(arg)
      # {Telbookbot.Worker, arg},
      # Start to serve requests, typically the last entry
      TelbookbotWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Telbookbot.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    TelbookbotWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
