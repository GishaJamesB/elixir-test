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
  alias Twt.Retweets

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

  def create_retweet(attrs \\ %{}) do
    %Retweets{}
    |> Retweets.changeset(attrs)
    |> Repo.insert()
  end
  
  def get_tweets() do
    query = "SELECT tweets.id AS message_id,
                    tweets.message AS message, 
                    COALESCE(r.c, 0) as retweets, 
                    users.name AS posted_by 
              FROM tweets 
              join users on tweets.user_id = users.id
              left join (select count(1) as c, tweet_id from retweets group by tweet_id ) r
              on tweets.id = r.tweet_id
              order by r.c desc nulls LAST"
    result = Ecto.Adapters.SQL.query!(Twt.Repo, query, []) 
    columns = Enum.map result.columns, &(String.to_atom(&1))
    Enum.map result.rows, fn(row) ->
      Enum.zip(columns, row) |> Enum.into(%{})
    end
  end
end