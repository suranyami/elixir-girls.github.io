defmodule ElixirGirlsWeb.Router do
  use ElixirGirlsWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ElixirGirlsWeb do
    pipe_through :browser

    get "/", PageController, :index
    get "/guide", GuideController, :index
    get "/guide/channels", GuideController, :channels
  end

  # Other scopes may use custom stacks.
  # scope "/api", ElixirGirlsWeb do
  #   pipe_through :api
  # end
end
