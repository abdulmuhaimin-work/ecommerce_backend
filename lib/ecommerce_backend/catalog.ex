defmodule EcommerceBackend.Catalog do
  import Ecto.Query, warn: false
  alias EcommerceBackend.Repo

  alias EcommerceBackend.Catalog.Product

  def list_products do
    Repo.all(Product)
  end

  def get_product!(id), do: Repo.get!(Product, id)

  def create_product(attrs \\ %{}) do
    %Product{}
    |> Product.changeset(attrs)
    |> Repo.insert()
  end

  def update_product(%Product{} = product, attrs) do
    product
    |> Product.changeset(attrs)
    |> Repo.update()
  end

  def delete_product(%Product{} = product) do
    Repo.delete(product)
  end

  def change_product(%Product{} = product) do
    Product.changeset(product, %{})
  end
end
