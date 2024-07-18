defmodule EcommerceBackendWeb.CartItemController do
  use EcommerceBackendWeb, :controller

  alias EcommerceBackend.Sales
  alias EcommerceBackend.Sales.CartItem

  action_fallback EcommerceBackendWeb.FallbackController

  def create(conn, %{"cart_item" => cart_item_params}) do
    with {:ok, %CartItem{} = cart_item} <- Sales.add_to_cart(cart_item_params["cart_id"], cart_item_params["product_id"], cart_item_params["quantity"]) do
      conn
      |> put_status(:created)
      |> json(cart_item)
    end
  end

  def delete(conn, %{"id" => id}) do
    cart_item = Sales.get_cart_item!(id)

    with {:ok, %CartItem{}} <- Sales.remove_from_cart(cart_item) do
      send_resp(conn, :no_content, "")
    end
  end
end
