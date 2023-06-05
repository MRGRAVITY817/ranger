defmodule RangerWeb.CounterLiveTest do
  use RangerWeb.ConnCase

  import Phoenix.LiveViewTest

  test "user can increase counter", %{conn: conn} do
    {:ok, view, _html} = live(conn, ~p"/counter")

    view
    |> element("#increment")
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
