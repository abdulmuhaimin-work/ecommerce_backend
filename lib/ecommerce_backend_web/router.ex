defmodule EcommerceBackendWeb.Router do
  use EcommerceBackendWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", EcommerceBackendWeb do
    pipe_through :api

    resources "/products", ProductController, only: [:index, :show, :create, :update, :delete]
    resources "/cart_items", CartItemController, only: [:create, :delete]
    post "/purchase", PurchaseController, :create
  end
end
