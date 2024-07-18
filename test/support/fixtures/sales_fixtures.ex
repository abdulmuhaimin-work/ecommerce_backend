defmodule EcommerceBackend.SalesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `EcommerceBackend.Sales` context.
  """

  @doc """
  Generate a cart.
  """
  def cart_fixture(attrs \\ %{}) do
    {:ok, cart} =
      attrs
      |> Enum.into(%{
        user_id: 42
      })
      |> EcommerceBackend.Sales.create_cart()

    cart
  end
end
