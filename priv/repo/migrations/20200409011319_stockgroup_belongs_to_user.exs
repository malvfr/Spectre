defmodule Spectre.Repo.Migrations.StockgroupBelongsToUser do
  use Ecto.Migration

  def change do
    alter table(:stockgroups) do
      add :user_id, references(:users)
    end
  end
end
