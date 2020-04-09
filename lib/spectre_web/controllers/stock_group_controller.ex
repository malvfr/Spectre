defmodule SpectreWeb.StockGroupController do
  use SpectreWeb, :controller

  alias Spectre.Wallet
  alias Spectre.Wallet.StockGroup

  action_fallback SpectreWeb.FallbackController

  def index(conn, _params) do
    stockgroups = Wallet.list_stockgroups()
    render(conn, "index.json", stockgroups: stockgroups)
  end

  def create(conn, %{"stock_group" => stock_group_params}) do
    with {:ok, %StockGroup{} = stock_group} <- Wallet.create_stock_group(stock_group_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.stock_group_path(conn, :show, stock_group))
      |> render("show.json", stock_group: stock_group)
    end
  end

  def show(conn, %{"id" => id}) do
    stock_group = Wallet.get_stock_group!(id)
    render(conn, "show.json", stock_group: stock_group)
  end

  def update(conn, %{"id" => id, "stock_group" => stock_group_params}) do
    stock_group = Wallet.get_stock_group!(id)

    with {:ok, %StockGroup{} = stock_group} <- Wallet.update_stock_group(stock_group, stock_group_params) do
      render(conn, "show.json", stock_group: stock_group)
    end
  end

  def delete(conn, %{"id" => id}) do
    stock_group = Wallet.get_stock_group!(id)

    with {:ok, %StockGroup{}} <- Wallet.delete_stock_group(stock_group) do
      send_resp(conn, :no_content, "")
    end
  end
end
