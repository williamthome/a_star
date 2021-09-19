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

  test "neighbors/3 returns only valid neighbors from a node" do
    node = %Node{point: %Point{x: 1, y: 1}}

    neighbors = node |> Node.neighbors()

    assert neighbors |> length == 8
    refute node in neighbors
  end

  test "lower_f/2 returns the node closest neighbor from the destination" do
    node = %Node{point: %Point{x: 0, y: 0}}
    destination = %Node{point: %Point{x: 2, y: 2}}

    closest_neighbor = node |> Node.lower_f(destination)
    expected_neighbor = %Node{point: %Point{x: 1, y: 1}}

    assert closest_neighbor == expected_neighbor
  end
end
