defmodule LinkComponentBugReport.Repo do
  use Ecto.Repo,
    otp_app: :link_component_bug_report,
    adapter: Ecto.Adapters.Postgres
end
