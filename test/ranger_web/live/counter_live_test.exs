defmodule RangerWeb.CounterLiveTest do
  use RangerWeb.ConnCase

  import Phoenix.LiveViewTest

  test "user can increase counter", %{conn: conn} do
    {:ok, view, _html} = live(conn, ~p"/counter")

    # `open_browser()` will open the browser on this point,
    # for easy debugging!

    # view |> open_browser()

    view
    |> element("#increment")
    # |> open_browser() <- works element-wise as well
    |> render_click()

    assert has_element?(view, "#count", "1")
  end

  test "user can increase counter (target event directly)", %{conn: conn} do
    {:ok, view, _html} = live(conn, ~p"/counter")

    # This fires 'increase()' event directly, without pressing the button
    view |> render_click("increase")

    # It would pass, but that's not what we want.
    assert has_element?(view, "#count", "1")
  end
end
