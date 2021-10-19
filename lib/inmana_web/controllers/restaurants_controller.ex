defmodule InmanaWeb.RestaurantsController do
    use InmanaWeb, :controller

    alias Inmana.Restaurant
    alias Inmana.Restaurants.Create

    alias InmanaWeb.FallbackController

    action_fallback FallbackController

    def create(connection, params) do
        with {:ok, %Restaurant{} = restaurant} <- Create.call(params) do
            connection
            |> put_status(:created)
            |> render("create.json", restaurant: restaurant)
        end
    end
end
