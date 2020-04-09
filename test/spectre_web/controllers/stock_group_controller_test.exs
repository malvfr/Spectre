defmodule SpectreWeb.StockGroupControllerTest do
  use SpectreWeb.ConnCase

  alias Spectre.Wallet
  alias Spectre.Wallet.StockGroup

  @create_attrs %{
    name: "some name"
  }
  @update_attrs %{
    name: "some updated name"
  }
  @invalid_attrs %{name: nil}

  def fixture(:stock_group) do
    {:ok, stock_group} = Wallet.create_stock_group(@create_attrs)
    stock_group
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all stockgroups", %{conn: conn} do
      conn = get(conn, Routes.stock_group_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create stock_group" do
    test "renders stock_group when data is valid", %{conn: conn} do
      conn = post(conn, Routes.stock_group_path(conn, :create), stock_group: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.stock_group_path(conn, :show, id))

      assert %{
               "id" => id,
               "name" => "some name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.stock_group_path(conn, :create), stock_group: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update stock_group" do
    setup [:create_stock_group]

    test "renders stock_group when data is valid", %{conn: conn, stock_group: %StockGroup{id: id} = stock_group} do
      conn = put(conn, Routes.stock_group_path(conn, :update, stock_group), stock_group: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.stock_group_path(conn, :show, id))

      assert %{
               "id" => id,
               "name" => "some updated name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, stock_group: stock_group} do
      conn = put(conn, Routes.stock_group_path(conn, :update, stock_group), stock_group: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete stock_group" do
    setup [:create_stock_group]

    test "deletes chosen stock_group", %{conn: conn, stock_group: stock_group} do
      conn = delete(conn, Routes.stock_group_path(conn, :delete, stock_group))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.stock_group_path(conn, :show, stock_group))
      end
    end
  end

  defp create_stock_group(_) do
    stock_group = fixture(:stock_group)
    {:ok, stock_group: stock_group}
  end
end
