defmodule EcommerceBackend.SalesTest do
  use EcommerceBackend.DataCase

  alias EcommerceBackend.Sales
  alias EcommerceBackend.Catalog.Product

  describe "confirm_purchase/1" do
    setup do
      product = %Product{
        name: "Test Product",
        description: "A product for testing",
        price: Decimal.new("10.00"),
        inventory: 100
      }
      {:ok, product: Repo.insert!(product)}
    end

    test "successfully confirms purchase and updates inventory", %{product: product} do
      cart_items = [%{"id" => product.id, "quantity" => 10}]
      assert :ok = Sales.confirm_purchase(cart_items)
      updated_product = Repo.get!(Product, product.id)
      assert updated_product.inventory == 90
    end

    test "fails to confirm purchase due to insufficient inventory", %{product: product} do
      cart_items = [%{"id" => product.id, "quantity" => 200}]
      assert {:error, _} = Sales.confirm_purchase(cart_items)
      updated_product = Repo.get!(Product, product.id)
      assert updated_product.inventory == 100
    end
  end
end
