defmodule Twt.Repo.Migrations.AddTweetsTable do
  use Ecto.Migration

  def change do
    create table(:tweets) do
      add :message, :string , size: 140
      add :user_id, :integer

      timestamps()
    end
  end
end
