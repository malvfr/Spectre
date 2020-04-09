defmodule Spectre.Repo.Migrations.CreateStockgroupStocks do
  use Ecto.Migration

  def change do
    create table(:stockgroups_stocks) do
      add :stock_id, references(:stocks)
      add :stockgroup_id, references(:stockgroups)
    end

    create unique_index(:stockgroups_stocks, [:stock_id, :stockgroup_id])
  end
end
