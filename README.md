# EcommerceBackend

recomended erlang/elixir version:
erlang version: 26+
elixir version: 1.14+

To start your Phoenix server: 

  * adjust the database configuration in `config/config.exs` and `config/test.exs` to your local database
  * Run `mix setup` to install and setup dependencies
  * Start Phoenix endpoint with `mix phx.server`

Now you can try fetching data from (GET http://localhost:4000/api/products) from POSTMAN or any other API testing tool. should return a list of products

To run the tests:

  * `mix test`

### Notes

This backend actually undergo a lot of compared to when I initially plan. When I started, I thought that backend should handle the cart feature. And in real production, I think they should. But in this specific case, I should follow the requirement laid in the test document. But I somehow missed the part where it said I should just let frontend handle the cart functionality, and only realised it after 2 days. So yeah if you find codes related to carts and CartItems, its cause I didnt clean the projects properly of unused code. I was just rushing to finish.

This project architecture is based on the MVC pattern. Since this is Phoenix and Phoenix follows MVC pattern.

The project use context modules to categorised between different part of domain logic. for example, Catalog module handle all product-related logic. and Sales(now deleted) handles cart-related logic

