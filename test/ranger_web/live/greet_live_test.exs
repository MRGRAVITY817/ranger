defmodule RangerWeb.GreetLiveTest do
  use RangerWeb.ConnCase

  import Phoenix.LiveViewTest

  test "renders disconnected state", %{conn: conn} do
    disconnected = conn |> get(~p"/greet")

    assert html_response(disconnected, 200) =~ "Welcome to stateless HTTP"
  end
end
