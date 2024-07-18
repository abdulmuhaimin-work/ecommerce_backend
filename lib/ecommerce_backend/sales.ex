defmodule EcommerceBackend.Sales do
  import Ecto.Query, warn: false
  alias EcommerceBackend.Repo

  alias EcommerceBackend.Sales.{Cart, CartItem}
  alias EcommerceBackend.Catalog.Product

  def add_to_cart(cart_id, product_id, quantity) do
    Repo.transaction(fn ->
      product = Repo.get!(Product, product_id)

      if product.inventory >= quantity do
        Repo.update!(Product.changeset(product, %{inventory: product.inventory - quantity}))

        cart_item = %CartItem{
          cart_id: cart_id,
          product_id: product_id,
          quantity: quantity
        }

        Repo.insert!(cart_item)
      else
        {:error, "Not enough inventory"}
      end
    end)
  end

  def remove_from_cart(cart_item) do
    Repo.transaction(fn ->
      product = Repo.get!(Product, cart_item.product_id)
      Repo.update!(Product.changeset(product, %{inventory: product.inventory + cart_item.quantity}))
      Repo.delete!(cart_item)
    end)
  end

  def get_cart_item!(id), do: Repo.get!(CartItem, id)
end
