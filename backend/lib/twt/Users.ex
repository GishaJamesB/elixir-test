defmodule Twt.Users do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query, warn: false
  alias Twt.Repo

  schema "users" do
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(users, attrs) do
    users
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end