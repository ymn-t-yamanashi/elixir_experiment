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

    assert Enum.drop(1..10, 2) == [3, 4, 5, 6, 7, 8, 9, 10]

    # https://hexdocs.pm/elixir/Enum.html#drop_every/2
    assert Enum.drop_every(1001..1010, 2) == [1002, 1004, 1006, 1008, 1010]

    # Enum.drop_while()

    # https://hexdocs.pm/elixir/Enum.html#each/2
    assert Enum.each(1..2, &IO.puts(&1)) == :ok

    # https://hexdocs.pm/elixir/Enum.html#empty?/1
    assert Enum.empty?([]) == true
    assert Enum.empty?([1]) == false

    # https://hexdocs.pm/elixir/Enum.html#fetch/2
    assert Enum.fetch([10, 20, 22], 1) == {:ok, 20}
    assert Enum.fetch([10, 20, 22], 11) == :error

    # Enum.fetch!

    # https://hexdocs.pm/elixir/Enum.html#filter/2
    assert Enum.filter(1..10, fn x -> x > 5 end) == [6, 7, 8, 9, 10]

    # https://hexdocs.pm/elixir/Enum.html#find/3
    assert Enum.find(200..206, fn x -> x > 200 end) == 201

    # https://hexdocs.pm/elixir/Enum.html#find_index/2
    assert Enum.find_index(200..206, fn x -> x > 200 end) == 1

    # https://hexdocs.pm/elixir/Enum.html#find_value/2
    assert Enum.find_value(200..206, fn x -> x == 201 end)

    # https://hexdocs.pm/elixir/Enum.html#flat_map/2
    assert Enum.flat_map([[100, 102], [200, 202]], fn [x, y] -> [x + 1, y + 1] end) == [
             101,
             103,
             201,
             203
           ]

    # https://hexdocs.pm/elixir/Enum.html#flat_map_reduce/3

    # https://hexdocs.pm/elixir/Enum.html#frequencies/1
    assert Enum.frequencies(~w/test hoge test fuga fuga/) == %{
             "fuga" => 2,
             "hoge" => 1,
             "test" => 2
           }

    # https://hexdocs.pm/elixir/Enum.html#frequencies_by/2
    assert Enum.frequencies_by(~w/test abc hoge xyz cde/, &String.length/1) == %{3 => 3, 4 => 2}

    # https://hexdocs.pm/elixir/Enum.html#group_by/3
    assert Enum.group_by(~w{test abc fuga cde}, &String.length/1) == %{
             3 => ["abc", "cde"],
             4 => ["test", "fuga"]
           }

    # https://hexdocs.pm/elixir/Enum.html#fetch/2
    assert Enum.fetch(1..10, 0) == {:ok, 1}

    # https://hexdocs.pm/elixir/Enum.html#fetch!/2
    assert Enum.fetch!(1..10, 0) == 1

    # https://hexdocs.pm/elixir/Enum.html#filter/2
    assert Enum.filter(1000..1010, fn x -> x > 1003 end) == [
             1004,
             1005,
             1006,
             1007,
             1008,
             1009,
             1010
           ]

    # https://hexdocs.pm/elixir/Enum.html#find/2
    assert Enum.find(100..110, fn x -> x == 101 end) == 101

    # https://hexdocs.pm/elixir/Enum.html#find_index/2
    assert Enum.find_index(100..110, fn x -> x == 101 end) == 1

    # https://hexdocs.pm/elixir/Enum.html#find_value/3
    assert Enum.find_value(1..10, fn x -> x == 2 end) == true

    # https://hexdocs.pm/elixir/Enum.html#flat_map/2
    assert [1000..1003, 1005..1007] |> Enum.flat_map(fn x -> x end) == [
             1000,
             1001,
             1002,
             1003,
             1005,
             1006,
             1007
           ]

    # Enum.flat_map_reduce()

    # https://hexdocs.pm/elixir/Enum.html#frequencies/1
    assert Enum.frequencies(["a", "b", "a"]) == %{"a" => 2, "b" => 1}

    # https://hexdocs.pm/elixir/Enum.html#frequencies_by/2
    assert Enum.frequencies_by(~w{ああ いいい かか あ た}, &String.length/1) == %{1 => 2, 2 => 2, 3 => 1}

    # https://hexdocs.pm/elixir/Enum.html#group_by/3
    assert Enum.group_by(~w{ああ いいい かか あ た}, &String.length/1) == %{
             1 => ["あ", "た"],
             2 => ["ああ", "かか"],
             3 => ["いいい"]
           }

    # https://hexdocs.pm/elixir/Enum.html#intersperse/2
    assert Enum.intersperse(~w/a b c d/, "z") == ["a", "z", "b", "z", "c", "z", "d"]

    # https://hexdocs.pm/elixir/Enum.html#into/2
    assert Enum.into(%{a: 1, c: 3}, %{b: 2}) == %{c: 3, a: 1, b: 2}

    # https://hexdocs.pm/elixir/Enum.html#join/2
    assert Enum.join(1..10, ", ") == "1, 2, 3, 4, 5, 6, 7, 8, 9, 10"

    # https://hexdocs.pm/elixir/Enum.html#map/2
    assert Enum.map(1..5, &(&1 * 2)) == [2, 4, 6, 8, 10]

    # https://hexdocs.pm/elixir/Enum.html#map_every/3
    assert Enum.map_every(1..10, 2, &(&1 * 10)) == [10, 2, 30, 4, 50, 6, 70, 8, 90, 10]

    # https://hexdocs.pm/elixir/Enum.html#map_intersperse/3
    assert Enum.map_intersperse(1..3, "A", &(&1 + 1000)) === [1001, "A", 1002, "A", 1003]

    # https://hexdocs.pm/elixir/Enum.html#map_join/3
    assert Enum.map_join(1..5, ",", &(&1 * 2)) == "2,4,6,8,10"

    # https://hexdocs.pm/elixir/Enum.html#map_reduce/3
    assert Enum.map_reduce(1..3, 0, fn x, acc -> {x * acc, acc + 1} end) == {[0, 2, 6], 3}

    # https://hexdocs.pm/elixir/Enum.html#max/1
    assert Enum.max(1..10) == 10

    # https://hexdocs.pm/elixir/Enum.html#max_by/2
    assert Enum.max_by(["a", "aaa", "kkkk", "aa"], fn x -> String.length(x) end) == "kkkk"

    # https://hexdocs.pm/elixir/Enum.html#member?/2
    assert Enum.member?(1..5, 5)

    # https://hexdocs.pm/elixir/Enum.html#min/2
    assert Enum.min(2..5) == 2

    # https://hexdocs.pm/elixir/Enum.html#min_by/4
    assert Enum.min_by(["a", "aaa", "kkkk", "aa"], fn x -> String.length(x) end) == "a"

    # https://hexdocs.pm/elixir/Enum.html#min_max/1
    assert Enum.min_max(1..100) == {1, 100}

    # https://hexdocs.pm/elixir/Enum.html#min_max_by/3
    assert Enum.min_max_by(["jj", "abc", "a", "aaaaax", "asdd"], &String.length/1) ==
             {"a", "aaaaax"}

    # https://hexdocs.pm/elixir/Enum.html#product/1
    assert Enum.product([2, 5, 9]) == 90

    # https://hexdocs.pm/elixir/Enum.html#random/1
    random = Enum.random(10..15)
    assert random >= 10 and random <= 15

    # https://hexdocs.pm/elixir/Enum.html#reduce/2
    assert Enum.reduce(1..10, fn x, acc -> x + acc end) == 55

    # assert Enum.reduce_while()

    # https://hexdocs.pm/elixir/Enum.html#reject/2
    assert Enum.reject(1..3, fn x -> x == 2 end) == [1, 3]
  end
end
