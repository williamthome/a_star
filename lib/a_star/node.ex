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
end
