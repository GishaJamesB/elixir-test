defmodule TwtWeb.Router do
  use TwtWeb, :router

  pipeline :api do
    plug CORSPlug, origin: "http://localhost:9000"
    plug :accepts, ["json"]
  end

  scope "/api", TwtWeb do
    pipe_through :api
    get "/tweets", TweetsController, :index
    post "/tweets", TweetsController, :create
    post "/retweets", RetweetsController, :create
    options "/tweets", TweetsController, :create
    options "/retweets", RetweetsController, :create
  end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through [:fetch_session, :protect_from_forgery]
      live_dashboard "/dashboard", metrics: TwtWeb.Telemetry
    end
  end
end
