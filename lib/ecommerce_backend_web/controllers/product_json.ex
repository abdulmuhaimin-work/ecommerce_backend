defmodule EcommerceBackendWeb.ProductJSON do
  alias EcommerceBackend.Catalog.Product

  @doc """
  Renders a list of products.
  """
  def index(%{products: products}) do
    %{data: for(product <- products, do: data(product))}
  end

  @doc """
  Renders a single product.
  """
  def show(%{product: product}) do
    %{data: data(product)}
  end

  defp data(%Product{} = product) do
    %{
      id: product.id,
      name: product.name,
      description: product.description,
      price: product.price,
      inventory: product.inventory,
      image_url: product.image_url
    }
  end
end
