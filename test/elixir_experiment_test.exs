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

    assert Enum.chunk_by(1..6, &(rem(&1, 3) == 0)) == [[1, 2], [3], [4, 5], [6]]

    assert Enum.chunk_every(1..6, 2) == [[1, 2], [3, 4], [5, 6]]

    assert Enum.chunk_every(1..7, 2, 1, [900]) == [
             [1, 2],
             [2, 3],
             [3, 4],
             [4, 5],
             [5, 6],
             [6, 7],
             [7, 900]
           ]

    assert Enum.chunk_every(1000..1012, 2, 4) == [
             [1000, 1001],
             [1004, 1005],
             [1008, 1009],
             [1012]
           ]

    # Enum.chunk_while(enumerable, acc, chunk_fun, after_fun)

    assert Enum.concat(1000..1003, 1006..1008) == [1000, 1001, 1002, 1003, 1006, 1007, 1008]

    assert Enum.count(1..10) == 10

    assert Enum.count_until(100..200, 10) == 10

    assert Enum.dedup([1, 2, 3, 3, 4, 5, 5]) == [1, 2, 3, 4, 5]

    assert Enum.dedup_by(1..10, fn x -> x > 2 end) == [1, 3]
  end
end
