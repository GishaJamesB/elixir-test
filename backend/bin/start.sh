#!/usr/bin/env bash

mix deps.get
mix compile
mix ecto.drop 
mix ecto.create 
mix ecto.migrate

mix run priv/repo/seeds.exs

#mix ecto.migrate
elixir --name app@127.0.0.2 --cookie "TwitterCookie" -S mix phx.server
