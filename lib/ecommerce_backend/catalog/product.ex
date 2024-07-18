defmodule EcommerceBackend.Catalog.Product do
  use Ecto.Schema
  import Ecto.Changeset

  @derive {Jason.Encoder, only: [:id, :name, :description, :price, :inventory, :inserted_at, :updated_at]}
  schema "products" do
    field :name, :string
    field :description, :string
    field :price, :decimal
    field :inventory, :integer, default: 0
    timestamps()
  end

  def changeset(product, attrs) do
    product
    |> cast(attrs, [:name, :description, :price, :inventory])
    |> validate_required([:name, :description, :price, :inventory])
  end
end
