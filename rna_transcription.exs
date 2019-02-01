defmodule RNATranscription do
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> RNATranscription.to_rna('ACTG')
  'UGAC'
  """
  @spec to_rna([char]) :: [char]
  def to_rna(dna) do
    Enum.map(dna, &get_rna_complement/1)
  end

  defp get_rna_complement(strand) do
    case strand do
      ?C -> ?G
      ?G -> ?C
      ?A -> ?U
      ?T -> ?A
    end
  end
end
