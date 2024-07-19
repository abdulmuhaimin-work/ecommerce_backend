defmodule EcommerceBackend.Sales do
  alias EcommerceBackend.Repo
  alias EcommerceBackend.Catalog.Product

  def confirm_purchase(cart_items) do
    Repo.transaction(fn ->
      Enum.each(cart_items, fn %{"id" => product_id, "quantity" => quantity} ->
        product = Repo.get!(Product, product_id)
        new_inventory = product.inventory - quantity

        if new_inventory < 0 do
          Repo.rollback("Not enough inventory for product #{product_id}")
        else
          product
          |> Product.changeset(%{inventory: new_inventory})
          |> Repo.update!()
        end
      end)
    end)
  end
end
