defmodule ComputeSpherePhoenixExample.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      ComputeSpherePhoenixExampleWeb.Telemetry,
      {DNSCluster,
       query: Application.get_env(:computesphere_phoenix_example, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: ComputeSpherePhoenixExample.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: ComputeSpherePhoenixExample.Finch},
      # Start a worker by calling: ComputeSpherePhoenixExample.Worker.start_link(arg)
      # {ComputeSpherePhoenixExample.Worker, arg},
      # Start to serve requests, typically the last entry
      ComputeSpherePhoenixExampleWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ComputeSpherePhoenixExample.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    ComputeSpherePhoenixExampleWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
