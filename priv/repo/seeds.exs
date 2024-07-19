# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     EcommerceBackend.Repo.insert!(%EcommerceBackend.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias EcommerceBackend.Repo
alias EcommerceBackend.Catalog.Product

products = [
  %{
    id: 1,
    name: "Apple Iphone 1",
    description: "The first. The best. Iphone",
    image_url: "https://i.ebayimg.com/images/g/fnoAAOSw5YVkadpj/s-l1200.jpg",
    inventory: 50,
    price: "19.99"
  },
  %{
    id: 9,
    name: "Jolla",
    description: "The phone that nobody knows about. Created from former Nokia staff. A great attemp at trying to compete with the 2 big mobile OS",
    image_url: "https://jolla.com/content/uploads/2017/01/JollaC_Devices.jpg?x64777",
    inventory: 0,
    price: "40.0"
  },
  %{
    id: 8,
    name: "Samsung Galaxy S",
    description: "The first ever Galaxy. Bluetooth, Wifi, GPS, high resolution camera, it have everything. can also make calls",
    image_url: "https://www.cnet.com/a/img/resize/3a7d4eacf4af2e9c9a459b6bea99299ac90d3490/hub/2010/03/24/6438a69a-cc2e-11e2-9a4a-0291187b029a/samsung-galaxy-s_1.jpg?auto=webp&width=768",
    inventory: 20,
    price: "39.99"
  },
  %{
    id: 7,
    name: "Apple Iphone 2",
    description: "The Second. The second best. slightly expensive. Iphone. I dont know what kinda description to put here. Can also be used to make call",
    image_url: "https://fdn2.gsmarena.com/vv/pics/apple/apple-iphone-3g-02.jpg",
    inventory: 4,
    price: "29.99"
  }
]

Enum.each(products, fn product ->
  %Product{}
  |> Product.changeset(product)
  |> Repo.insert!()
end)
