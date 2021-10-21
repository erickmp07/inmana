defmodule Inmana.Supplies.GetByExpiration do
    import Ecto.Query

    alias Inmana.{Repo, Restaurant, Supply}

    def call do
        today = Date.utc_today()
        beginning_of_week = Date.beginning_of_week(today, :sunday)
        end_of_week = Date.end_of_week(today, :sunday)

        query = from supply in Supply,
            where:
                supply.expiration_date >= ^beginning_of_week and supply.expiration_date <= ^end_of_week,
            preload: [:restaurant]

        query
        |> Repo.all()
        |> Enum.group_by(fn %Supply{restaurant: %Restaurant{email: email}} -> email end)
    end
end
