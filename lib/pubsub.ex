defmodule Pubsub do
    use GenServer
    def init(_args) do
      :gproc.reg({:p, :l, :hello})
      {:ok, []}
    end

    def handle_info(msg, state) do
      IO.inspect "Got #{inspect msg} in process #{inspect self()}"
      {:noreply, state}
    end    
end
