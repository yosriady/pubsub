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
iex> Pubsub.subscribe(:test)
{:ok, #PID<0.141.0>}
iex> Pubsub.subscribe(:test)
{:ok, #PID<0.143.0>}
iex> Pubsub.broadcast(:test, "hey")
"hey"
"Got \"hey\" in process #PID<0.141.0>"
"Got \"hey\" in process #PID<0.143.0>"
iex> Pubsub.subscribers(:test)
[#PID<0.141.0>, #PID<0.143.0>]
```

## Reference

Pubsub relies on [`gproc`](https://github.com/uwiger/gproc/wiki/The-gproc-api), which does most of the heavy lifting.

[Full `gproc` API Reference](https://github.com/uwiger/gproc/blob/master/doc/gproc.md)

[GProc - Erlang Global Process Registry](http://blog.rusty.io/2009/09/16/g-proc-erlang-global-process-registry/)
