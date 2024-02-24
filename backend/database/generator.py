import re
import random
from datetime import datetime, timedelta

# Function to parse a SQL file and extract table creation statements
def parse_sql_file(sql_file_path):
    with open(sql_file_path, 'r') as file:
        sql_content = file.read()
        
    # Regex to find CREATE TABLE statements
    table_creations = re.findall(r'CREATE TABLE IF NOT EXISTS\s+"?(\w+)"?\s*\(\s*([^;]*)\s*\);', sql_content, re.IGNORECASE)
    
    tables = {}
    for table_name, columns in table_creations:
        columns = columns.split(',')
        if columns[0].strip() != '':
            columns = [col.strip().split()[:2] for col in columns] # Assuming format "COLUMN_NAME DATA_TYPE"
        else:
            columns = []  # No columns specified
        tables[table_name] = columns
    return tables

# Function to generate mock data based on data type
def generate_mock_data(data_type):
    if "INT" in data_type:
        return random.randint(1, 100000000)
    if "SERIAL" in data_type:
        return random.randint(1, 100000000000000)
    elif "VARCHAR" in data_type:
        return f"'mock_data_{random.randint(1, 10000000)}'"
    elif "TEXT" in data_type:
        return f"'mock_data_{random.randint(1, 1000000000)}'"
    elif "DATE" in data_type:
        date = datetime.now().date()
        return f"'{date}'"
    elif "FLOAT" in data_type:
        return round(random.uniform(1, 10000000), 2)
    elif "BOOLEAN" in data_type:
        return random.choice([True, False])
    elif "TIMESTAMP" in data_type:
        date = datetime.now() - timedelta(days=random.randint(1, 365), hours=random.randint(1, 24), minutes=random.randint(1, 60), seconds=random.randint(1, 60))
        return f"'{date}'"
    else:
        return "NULL"

# Function to generate INSERT statements for each table
def generate_insert_statements(tables, num_rows=10):
    insert_statements = []
    for table_name, columns in tables.items():
        for _ in range(num_rows):
            column_names = ", ".join([col[0] for col in columns])
            values = ", ".join([str(generate_mock_data(col[1])) for col in columns])
            insert_statement = f"INSERT INTO {table_name} ({column_names}) VALUES ({values});"
            insert_statements.append(insert_statement)
    return insert_statements

# Main function to run the parser and generator
def main(sql_file_path):
    tables = parse_sql_file(sql_file_path)
    insert_statements = generate_insert_statements(tables)
    for statement in insert_statements:
        print(statement)

# Assuming SQL file is named 'database.sql'
sql_file_path = 'database.sql'
main(sql_file_path)
