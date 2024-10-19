defmodule ElixirExperimentTest do
  use ExUnit.Case
  doctest ElixirExperiment

  test "greets the world" do
    assert ElixirExperiment.hello() == :world
  end

  test "test" do
    assert 1 + 1 == 2
    assert 2 == 1 + 1

    [a, b] = [1, 2]
    assert a == 1
    assert b == 2

    # Enum
    refute Enum.all?([true, false, true])
    assert Enum.all?([true, true, true])

    assert Enum.any?([true, false, true])
    refute Enum.any?([false, false, false])

    assert Enum.at(1..10, 0) == 1
  end
end
