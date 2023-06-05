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
end
