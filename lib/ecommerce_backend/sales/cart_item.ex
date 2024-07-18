defmodule EcommerceBackend.Sales.CartItem do
  use Ecto.Schema
  import Ecto.Changeset

  schema "cart_items" do
    field :quantity, :integer
    belongs_to :cart, EcommerceBackend.Sales.Cart
    belongs_to :product, EcommerceBackend.Catalog.Product
    timestamps()
  end

  def changeset(cart_item, attrs) do
    cart_item
    |> cast(attrs, [:quantity, :cart_id, :product_id])
    |> validate_required([:quantity, :cart_id, :product_id])
  end
end
