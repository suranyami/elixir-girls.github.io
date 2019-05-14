defmodule ElixirGirlsWeb.GuideController do
  use ElixirGirlsWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def channels(conn, _params) do
    render(conn, "channels.html")
  end
end
