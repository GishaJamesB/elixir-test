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
  alias Twt.Tweets

Repo.insert! %Users{
  name: "user-1"
}

Repo.insert! %Users{
  name: "user-2"
}

Repo.insert! %Tweets{
    message: "Elixir gives great developer experience",
    user_id: 2
}

Repo.insert! %Tweets{
    message: "Is NodeJS really single theaded?",
    user_id: 2
}

Repo.insert! %Tweets{
    message: "2 million connections in a single server. Is that real?",
    user_id: 1
}

Repo.insert! %Tweets{
    message: "Serverless framework - Infra as code, good to explore?",
    user_id: 1
}

