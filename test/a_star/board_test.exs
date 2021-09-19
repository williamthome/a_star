defmodule AStar.BoardTest do
  use ExUnit.Case, async: true

  alias AStar.{Board, Node, Point}

  test "new/2 generates a board with nodes" do
    board = Board.new(2, 2)

    expected_nodes = [
      %Node{point: %Point{x: 0, y: 0, z: 0}},
      %Node{point: %Point{x: 0, y: 1, z: 0}},
      %Node{point: %Point{x: 1, y: 0, z: 0}},
      %Node{point: %Point{x: 1, y: 1, z: 0}}
    ]

    assert board.nodes == expected_nodes
  end
end
