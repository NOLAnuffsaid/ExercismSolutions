defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    sentence
    |> String.downcase()
    |> String.split(~r/(\s|_)/u, trim: true)
    |> do_count()
  end

  defp do_count(words) do
    Enum.reduce(words, %{}, fn w, acc ->
      if word?(w) do
        Map.update(acc, clean_string(w), 1, &(&1 + 1))
      else
        acc
      end
    end)
  end

  defp word?(str) do
    String.match?(str, ~r/^\w/)
  end

  defp clean_string(str) do
    String.replace(str, ~r/[^-\w]/u, "")
  end
end
