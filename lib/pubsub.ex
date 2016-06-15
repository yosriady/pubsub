defmodule Pubsub do
    use GenServer

    # https://github.com/uwiger/gproc/wiki/The-gproc-api
    @type type :: :n | :p | :c | :a | :r | :rc
    @type scope :: :l | :g
    @type name :: term
    @type key :: {type, scope, name}

    # Client API
    def subscribe(topic) do
        GenServer.start_link(__MODULE__, [topic: topic], [])
    end

    def subscribers(topic) do
        :gproc.lookup_pids({:p, :l, topic})
    end

    def broadcast(topic, message) do
        :gproc.send({:p, :l, topic}, message)
    end

    # Server API
    def init(args) do
      :gproc.reg({:p, :l, args[:topic]})
      {:ok, []}
    end

    def handle_info(message, state) do
      IO.inspect "Got #{inspect message} in process #{inspect self()}"
      {:noreply, state}
    end
end
