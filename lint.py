# /// script
# requires-python = ">=3.14"
# dependencies = [
#     "pandas>=3.0.5",
# ]
# ///

import pandas as pd
from pathlib import Path

HERE = Path(__file__).parent.resolve()
SOURCE_DIRECTORY = HERE.joinpath("src")


def main():
    for path in SOURCE_DIRECTORY.glob("*.tsv"):
        df = pd.read_csv(path, sep="\t")
        df.to_csv(path, sep="\t", index=False)


if __name__ == '__main__':
    main()
