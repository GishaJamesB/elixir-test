FROM elixir:1.8
ENV DEBIAN_FRONTEND=noninteractive

# Suggested https://hexdocs.pm/phoenix/installation.html
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y inotify-tools build-essential

# Install hex
RUN mix local.hex --force

# Install rebar
RUN mix local.rebar --force

# Install the Phoenix framework itself
RUN mix archive.install https://github.com/phoenixframework/archives/raw/master/phoenix_new.ez --force

# When this image is run, make /app the current working directory
ENV APP_HOME /app
RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME

ADD . $APP_HOME
