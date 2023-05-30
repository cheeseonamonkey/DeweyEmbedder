# DeweyEmbedder
*(generating semantic embeddings for Dewey decimal system; to be used in a larger project)*


The SQL script creates a database for storing metadata about the Dewey Decimal System. It includes tables for classes, divisions, sections, and call numbers, with columns for name, description, embedding, and foreign keys for relationships between the tables. The script also inserts sample data into the tables.

most IDs of the hierarchy is referred to with 3 full digits (with zero for nulls), for example:

classes: 200
divisions: 230
sections: 236
The CallNumbers table has a composite primary key consisting of sectionId and category columns, which together uniquely identify each row in the table, for example:

call number PK: (236, 13) for 236.13
