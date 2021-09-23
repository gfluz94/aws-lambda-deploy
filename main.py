import os
import json
import sklearn
import boto3
import pandas as pd
import numpy as np
import json
import dill
import warnings
warnings.filterwarnings(action='ignore')

S3_BUCKET_NAME = os.getenv("S3_BUCKET_NAME")
MODEL_ARTIFACT_NAME = os.getenv("MODEL_ARTIFACT_NAME")

s3 = boto3.client('s3')
s3_bucket = S3_BUCKET_NAME
model_name = MODEL_ARTIFACT_NAME
temp_file_path = '/tmp/' + model_name

s3.download_file(s3_bucket, model_name, temp_file_path)
with open(temp_file_path, 'rb') as f:
    print("Importing model...")
    model = dill.load(f)
    print("Model successfully imported!")

def add_new_features(df: pd.DataFrame) -> pd.DataFrame:
    assert isinstance(df, pd.DataFrame), "`df` should be a pandas dataframe"
    preffixes = [
        "sum_capital_paid_account", "num_arch_dc", "num_arch_ok"
    ]
    df_ = df.copy()
    for preff in preffixes:
        df_.loc[:, f"{preff}_ratio"] = df_.loc[:, f"{preff}_12_24m"] / df_.loc[:, f"{preff}_0_12m"]
        df_.loc[:, f"{preff}_ratio"] = df_.loc[:, f"{preff}_ratio"].fillna(0)
        df_.loc[np.isinf(df_.loc[:, f"{preff}_ratio"]), f"{preff}_ratio"] = \
                         df_.loc[np.isfinite(df_.loc[:, f"{preff}_ratio"]), f"{preff}_ratio"].max()
    return df_


def lambda_handler(event, context):

    body = event['body']
    input = json.loads(body)['data']
    df = pd.DataFrame(input, index=[0])
    X = add_new_features(df.iloc[:, 1:])
    print(X)

    prediction = model.predict_proba(X)
    print(prediction)
    
    return {
        "statusCode": 200,
        "body": json.dumps({
            "uuid": str(df.iloc[0, 0]),
            "pd": prediction[0, 1],
        }),
    }