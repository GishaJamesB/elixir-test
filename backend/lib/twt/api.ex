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
    {ok, result} = Ecto.Adapters.SQL.query(Twt.Repo, "select tweets.id,tweets.message, r.c as numRetweets from tweets 
        left join (select count(1) as c, tweet_id from retweets group by tweet_id ) r
        on tweets.id = r.tweet_id
        order by r.c desc nulls LAST")
    columns = result.columns
    rows = result.rows
    map = Enum.reduce rows, [], fn row, acc ->
      #Map.put(acc, row, (columns |> Enum.zip(row)))
      acc ++ [(columns |> Enum.zip(row))]
    end
    map
  end
end