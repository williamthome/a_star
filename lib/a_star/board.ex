defmodule AStar.Board do
  alias AStar.{Node, Point}

  defstruct nodes: []

  @type t :: %__MODULE__{
          nodes: [%Node{}]
        }

  @doc """
  Creates a new board with nodes generated
  by a range of columns and rows.
  """
  def new(n_cols, n_rows),
    do: %__MODULE__{
      nodes: generate_nodes(n_cols, n_rows)
    }

  defp generate_nodes(n_cols, n_rows) do
    for x <- 0..(n_cols - 1), y <- 0..(n_rows - 1) do
      %Node{point: %Point{x: x, y: y}}
    end
  end
end
