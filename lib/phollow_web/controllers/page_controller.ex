defmodule PhollowWeb.PageController do
  use PhollowWeb, :controller

  def index(conn, _params) do
    [latest_show|tour] = Phollow.Backend.tour

    render conn, "index.html", tour: tour, latest_show: latest_show
  end

  def videos(conn, _params) do
    render conn, "videos.html"
  end
end
