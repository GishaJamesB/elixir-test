defmodule Twt.UsersTest do
  use ExUnit.Case, async: true
  alias Twt.Users
  alias Twt.Api

  setup do
    # Explicitly get a connection before each test
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Twt.Repo)
  end

  @valid_attrs %{name: "some name"}
  @invalid_attrs %{name: nil}

  test "insertion with valid data" do
    assert {:ok, %Users{} = user} = Api.create_users(@valid_attrs)
    assert user.name == "some name"
  end

  test "insertion with invalid data" do
    assert {:error, %Ecto.Changeset{}} = Api.create_users(@invalid_attrs)
  end
end