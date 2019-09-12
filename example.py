#!/usr/bin/env python

import psycopg2
import os
import sys

DBHOST = os.getenv("DBHOST", "mycluster.xxxxxxxx11xx.us-east-1.redshift.amazonaws.com")
DBUSER = os.getenv("DBUSER", "my_redshift_user")
DBPASS = os.getenv("DBPASS", "")
DBNAME = os.getenv("DBNAME", "my_redshift_db")


def main():
    if DBPASS == "":
        print(
            "Set DBPASS environment variable prior to running this script to allow the script to connect."
        )
        sys.exit(1)

    try:
        conn = psycopg2.connect(
            dbname=DBNAME, user=DBUSER, host=DBHOST, password=DBPASS, port=5439
        )
        print(f"Connected to {DBHOST}")
    except Exception as e:
        print(f"Unable to connect to {DBHOST}")
        raise e


if __name__ == "__main__":
    main()
