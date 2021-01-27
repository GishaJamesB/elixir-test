defmodule Twt.Tweets do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tweets" do
    field :message, :string
    field :user_id, :integer

    timestamps()
  end

  @doc false
  def changeset(messages, attrs) do
    messages
    |> cast(attrs, [:message, :user_id])
    |> validate_required([:message, :user_id])
  end
end
