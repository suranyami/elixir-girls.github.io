defmodule ElixirGirlsWeb.PageController do
  use ElixirGirlsWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
