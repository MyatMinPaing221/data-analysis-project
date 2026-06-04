import pandas as pd

df = pd.read_excel("Excel_Test.xlsx")
print(df.shape)
print(df.head())

print(df.shape)
print(df.info())
print(df.describe())

for col in ['Nation', 'Product Name', 'Payment Method', 'Order Status']:
    print(f"\n--- {col} ---")
    print(df[col].value_counts())