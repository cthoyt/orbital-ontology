format:
    npx --yes prettier --check --prose-wrap always --write '**/*.md'

convert:
    robot template \
      --prefix "CHEBI: http://purl.obolibrary.org/obo/CHEBI_" \
      --prefix "ORBITAL: http://w3id.org/biopragmatics/orbital/term/" \
      --prefix "ChEMROF: https://chemkg.github.io/chemrof/" \
      --template src/orbitals.tsv \
      --output src/tmp.owl
    robot merge \
      --input src/metadata.ofn \
      --input src/tmp.owl \
      --output orbital.owl
