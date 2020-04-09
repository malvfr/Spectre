defmodule SpectreWeb.StockControllerTest do
  use SpectreWeb.ConnCase

  alias Spectre.Wallet
  alias Spectre.Wallet.Stock

  @create_attrs %{
    code: "some code",
    name: "some name",
    price: 120.5
  }
  @update_attrs %{
    code: "some updated code",
    name: "some updated name",
    price: 456.7
  }
  @invalid_attrs %{code: nil, name: nil, price: nil}

  def fixture(:stock) do
    {:ok, stock} = Wallet.create_stock(@create_attrs)
    stock
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all stocks", %{conn: conn} do
      conn = get(conn, Routes.stock_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create stock" do
    test "renders stock when data is valid", %{conn: conn} do
      conn = post(conn, Routes.stock_path(conn, :create), stock: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.stock_path(conn, :show, id))

      assert %{
               "id" => id,
               "code" => "some code",
               "name" => "some name",
               "price" => 120.5
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.stock_path(conn, :create), stock: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update stock" do
    setup [:create_stock]

    test "renders stock when data is valid", %{conn: conn, stock: %Stock{id: id} = stock} do
      conn = put(conn, Routes.stock_path(conn, :update, stock), stock: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.stock_path(conn, :show, id))

      assert %{
               "id" => id,
               "code" => "some updated code",
               "name" => "some updated name",
               "price" => 456.7
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, stock: stock} do
      conn = put(conn, Routes.stock_path(conn, :update, stock), stock: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete stock" do
    setup [:create_stock]

    test "deletes chosen stock", %{conn: conn, stock: stock} do
      conn = delete(conn, Routes.stock_path(conn, :delete, stock))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.stock_path(conn, :show, stock))
      end
    end
  end

  defp create_stock(_) do
    stock = fixture(:stock)
    {:ok, stock: stock}
  end
end
