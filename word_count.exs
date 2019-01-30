defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    sentence
    |> String.downcase()
    |> String.split(~r/[^[:alnum:]\-]/u, trim: true)
    |> do_count()
  end

  defp do_count(words) do
    Enum.reduce(words, %{}, fn w, acc -> Map.update(acc, w, 1, &(&1 + 1)) end)
  end
end
