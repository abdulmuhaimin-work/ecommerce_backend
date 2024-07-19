defmodule EcommerceBackendWeb.PurchaseController do
  use EcommerceBackendWeb, :controller

  alias EcommerceBackend.Sales

  def create(conn, %{"cart_items" => cart_items}) do
    with {:ok, _result} <- Sales.confirm_purchase(cart_items) do
      send_resp(conn, :no_content, "")
    else
      _error ->
        send_resp(conn, :bad_request, "Failed to confirm purchase")
    end
  end
end
