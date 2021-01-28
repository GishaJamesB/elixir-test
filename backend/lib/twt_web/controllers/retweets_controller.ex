defmodule TwtWeb.RetweetsController do
  use TwtWeb, :controller

  alias Twt.Tweets
  alias Twt.Api

  action_fallback TwtWeb.FallbackController

  def create(conn, retweet_params) do
  IO.puts "Reached"
  IO.inspect retweet_params
    with {:ok, tweets} <- Api.create_retweet(retweet_params) do
      conn
      |> put_status(:created)
      |> Plug.Conn.put_resp_header("content-type", "application/json; charset=utf-8")
      |> Plug.Conn.send_resp(200, Poison.encode!(tweets, pretty: true))
    end
  end

end
