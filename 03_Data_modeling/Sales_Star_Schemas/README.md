# WWI Sales Data Model — Summary

## What was built

The supplied WWI.zip dataset was unpacked and modeled as a star schema. FactSale is the fact table at the grain of one sales line, while DimCustomer and DimCity are descriptive dimension tables. The workbook contains cleaned source tables, key and relationship documentation, a schema diagram, validation results, and pivot-style summaries by city and customer.

## Keys and relationships

| Dimension | Primary/unique key | Fact foreign key | Cardinality | Validation |
|---|---|---|---|---|
| DimCustomer | Customer Key | FactSale.Customer Key | 1-to-many | 402 unique dimension keys; 0 unmatched fact rows |
| DimCity | City Key | FactSale.City Key | 1-to-many | 13,028 unique dimension keys; 0 unmatched fact rows |

`FactSale[Sale Key]` is unique across all 26,397 rows.

## Data-quality notes

1. The two dimension keys contain no duplicates, and all foreign keys in the fact table resolve successfully.
2. The city name itself is not a suitable key because city names repeat; the model correctly uses `City Key`.
3. `DimCustomer.csv` contained an extra title/metadata row before the true header. That row was removed during import; the cleaned table has 402 customer records including the Unknown member.

## Analysis output

The `Pivot Analysis` worksheet provides a Pivot-style summary of transactions, quantity, sales, and profit by the top 25 cities and top 25 customers. It is intended to test the model and can be replaced with a native Excel PivotTable after loading the three Excel Tables into Excel Data Model/Power Pivot.

