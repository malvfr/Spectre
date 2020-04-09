defmodule Spectre.Wallet do
  @moduledoc """
  The Wallet context.
  """

  import Ecto.Query, warn: false
  alias Spectre.Repo

  alias Spectre.Wallet.Stock

  @doc """
  Returns the list of stocks.

  ## Examples

      iex> list_stocks()
      [%Stock{}, ...]

  """
  def list_stocks do
    Repo.all(Stock)
  end

  @doc """
  Gets a single stock.

  Raises `Ecto.NoResultsError` if the Stock does not exist.

  ## Examples

      iex> get_stock!(123)
      %Stock{}

      iex> get_stock!(456)
      ** (Ecto.NoResultsError)

  """
  def get_stock!(id), do: Repo.get!(Stock, id)

  @doc """
  Creates a stock.

  ## Examples

      iex> create_stock(%{field: value})
      {:ok, %Stock{}}

      iex> create_stock(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_stock(attrs \\ %{}) do
    %Stock{}
    |> Stock.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a stock.

  ## Examples

      iex> update_stock(stock, %{field: new_value})
      {:ok, %Stock{}}

      iex> update_stock(stock, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_stock(%Stock{} = stock, attrs) do
    stock
    |> Stock.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a stock.

  ## Examples

      iex> delete_stock(stock)
      {:ok, %Stock{}}

      iex> delete_stock(stock)
      {:error, %Ecto.Changeset{}}

  """
  def delete_stock(%Stock{} = stock) do
    Repo.delete(stock)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking stock changes.

  ## Examples

      iex> change_stock(stock)
      %Ecto.Changeset{source: %Stock{}}

  """
  def change_stock(%Stock{} = stock) do
    Stock.changeset(stock, %{})
  end

  alias Spectre.Wallet.StockGroup

  @doc """
  Returns the list of stockgroups.

  ## Examples

      iex> list_stockgroups()
      [%StockGroup{}, ...]

  """
  def list_stockgroups do
    Repo.all(StockGroup)
  end

  @doc """
  Gets a single stock_group.

  Raises `Ecto.NoResultsError` if the Stock group does not exist.

  ## Examples

      iex> get_stock_group!(123)
      %StockGroup{}

      iex> get_stock_group!(456)
      ** (Ecto.NoResultsError)

  """
  def get_stock_group!(id), do: Repo.get!(StockGroup, id)

  @doc """
  Creates a stock_group.

  ## Examples

      iex> create_stock_group(%{field: value})
      {:ok, %StockGroup{}}

      iex> create_stock_group(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_stock_group(attrs \\ %{}) do
    %StockGroup{}
    |> StockGroup.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a stock_group.

  ## Examples

      iex> update_stock_group(stock_group, %{field: new_value})
      {:ok, %StockGroup{}}

      iex> update_stock_group(stock_group, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_stock_group(%StockGroup{} = stock_group, attrs) do
    stock_group
    |> StockGroup.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a stock_group.

  ## Examples

      iex> delete_stock_group(stock_group)
      {:ok, %StockGroup{}}

      iex> delete_stock_group(stock_group)
      {:error, %Ecto.Changeset{}}

  """
  def delete_stock_group(%StockGroup{} = stock_group) do
    Repo.delete(stock_group)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking stock_group changes.

  ## Examples

      iex> change_stock_group(stock_group)
      %Ecto.Changeset{source: %StockGroup{}}

  """
  def change_stock_group(%StockGroup{} = stock_group) do
    StockGroup.changeset(stock_group, %{})
  end
end
