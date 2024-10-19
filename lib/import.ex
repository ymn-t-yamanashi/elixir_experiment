defmodule Import do
  import Enum

  def test1 do
    1..10
    |> map(&(&1 * 2))
    |> IO.inspect()
  end
end
