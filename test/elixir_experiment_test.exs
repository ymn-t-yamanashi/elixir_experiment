defmodule ElixirExperimentTest do
  use ExUnit.Case
  doctest ElixirExperiment

  test "greets the world" do
    assert ElixirExperiment.hello() == :world
  end
end
