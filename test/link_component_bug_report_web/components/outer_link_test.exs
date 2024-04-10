defmodule LinkComponentBugReportWeb.OuterLinkTest do
  use LinkComponentBugReportWeb.ConnCase, async: true
  import Phoenix.LiveViewTest
  import LinkComponentBugReportWeb.OuterLinkComponent

  use Phoenix.Component

  describe ".outer_link" do
    test "renders in unknown order" do
      assigns = %{}

      component_html = """
      <div class="flex flex-col items-center caption-disclaimer text-center text-cool-grey-450 md:flex-row md:justify-center md:space-x-1">
        <p data-testid="test-business-text">
          Some text
        </p>
        <a href="https://example.com/link" class="underline" data-testid="test-business-link">
          Learn more
        </a>
      </div>
      """

      assert rendered_to_string(~H"""
             <.outer_link />
             """) == String.trim(component_html)
    end
  end
end
