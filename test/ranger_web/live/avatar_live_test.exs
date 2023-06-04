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
  # test "renders avatar HTML", %{conn: conn} do
  #   email = "hoon@mail.com"
  #   avatar_url = Gravatar.generate(email)

  #   {:ok, _view, html} = live(conn, ~p"/avatar/#{email}")

  #   avatar = ~s(<img class="avatar" src="#{avatar_url}")

  #   assert html =~ avatar
  # end

  # The important part is ...
  #   "View should contain an avatar element, which is an image"
  #
  # We can use `has_element` for checking that.
  test "renders avatar image for given email", %{conn: conn} do
    email = "hoon@mail.com"
    avatar_url = Gravatar.generate(email)

    {:ok, view, _html} = live(conn, ~p"/avatar/#{email}")

    # Source should contain avatar url
    assert has_element?(view, ~s(img[src*="#{avatar_url}"]))

    # It's also possible to assign the element into value and check it
    avatar = element(view, ~s(img[src*="#{avatar_url}"]))
    assert has_element?(avatar)
  end
end
