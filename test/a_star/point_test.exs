defmodule AStar.PointTest do
  use ExUnit.Case, async: true

  alias AStar.Point

  test "distance/2 returns the distance between two points" do
    p1 = %Point{x: 0}
    p2 = %Point{x: 1}

    result = Point.distance(p1, p2)
    expected_result = 1

    assert result == expected_result
  end
end
