defmodule Twt.Retweets do
  use Ecto.Schema
  import Ecto.Changeset

  schema "retweets" do
    field :user_id, :integer
    field :tweet_id, :integer

    timestamps()
  end

  @doc false
  def changeset(retweets, attrs) do
    retweets
    |> cast(attrs, [:user_id, :tweet_id])
    |> validate_required([:user_id, :tweet_id])
  end
end
