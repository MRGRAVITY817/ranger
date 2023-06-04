defmodule RangerWeb.GreetLiveTest do
  use RangerWeb.ConnCase

  import Phoenix.LiveViewTest

  test "renders disconnected state", %{conn: conn} do
    disconnected = conn |> get(~p"/greet")

    assert html_response(disconnected, 200) =~ "Welcome to stateless HTTP"
  end

  test "upgrades the connection", %{conn: conn} do
    disconnected = conn |> get(~p"/greet")
    # upgrade the connection
    {:ok, _view, html} = live(disconnected)

    assert html =~ "Welcome to Testing LiveView"
  end

  test "rendering connected state", %{conn: conn} do
    # Start right away from connected state
    {:ok, _view, html} = live(conn, ~p"/greet")

    assert html =~ "Welcome to Testing LiveView"
  end
end
