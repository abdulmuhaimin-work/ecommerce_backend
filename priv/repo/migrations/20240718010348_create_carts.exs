defmodule EcommerceBackend.Repo.Migrations.CreateCarts do
  use Ecto.Migration

  def change do
    create table(:carts) do
      add :user_id, :integer

      timestamps(type: :utc_datetime)
    end
  end
end
