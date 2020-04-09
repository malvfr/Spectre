defmodule SpectreWeb.StockGroupView do
  use SpectreWeb, :view
  alias SpectreWeb.StockGroupView

  def render("index.json", %{stockgroups: stockgroups}) do
    %{data: render_many(stockgroups, StockGroupView, "stock_group.json")}
  end

  def render("show.json", %{stock_group: stock_group}) do
    %{data: render_one(stock_group, StockGroupView, "stock_group.json")}
  end

  def render("stock_group.json", %{stock_group: stock_group}) do
    %{id: stock_group.id,
      name: stock_group.name}
  end
end
