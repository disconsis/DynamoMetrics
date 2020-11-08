defmodule DynamoNode do
  @moduledoc """
  A replica node in a dynamo cluster.
  """

  defstruct(
    # node id
    id: nil,
    # local storage of key-(value, clock) pairs
    store: nil,
    # hash ring
    ring: nil,
    # parameters from dynamo
    # for minimum participants in read/write
    n: nil,
    r: nil,
    w: nil,
    # logical clock for versioning
    vector_clock: nil
  )

  @doc """
  Start the node.
  def start(id, store, nodes, n, r, w) do

  Sets up its state,
  starts bg threads for anti-entropy protocol
  then listens for :get and :put requests in a loop
  (updating vector_clock as it goes)
  """
  def start(id, store, nodes) do
    raise "TODO"
  end

  @doc """
  Respond to a :get request for `key`,
  ASSUMING we are the co-ordinator for this key.

  Steps:
  1. Request all versions of data from the top `n` nodes in
       the preference list for key (regardless of whether
       we believe them to be healthy or not).
  3. If multiple versions gathered, remove older ones.
  4. Return all unrelated versions of data.
  2. Wait for r responses.
  """
  def get(state, key) do
    raise "TODO get"
  end

  @doc """
  Respond to a :put request for `key`,
  ASSUMING we are the co-ordinator for this key.

  Steps:
  1. Increment vector_clock
  2. Write to own store
  3. Send {key,value,vector_clock} to top `n` nodes in
       the preference list for key
  4. Wait for responses.
  5. If (w - 1) responses received, return success,
       otherwise failure.
  """
  def put(state, key, value) do
    raise "TODO put"
  end
end
