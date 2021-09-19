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
end
