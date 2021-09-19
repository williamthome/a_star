defmodule AStar.Point do
  defstruct x: 0, y: 0, z: 0

  @type t :: %__MODULE__{
          x: number(),
          y: number(),
          z: number()
        }

  @spec distance(t, t) :: number

  @doc """
  The distance between two points.
  """
  def distance(%__MODULE__{x: x1, y: y1, z: z1}, %__MODULE__{x: x2, y: y2, z: z2}) do
    :math.sqrt(:math.pow(x2 - x1, 2) + :math.pow(y2 - y1, 2) + :math.pow(z2 - z1, 2))
  end
end
