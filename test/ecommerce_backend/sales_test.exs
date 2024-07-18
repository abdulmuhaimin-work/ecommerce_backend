defmodule EcommerceBackend.SalesTest do
  use EcommerceBackend.DataCase

  alias EcommerceBackend.Sales

  describe "carts" do
    alias EcommerceBackend.Sales.Cart

    import EcommerceBackend.SalesFixtures

    @invalid_attrs %{user_id: nil}

    test "list_carts/0 returns all carts" do
      cart = cart_fixture()
      assert Sales.list_carts() == [cart]
    end

    test "get_cart!/1 returns the cart with given id" do
      cart = cart_fixture()
      assert Sales.get_cart!(cart.id) == cart
    end

    test "create_cart/1 with valid data creates a cart" do
      valid_attrs = %{user_id: 42}

      assert {:ok, %Cart{} = cart} = Sales.create_cart(valid_attrs)
      assert cart.user_id == 42
    end

    test "create_cart/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Sales.create_cart(@invalid_attrs)
    end

    test "update_cart/2 with valid data updates the cart" do
      cart = cart_fixture()
      update_attrs = %{user_id: 43}

      assert {:ok, %Cart{} = cart} = Sales.update_cart(cart, update_attrs)
      assert cart.user_id == 43
    end

    test "update_cart/2 with invalid data returns error changeset" do
      cart = cart_fixture()
      assert {:error, %Ecto.Changeset{}} = Sales.update_cart(cart, @invalid_attrs)
      assert cart == Sales.get_cart!(cart.id)
    end

    test "delete_cart/1 deletes the cart" do
      cart = cart_fixture()
      assert {:ok, %Cart{}} = Sales.delete_cart(cart)
      assert_raise Ecto.NoResultsError, fn -> Sales.get_cart!(cart.id) end
    end

    test "change_cart/1 returns a cart changeset" do
      cart = cart_fixture()
      assert %Ecto.Changeset{} = Sales.change_cart(cart)
    end
  end
end
