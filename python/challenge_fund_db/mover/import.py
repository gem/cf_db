import argparse
import pandas as pd
import sqlalchemy

DESCRIPTION = """
Import data from a JSON file to a database table.
For example running it like

python python/import.py -f $table_content.json -t $table-name \
 -d postgres://pg_user:pg_password@pg_host:pg_port/pg_db_name

Will import data from the json file to the given table."""


def parser():
    parser = argparse.ArgumentParser(description='Import data')
    parser.add_argument('-f', '--filename', type=str, required=True,
                        help='json file containing the data to import')
    parser.add_argument('-d', '--db-url', type=str, required=True,
                        help='database url')
    parser.add_argument('-t', '--table', type=str, required=True,
                        help='table to write to')
    return parser.parse_args()


def import_from_json(engine, table, fname):
    df = pd.read_json(fname, orient='records')
    df.to_sql(table, engine, if_exists='append', index=False)


def main():
    args = parser()
    engine = sqlalchemy.create_engine(args.db_url)
    import_from_json(engine, args.table, args.filename)

if __name__ == '__main__':
    main()
