format:
    uv run --script lint.py
    npx --yes prettier --check --prose-wrap always --write '**/*.md'

convert:
    robot template \
      --add-prefix "CHEBI: http://purl.obolibrary.org/obo/CHEBI_" \
      --add-prefix "ORBITAL: http://w3id.org/biopragmatics/orbital/term/" \
      --add-prefix "ChEMROF: https://chemkg.github.io/chemrof/" \
      --template src/roots.tsv \
      --template src/properties.tsv \
      --template src/terms.tsv \
      --output src/tmp.owl
    robot merge \
      --add-prefix "CHEBI: http://purl.obolibrary.org/obo/CHEBI_" \
      --add-prefix "ORBITAL: http://w3id.org/biopragmatics/orbital/term/" \
      --add-prefix "ChEMROF: https://chemkg.github.io/chemrof/" \
      --input src/metadata.ofn \
      --input src/tmp.owl \
      --output orbital.obo \
      --output orbital.json \
      --output orbital.owl
