# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Twt.Repo.insert!(%Twt.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Twt.Repo
  alias Twt.Users

  Repo.insert! %Users{
    name: "user-1"
  }

  Repo.insert! %Users{
    name: "user-2"
  }
