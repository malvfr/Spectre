defmodule SpectreWeb.Router do
  use SpectreWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", SpectreWeb do
    pipe_through :api

    resources "/stockgroups", StockGroupController, except: [:new, :edit]
    resources "/users", UserController, except: [:new, :edit]
    resources "/stocks", StockController, except: [:new, :edit]
  end
end
