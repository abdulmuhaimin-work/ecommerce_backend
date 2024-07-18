defmodule EcommerceBackend.Sales.Cart do
  use Ecto.Schema
  import Ecto.Changeset

  schema "carts" do
    field :user_id, :integer
    has_many :cart_items, EcommerceBackend.Sales.CartItem
    timestamps()
  end

  def changeset(cart, attrs) do
    cart
    |> cast(attrs, [:user_id])
    |> validate_required([:user_id])
  end
end
