defmodule SpectreWeb.StockView do
  use SpectreWeb, :view
  alias SpectreWeb.StockView

  def render("index.json", %{stocks: stocks}) do
    %{data: render_many(stocks, StockView, "stock.json")}
  end

  def render("show.json", %{stock: stock}) do
    %{data: render_one(stock, StockView, "stock.json")}
  end

  def render("stock.json", %{stock: stock}) do
    %{id: stock.id,
      name: stock.name,
      code: stock.code,
      price: stock.price}
  end
end
