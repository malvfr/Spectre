defmodule Spectre.Wallet.Stock do
  use Ecto.Schema
  import Ecto.Changeset

  schema "stocks" do
    field :code, :string
    field :name, :string
    field :price, :float
    many_to_many :stockgroups, Spectre.Wallet.Stock, join_through: "stockgroups_stocks"
    timestamps()
  end

  @doc false
  def changeset(stock, attrs) do
    stock
    |> cast(attrs, [:name, :code, :price])
    |> validate_required([:name, :code, :price])
  end
end
