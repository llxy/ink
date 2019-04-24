defmodule InkWeb.PageController do
  use InkWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
