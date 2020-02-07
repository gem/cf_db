import argparse
import pandas as pd
import sqlalchemy


def parser():
    parser = argparse.ArgumentParser(description='Export data')
    parser.add_argument('-f', '--filename', type=str,
                        help='json file to write data to')
    parser.add_argument('-d', '--db-url',
                        help='database url')
    parser.add_argument('-t', '--table',
                        help='table to export')
    return parser.parse_args()


def export_to_json(engine, table, fname):
    query = "SELECT * FROM {}".format(table)
    df = pd.read_sql(query, engine)
    return df.to_json(path_or_buf=fname, orient='records')


def main():
    args = parser()
    engine = sqlalchemy.create_engine(args.db_url)
    export_to_json(engine, args.table, args.filename)

if __name__ == '__main__':
    main()
