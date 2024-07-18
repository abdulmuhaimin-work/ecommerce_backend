defmodule EcommerceBackendWeb.ProductController do
  use EcommerceBackendWeb, :controller

  alias EcommerceBackend.Catalog
  alias EcommerceBackend.Catalog.Product

  action_fallback EcommerceBackendWeb.FallbackController

  def index(conn, _params) do
    products = Catalog.list_products()
    json(conn, products)
  end

  def create(conn, %{"product" => product_params}) do
    with {:ok, %Product{} = product} <- Catalog.create_product(product_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/products/#{product.id}")
      |> json(product)
    end
  end

  def show(conn, %{"id" => id}) do
    product = Catalog.get_product!(id)
    json(conn, product)
  end

  def update(conn, %{"id" => id, "product" => product_params}) do
    product = Catalog.get_product!(id)

    with {:ok, %Product{} = product} <- Catalog.update_product(product, product_params) do
      json(conn, product)
    end
  end

  def delete(conn, %{"id" => id}) do
    product = Catalog.get_product!(id)

    with {:ok, %Product{}} <- Catalog.delete_product(product) do
      send_resp(conn, :no_content, "")
    end
  end
end
