defmodule InmanaWeb.RestaurantsController do
    use InmanaWeb, :controller

    alias Inmana.Restaurant

    alias InmanaWeb.FallbackController

    action_fallback FallbackController

    def create(connection, params) do
        with {:ok, %Restaurant{} = restaurant} <- Inmana.create_restaurant(params) do
            connection
            |> put_status(:created)
            |> render("create.json", restaurant: restaurant)
        end
    end
end
