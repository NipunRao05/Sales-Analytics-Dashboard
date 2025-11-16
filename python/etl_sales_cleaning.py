import pandas as pd

# Load raw dataset
df = pd.read_csv("../data/raw_sales.csv")

# Standardize column names
df.columns = df.columns.str.strip().str.lower().str.replace(" ", "_")

# Fill missing values
df['quantity'] = df['quantity'].fillna(0)
df['unit_price'] = df['unit_price'].fillna(df['unit_price'].median())
df['discount'] = df['discount'].fillna(0)

# Convert types
df['order_date'] = pd.to_datetime(df['order_date'])

# New calculated metrics
df["gross_amount"] = df["quantity"] * df["unit_price"]
df["net_amount"] = df["gross_amount"] * (1 - df["discount"])

# Remove duplicates
df = df.drop_duplicates()

# Save cleaned dataset
df.to_csv("../data/cleaned_sales.csv", index=False)

print("Cleaned sales data created successfully!")
