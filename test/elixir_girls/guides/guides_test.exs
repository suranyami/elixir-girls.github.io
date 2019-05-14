defmodule ElixirGirls.GuidesTest do
  use ElixirGirls.DataCase

  alias ElixirGirls.Guides

  describe "guides" do
    alias ElixirGirls.Guides.Guide

    @valid_attrs %{content: "some content", name: "some name", title: "some title"}
    @update_attrs %{content: "some updated content", name: "some updated name", title: "some updated title"}
    @invalid_attrs %{content: nil, name: nil, title: nil}

    def guide_fixture(attrs \\ %{}) do
      {:ok, guide} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Guides.create_guide()

      guide
    end

    test "list_guides/0 returns all guides" do
      guide = guide_fixture()
      assert Guides.list_guides() == [guide]
    end

    test "get_guide!/1 returns the guide with given id" do
      guide = guide_fixture()
      assert Guides.get_guide!(guide.id) == guide
    end

    test "create_guide/1 with valid data creates a guide" do
      assert {:ok, %Guide{} = guide} = Guides.create_guide(@valid_attrs)
      assert guide.content == "some content"
      assert guide.name == "some name"
      assert guide.title == "some title"
    end

    test "create_guide/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Guides.create_guide(@invalid_attrs)
    end

    test "update_guide/2 with valid data updates the guide" do
      guide = guide_fixture()
      assert {:ok, %Guide{} = guide} = Guides.update_guide(guide, @update_attrs)
      assert guide.content == "some updated content"
      assert guide.name == "some updated name"
      assert guide.title == "some updated title"
    end

    test "update_guide/2 with invalid data returns error changeset" do
      guide = guide_fixture()
      assert {:error, %Ecto.Changeset{}} = Guides.update_guide(guide, @invalid_attrs)
      assert guide == Guides.get_guide!(guide.id)
    end

    test "delete_guide/1 deletes the guide" do
      guide = guide_fixture()
      assert {:ok, %Guide{}} = Guides.delete_guide(guide)
      assert_raise Ecto.NoResultsError, fn -> Guides.get_guide!(guide.id) end
    end

    test "change_guide/1 returns a guide changeset" do
      guide = guide_fixture()
      assert %Ecto.Changeset{} = Guides.change_guide(guide)
    end
  end
end
