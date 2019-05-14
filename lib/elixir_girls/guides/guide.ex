defmodule ElixirGirls.Guides.Guide do
  use Ecto.Schema
  import Ecto.Changeset


  schema "guides" do
    field :content, :string
    field :name, :string
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(guide, attrs) do
    guide
    |> cast(attrs, [:name, :title, :content])
    |> validate_required([:name, :title, :content])
  end
end
