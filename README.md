# Pubsub

Publish-Subscribe in Elixir.

## Setup

```
git clone git@github.com:yosriady/pubsub.git
cd pubsub
mix deps.get
mix deps.compile
iex -S mix
```

## Try it

```
iex> GenServer.start_link(Pubsub, [], [])
{:ok, #PID<0.141.0>}
iex> GenServer.start_link(Pubsub, [], [])
{:ok, #PID<0.143.0>}
iex> :gproc.send({:p, :l, :hello}, "hey")
"Got \"hey\" in process #PID<0.141.0>"
"hey"
"Got \"hey\" in process #PID<0.143.0>"
```
