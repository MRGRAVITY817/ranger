defmodule RangerWeb.AvatarLiveTest do
  alias Ranger.Gravatar
  use RangerWeb.ConnCase

  import Phoenix.LiveViewTest

  alias Ranger.Gravatar

  test "renders avatar for given email", %{conn: conn} do
    email = "hoon@mail.com"
    avatar_url = Gravatar.generate(email)

    {:ok, _view, html} = live(conn, ~p"/avatar/#{email}")

    assert html =~ avatar_url
  end

  # FRAGILE TEST: what if `class` is added, like tailwind utility classes?
  # We should test only the core behavior - not the volatile parts.
  test "renders avatar HTML", %{conn: conn} do
    email = "hoon@mail.com"
    avatar_url = Gravatar.generate(email)

    {:ok, _view, html} = live(conn, ~p"/avatar/#{email}")

    avatar = ~s(<img class="avatar" src="#{avatar_url}")

    assert html =~ avatar
  end
end
