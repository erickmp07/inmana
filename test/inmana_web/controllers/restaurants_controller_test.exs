defmodule InmanaWeb.RestaurantsControllerTest do
    use InmanaWeb.ConnCase

    describe "create/2" do
        test "when all params are valid, creates the restaurant", %{conn: connection} do
            params = %{name: "Restaurant name", email: "restaurant@restaurant.com"}

            response =
                connection
                |> post(Routes.restaurants_path(connection, :create, params))
                |> json_response(:created)

            assert %{
                    "message" => "Restaurant created!",
                    "restaurant" => %{
                        "email" => "restaurant@restaurant.com",
                        "id" => _id,
                        "name" => "Restaurant name"
                    }
                } = response
        end

        test "when there are invalid params, returns an error", %{conn: connection} do
            params = %{email: "restaurant@restaurant.com"}
            expected_response = %{"message" => %{"name" => ["can't be blank"]}}

            response =
                connection
                |> post(Routes.restaurants_path(connection, :create, params))
                |> json_response(:bad_request)

            assert response == expected_response
        end
    end
end
