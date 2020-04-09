defmodule Spectre.Repo.Migrations.CreateStocks do
  use Ecto.Migration

  def change do
    create table(:stocks) do
      add :name, :string
      add :code, :string
      add :price, :float

      timestamps()
    end

  end
end
