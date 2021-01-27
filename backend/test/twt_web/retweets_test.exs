defmodule Twt.TweetsTest do
  use ExUnit.Case, async: true
  alias Twt.Tweets
  alias Twt.Users
  alias Twt.Retweets
  alias Twt.Api

  setup do
    # Explicitly get a connection before each test
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Twt.Repo)
  end

  @invalid_attrs %{user_id: 1}

  test "insertion with valid data" do
    {:ok, %Users{} = user} = Api.create_users(%{name: "some name"})
    msg_attrs = %{message: "some message", user_id: user.id}
    {:ok, %Tweets{} = tweet} = Api.create_tweet(msg_attrs)
    valid_attrs = %{tweet_id: tweet.id, user_id: user.id}
    assert {:ok, %Retweets{} = retweet} = Api.create_retweet(valid_attrs)
    assert retweet.user_id == user.id
    assert retweet.tweet_id == tweet.id
  end

  test "insertion with invalid data" do
    assert {:error, %Ecto.Changeset{}} = Api.create_tweet(@invalid_attrs)
  end
end