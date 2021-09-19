defmodule AStar.NodeTest do
  use ExUnit.Case, async: true

  alias AStar.{Node, Point}

  test "distance/2 returns the distance between two nodes" do
    n1 = %Node{point: %Point{x: 0}}
    n2 = %Node{point: %Point{x: 1}}

    result = Node.distance(n1, n2)
    expected_result = 1

    assert result == expected_result
  end

  test "f_score/2 returns the sum of two distances (g_score and h)" do
    current = %Node{point: %Point{x: 0}}
    next = %Node{point: %Point{x: 1}}
    destination = %Node{point: %Point{x: 2}}

    result = Node.f_score(current, next, destination)
    expected_result = 2

    assert result == expected_result
  end
end
