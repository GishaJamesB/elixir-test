defmodule TwtWeb.TweetsController do
  use TwtWeb, :controller

  alias Twt.Tweets
  alias Twt.Api

  action_fallback TwtWeb.FallbackController

  def index(conn, _params) do
    tweets = Api.get_tweets()
    IO.inspect tweets
    conn
    |> Plug.Conn.put_resp_header("content-type", "application/json; charset=utf-8")
    |> Plug.Conn.send_resp(200, Poison.encode!(tweets, pretty: true))
    #render(conn, "index.json", tweets: tweets)
  end

  def create(conn, tweet_params) do
    with {:ok, tweets} <- Api.createTweet(tweet_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.tweet_path(conn, :show, tweets))
      |> render("show.json",tweets: tweets)
    end
  end

end
