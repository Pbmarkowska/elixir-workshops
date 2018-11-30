defmodule FacelixirWeb.PageController do
  use FacelixirWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
