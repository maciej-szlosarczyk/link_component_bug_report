defmodule LinkComponentBugReportWeb.OuterLinkComponent do
  @moduledoc """
  Provide Sharable Learn more component
  """

  use Phoenix.Component
  import LinkComponentBugReportWeb.Gettext

  def outer_link(assigns) do
    ~H"""
    <div class="flex flex-col items-center caption-disclaimer text-center text-cool-grey-450 md:flex-row md:justify-center md:space-x-1">
      <p data-testid="test-business-text">
        <%= dgettext("p", "Some text") %>
      </p>
      <.link data-testid="test-business-link"
        class="underline"
        href="https://example.com/link"
      >
        <%= dgettext("learn more", "Learn more") %>
      </.link>
    </div>
    """
  end
end
