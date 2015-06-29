def protein(rna)
  str = ""
  rna_array = rna.scan(/.../)
  rna_array.each do |triple|
    str << $codons[triple] unless $codons[triple] == 'Stop'
  end
  str
end