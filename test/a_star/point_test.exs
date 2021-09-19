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

  test "valid_position?/2 returns true" do
    p = %Point{x: 3, y: 2, z: 0}
    min_x = 0
    max_x = 3
    min_y = 0
    max_y = 5
    min_z = 0
    max_z = 0

    result = Point.valid_position?(p, min_x, max_x, min_y, max_y, min_z, max_z)
    expected_result = true

    assert result == expected_result
  end
end
