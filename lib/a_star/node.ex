defmodule AStar.Node do
  alias AStar.Point

  defstruct point: %Point{}

  @type t :: %__MODULE__{
          point: Point.t()
        }

  @spec distance(t, t) :: number()

  @doc """
  The distance between two nodes.
  """
  def distance(%__MODULE__{} = n1, %__MODULE__{} = n2),
    do: Point.distance(n1.point, n2.point)

  @spec f_score(t, t, t) :: number()

  @doc """
  Represents the best guess to how short a path from start to finish can be.
  """
  def f_score(
        %__MODULE__{} = current,
        %__MODULE__{} = next,
        %__MODULE__{} = destination
      ) do
    g_score = distance(current, next)
    h = distance(next, destination)
    g_score + h
  end

  @spec neighbors(t, number(), number()) :: [t]
  @spec neighbors(t, nil, nil) :: [t]

  @doc """
  The neighbors from a node.
  """
  def neighbors(
        %__MODULE__{point: %Point{x: node_x, y: node_y}} = node,
        max_x \\ nil,
        max_y \\ nil
      ) do
    min_x_range = node_x - 1
    max_x_range = node_x + 1
    min_y_range = node_y - 1
    max_y_range = node_y + 1

    x_range = min_x_range..max_x_range
    y_range = max_y_range..min_y_range

    neighborhood =
      for x <- x_range, y <- y_range do
        %__MODULE__{point: %Point{x: x, y: y}}
      end

    neighborhood
    |> Enum.filter(&valid_neighbor?(&1, node, max_x, max_y))
  end

  defp valid_neighbor?(neighbor, node, max_x, max_y) do
    neighbor != node and
      neighbor |> valid_position?(max_x, max_y)
  end

  defp valid_position?(%__MODULE__{}, nil, nil), do: true

  defp valid_position?(%__MODULE__{} = node, max_x, max_y),
    do: Point.valid_position?(node.point, 0, max_x, 0, max_y, 0, 0)

  @spec lower_f(t, t) :: t

  @doc """
  The node closest neighbor from the destination.
  """
  def lower_f(%__MODULE__{} = node, %__MODULE__{} = destination),
    do:
      node
      |> neighbors
      |> Enum.min_by(&f_score(node, &1, destination))
end
