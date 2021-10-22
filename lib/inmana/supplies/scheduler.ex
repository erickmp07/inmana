defmodule Inmana.Supplies.Scheduler do
    use GenServer

    alias Inmana.Supplies.ExpirationNotification

    # Client side

    def start_link(_state) do
        GenServer.start_link(__MODULE__, %{})
    end

    # Server side

    @impl true
    def init(state \\ %{}) do
        schedule_notification()

        {:ok, state}
    end

    @impl true
    def handle_info(:generate, state) do
        ExpirationNotification.send()

        schedule_notification()

        {:noreply, state}
    end

    defp schedule_notification do
        one_week_in_milliseconds = 1000 * 60 * 60 * 24 * 7
        Process.send_after(self(), :generate, one_week_in_milliseconds)
    end
end
