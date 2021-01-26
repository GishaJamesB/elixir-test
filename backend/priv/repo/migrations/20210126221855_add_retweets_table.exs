defmodule Twt.Repo.Migrations.AddRetweetsTable do
  use Ecto.Migration

  def change do
    create table(:retweets) do
      add :user_id, references(:users)
      add :tweet_id, references(:tweets)

      timestamps()
    end

  end
end
