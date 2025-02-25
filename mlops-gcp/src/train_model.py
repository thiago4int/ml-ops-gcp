import os
from google.cloud import aiplatform

PROJECT_ID = os.getenv("PROJECT_ID")
REGION = os.getenv("REGION")

aiplatform.init(project=PROJECT_ID, location=REGION)

dataset = aiplatform.TabularDataset("projects/{}/locations/{}/datasets/YOUR_DATASET_ID".format(PROJECT_ID, REGION))

model = aiplatform.Model(
    display_name="sales-demand-model",
    dataset=dataset,
    training_fraction_split=0.8,
    validation_fraction_split=0.1,
    test_fraction_split=0.1,
)

job = model.train(
    model_display_name="sales-demand-model",
    training_container_uri="gcr.io/cloud-aiplatform/training/tf-cpu.2-1:latest",
)

model.upload(serving_container_image_uri="gcr.io/cloud-aiplatform/prediction/tf2-cpu.2-1:latest")