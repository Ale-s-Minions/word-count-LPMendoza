defmodule WordCount do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do

    #Se obtiene el array con cada palabra
    #del string si caracteres raros y en minusculas y
    #se guarda en words

    words = sentence
    |> String.downcase()
    |> String.replace(~r/@|#|\$|%|&|\^|:|_|!|,/u, " ")
    |> String.split()

    #Con reduce se realiza una función por cada elemento de words
    #Cada palabra se agrega como key en el map que se puso en el enumerable de reduce
    # Map.put_new() agrega la key solo si no existe
    # despues que se agrego la key se actualiza el valor de la key sumandole uno al valor de la key
    # con una función.
    words
    |> Enum.reduce(%{}, fn word, map ->
      map
      |> Map.put_new(word, 0)
      |> Map.update!(word, fn count -> count + 1 end)
      end)
  end
end
