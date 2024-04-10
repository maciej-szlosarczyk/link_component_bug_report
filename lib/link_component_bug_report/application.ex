defmodule LinkComponentBugReport.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      LinkComponentBugReportWeb.Telemetry,
      LinkComponentBugReport.Repo,
      {DNSCluster, query: Application.get_env(:link_component_bug_report, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: LinkComponentBugReport.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: LinkComponentBugReport.Finch},
      # Start a worker by calling: LinkComponentBugReport.Worker.start_link(arg)
      # {LinkComponentBugReport.Worker, arg},
      # Start to serve requests, typically the last entry
      LinkComponentBugReportWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: LinkComponentBugReport.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    LinkComponentBugReportWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
