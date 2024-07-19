defmodule EcommerceBackend.CatalogFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `EcommerceBackend.Catalog` context.
  """

  @doc """
  Generate a product.
  """
  def product_fixture(attrs \\ %{}) do
    {:ok, product} =
      attrs
      |> Enum.into(%{
        description: "some description",
        name: "some name",
        price: "120.5",
        image_url: "some_image_url"
      })
      |> EcommerceBackend.Catalog.create_product()

    product
  end

end
