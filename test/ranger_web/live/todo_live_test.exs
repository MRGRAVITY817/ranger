defmodule RangerWeb.TodoLiveTest do
  use RangerWeb.ConnCase

  import Phoenix.LiveViewTest

  test "user can create a new todo", %{conn: conn} do
    {:ok, view, _html} = live(conn, ~p"/todo")

    view
    |> form("#add-todo", %{todo: %{body: "Form fellowship"}})
    |> render_submit()

    assert has_element?(view, "[data-role=todo]", "Form fellowship")
  end
end
