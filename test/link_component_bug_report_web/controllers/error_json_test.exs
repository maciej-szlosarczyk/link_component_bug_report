defmodule LinkComponentBugReportWeb.ErrorJSONTest do
  use LinkComponentBugReportWeb.ConnCase, async: true

  test "renders 404" do
    assert LinkComponentBugReportWeb.ErrorJSON.render("404.json", %{}) == %{errors: %{detail: "Not Found"}}
  end

  test "renders 500" do
    assert LinkComponentBugReportWeb.ErrorJSON.render("500.json", %{}) ==
             %{errors: %{detail: "Internal Server Error"}}
  end
end
