defmodule Spectre.Repo.Migrations.CreateStockgroups do
  use Ecto.Migration

  def change do
    create table(:stockgroups) do
      add :name, :string

      timestamps()
    end

  end
end
