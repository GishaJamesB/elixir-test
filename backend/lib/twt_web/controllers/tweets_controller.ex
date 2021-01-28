defmodule TwtWeb.TweetsController do
  use TwtWeb, :controller

  alias Twt.Tweets
  alias Twt.Api

  action_fallback TwtWeb.FallbackController

  def index(conn, _params) do
    tweets = Api.get_tweets()
    conn
    |> Plug.Conn.put_resp_header("content-type", "application/json; charset=utf-8")
    |> Plug.Conn.send_resp(200, Poison.encode!(tweets, pretty: true))
  end

  def create(conn, tweet_params) do
    with {:ok, tweets} <- Api.create_tweet(tweet_params) do
      conn
      |> put_status(:created)
      |> Plug.Conn.put_resp_header("content-type", "application/json; charset=utf-8")
      |> Plug.Conn.send_resp(200, Poison.encode!(tweets, pretty: true))
    end
  end

end
