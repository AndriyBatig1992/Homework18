import aiosqlite
import asyncio

class AsyncSQLExecutor:
    def __init__(self, db_file):
        self.db_file = db_file

    async def execute_sql_from_file(self, query_file):
        try:
            async with aiosqlite.connect(self.db_file) as db:
                async with db.execute("PRAGMA foreign_keys=ON"):
                    with open(query_file, 'r') as file:
                        sql_query = file.read()
                    await db.execute(sql_query)
                    await db.commit()
                    async with db.execute(sql_query) as cursor:
                        results = await cursor.fetchall()
                return results
        except aiosqlite.Error as e:
            print(f"aiosqlite error: {e}")
            return None

async def main():
    db_file = 'hw.db'
    sql_executor = AsyncSQLExecutor(db_file)

    query_files = ['query_1.sql', 'query_2.sql', 'query_3.sql', 'query_4.sql', 'query_5.sql','query_6.sql','query_7.sql','query_8.sql',
                   'query_9.sql', 'query_10.sql', 'query_11.sql', 'query_12.sql']

    results_dict = {}

    for i, query_file in enumerate(query_files):
        result = await sql_executor.execute_sql_from_file(query_file)
        if result is not None:
            results_dict[f"Results from query_{i + 1}.sql"] = result

    for query_name, result in results_dict.items():
        print(query_name)
        if len(result) == 0:
            print("No results found.")
        else:
            for row in result:
                if len(row) == 1:
                    print(row[0])
                else:
                    print(" - ".join(map(str, row)))
        print()


if __name__ == "__main__":
    asyncio.run(main())

