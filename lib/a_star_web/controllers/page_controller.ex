defmodule AStarWeb.PageController do
  use AStarWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
