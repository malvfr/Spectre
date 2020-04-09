defmodule Spectre.Wallet.StockGroup do
  use Ecto.Schema
  import Ecto.Changeset

  schema "stockgroups" do
    field :name, :string
    belongs_to :user, EctoAssoc.User
    many_to_many :stocks, Spectre.Wallet.Stock, join_through: "stockgroups_stocks"
    timestamps()
  end

  @doc false
  def changeset(stock_group, attrs) do
    stock_group
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
