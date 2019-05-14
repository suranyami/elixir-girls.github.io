defmodule ElixirGirlsWeb.GuideControllerTest do
  use ElixirGirlsWeb.ConnCase

  alias ElixirGirls.Guides

  @create_attrs %{content: "some content", name: "some name", title: "some title"}
  @update_attrs %{content: "some updated content", name: "some updated name", title: "some updated title"}
  @invalid_attrs %{content: nil, name: nil, title: nil}

  def fixture(:guide) do
    {:ok, guide} = Guides.create_guide(@create_attrs)
    guide
  end

  describe "index" do
    test "lists all guides", %{conn: conn} do
      conn = get(conn, Routes.guide_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Guides"
    end
  end

  describe "new guide" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.guide_path(conn, :new))
      assert html_response(conn, 200) =~ "New Guide"
    end
  end

  describe "create guide" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.guide_path(conn, :create), guide: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.guide_path(conn, :show, id)

      conn = get(conn, Routes.guide_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Guide"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.guide_path(conn, :create), guide: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Guide"
    end
  end

  describe "edit guide" do
    setup [:create_guide]

    test "renders form for editing chosen guide", %{conn: conn, guide: guide} do
      conn = get(conn, Routes.guide_path(conn, :edit, guide))
      assert html_response(conn, 200) =~ "Edit Guide"
    end
  end

  describe "update guide" do
    setup [:create_guide]

    test "redirects when data is valid", %{conn: conn, guide: guide} do
      conn = put(conn, Routes.guide_path(conn, :update, guide), guide: @update_attrs)
      assert redirected_to(conn) == Routes.guide_path(conn, :show, guide)

      conn = get(conn, Routes.guide_path(conn, :show, guide))
      assert html_response(conn, 200) =~ "some updated content"
    end

    test "renders errors when data is invalid", %{conn: conn, guide: guide} do
      conn = put(conn, Routes.guide_path(conn, :update, guide), guide: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Guide"
    end
  end

  describe "delete guide" do
    setup [:create_guide]

    test "deletes chosen guide", %{conn: conn, guide: guide} do
      conn = delete(conn, Routes.guide_path(conn, :delete, guide))
      assert redirected_to(conn) == Routes.guide_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.guide_path(conn, :show, guide))
      end
    end
  end

  defp create_guide(_) do
    guide = fixture(:guide)
    {:ok, guide: guide}
  end
end
