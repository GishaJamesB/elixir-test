defmodule Twt.TweetsTest do
  use ExUnit.Case, async: true
  alias Twt.Tweets
  alias Twt.Users
  alias Twt.Api

  setup do
    # Explicitly get a connection before each test
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Twt.Repo)
  end

  @invalid_attrs %{message: nil}

  test "insertion with valid data" do
    {:ok, %Users{} = user} = Api.create_users(%{name: "some name"})
    valid_attrs = %{message: "some message", user_id: user.id}
    assert {:ok, %Tweets{} = tweet} = Api.create_tweet(valid_attrs)
    assert tweet.user_id == user.id
  end

  test "insertion with invalid data" do
    assert {:error, %Ecto.Changeset{}} = Api.create_tweet(@invalid_attrs)
  end
end