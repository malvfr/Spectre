defmodule Spectre.WalletTest do
  use Spectre.DataCase

  alias Spectre.Wallet

  describe "stocks" do
    alias Spectre.Wallet.Stock

    @valid_attrs %{code: "some code", name: "some name", price: 120.5}
    @update_attrs %{code: "some updated code", name: "some updated name", price: 456.7}
    @invalid_attrs %{code: nil, name: nil, price: nil}

    def stock_fixture(attrs \\ %{}) do
      {:ok, stock} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Wallet.create_stock()

      stock
    end

    test "list_stocks/0 returns all stocks" do
      stock = stock_fixture()
      assert Wallet.list_stocks() == [stock]
    end

    test "get_stock!/1 returns the stock with given id" do
      stock = stock_fixture()
      assert Wallet.get_stock!(stock.id) == stock
    end

    test "create_stock/1 with valid data creates a stock" do
      assert {:ok, %Stock{} = stock} = Wallet.create_stock(@valid_attrs)
      assert stock.code == "some code"
      assert stock.name == "some name"
      assert stock.price == 120.5
    end

    test "create_stock/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Wallet.create_stock(@invalid_attrs)
    end

    test "update_stock/2 with valid data updates the stock" do
      stock = stock_fixture()
      assert {:ok, %Stock{} = stock} = Wallet.update_stock(stock, @update_attrs)
      assert stock.code == "some updated code"
      assert stock.name == "some updated name"
      assert stock.price == 456.7
    end

    test "update_stock/2 with invalid data returns error changeset" do
      stock = stock_fixture()
      assert {:error, %Ecto.Changeset{}} = Wallet.update_stock(stock, @invalid_attrs)
      assert stock == Wallet.get_stock!(stock.id)
    end

    test "delete_stock/1 deletes the stock" do
      stock = stock_fixture()
      assert {:ok, %Stock{}} = Wallet.delete_stock(stock)
      assert_raise Ecto.NoResultsError, fn -> Wallet.get_stock!(stock.id) end
    end

    test "change_stock/1 returns a stock changeset" do
      stock = stock_fixture()
      assert %Ecto.Changeset{} = Wallet.change_stock(stock)
    end
  end

  describe "stockgroups" do
    alias Spectre.Wallet.StockGroup

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def stock_group_fixture(attrs \\ %{}) do
      {:ok, stock_group} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Wallet.create_stock_group()

      stock_group
    end

    test "list_stockgroups/0 returns all stockgroups" do
      stock_group = stock_group_fixture()
      assert Wallet.list_stockgroups() == [stock_group]
    end

    test "get_stock_group!/1 returns the stock_group with given id" do
      stock_group = stock_group_fixture()
      assert Wallet.get_stock_group!(stock_group.id) == stock_group
    end

    test "create_stock_group/1 with valid data creates a stock_group" do
      assert {:ok, %StockGroup{} = stock_group} = Wallet.create_stock_group(@valid_attrs)
      assert stock_group.name == "some name"
    end

    test "create_stock_group/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Wallet.create_stock_group(@invalid_attrs)
    end

    test "update_stock_group/2 with valid data updates the stock_group" do
      stock_group = stock_group_fixture()
      assert {:ok, %StockGroup{} = stock_group} = Wallet.update_stock_group(stock_group, @update_attrs)
      assert stock_group.name == "some updated name"
    end

    test "update_stock_group/2 with invalid data returns error changeset" do
      stock_group = stock_group_fixture()
      assert {:error, %Ecto.Changeset{}} = Wallet.update_stock_group(stock_group, @invalid_attrs)
      assert stock_group == Wallet.get_stock_group!(stock_group.id)
    end

    test "delete_stock_group/1 deletes the stock_group" do
      stock_group = stock_group_fixture()
      assert {:ok, %StockGroup{}} = Wallet.delete_stock_group(stock_group)
      assert_raise Ecto.NoResultsError, fn -> Wallet.get_stock_group!(stock_group.id) end
    end

    test "change_stock_group/1 returns a stock_group changeset" do
      stock_group = stock_group_fixture()
      assert %Ecto.Changeset{} = Wallet.change_stock_group(stock_group)
    end
  end
end
