defmodule Twt.Api do
  @moduledoc """
  Twt keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """
  alias Twt.Users
  alias Twt.Repo
  alias Twt.Tweets

  def create_users(attrs \\ %{}) do
    %Users{}
    |> Users.changeset(attrs)
    |> Repo.insert()
  end

  def create_tweet(attrs \\ %{}) do
    %Tweets{}
    |> Tweets.changeset(attrs)
    |> Repo.insert()
  end
end