defmodule Pubsub do
    use GenServer

    # Client API
    def subscribe(topic) do
        GenServer.start_link(__MODULE__, [topic: topic], [])
    end

    def publish(topic, message) do
        GenServer.cast({:via, :gproc, {:p, :l, topic}}, message)
    end

    # Server API
    def init(args) do
      :gproc.reg({:p, :l, args[:topic]})
      {:ok, []}
    end

    def handle_cast(msg, state) do
      IO.inspect "Got #{inspect msg} in process #{inspect self()}"
      {:noreply, state}
    end
end
